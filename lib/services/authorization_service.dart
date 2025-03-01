import 'dart:async';
import 'dart:js_interop';

@JS('window')
external Window get window;

@JS()
@staticInterop
class Window {}

@JS()
@staticInterop
class MessageEvent {}

/// Extension for `Window` to provide interop functions.
extension WindowExtension on Window {
  external WindowInstance? open(String url, String target, String features);
  external void addEventListener(String type, JSExportedDartFunction listener);
}

/// Extension for `MessageEvent` to extract response `data`.
extension MessageEventExtension on MessageEvent {
  external String get data;
}

@JS()
@staticInterop
class WindowInstance {}

/// Extension to check if the window is closed.
extension WindowInstanceExtension on WindowInstance {
  external bool? get closed;
}

class AuthorizationService {
  late Completer<bool> _completer;
  WindowInstance? authWindow;

  /// Opens the authentication window and listens for a response.
  Future<bool> authenticate(String authUrl) {
    _completer = Completer<bool>();

    // Open the authentication popup
    authWindow = window.open(authUrl, '_blank', 'width=500,height=600');

    // Start checking if the window is closed manually
    _pollWindowClosed();

    // Register listener for authentication response
    window.addEventListener('message', _onAuthResponse.toJS);

    return _completer.future;
  }

  /// Handles authentication response
  @JSExport()
  void _onAuthResponse(MessageEvent event) {
    if (!_completer.isCompleted) {
      _completer.complete(event.data == 'success');
    }
  }

  /// Checks periodically if the authentication window was closed manually
  void _pollWindowClosed() {
    Timer.periodic(Duration(milliseconds: 500), (timer) {
      if (authWindow?.closed == true) {
        timer.cancel();
        if (!_completer.isCompleted) {
          _completer.complete(false); // Resolve as failure
        }
      }
    });
  }
}
