import 'package:flutter/material.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';

class GoogleAuthWebview extends StatefulWidget {
  final String initialUrl;
  final Function(String) onSuccess;
  final Function(String) onError;

  const GoogleAuthWebview({
    super.key,
    required this.initialUrl,
    required this.onSuccess,
    required this.onError,
  });

  @override
  State<GoogleAuthWebview> createState() => _GoogleAuthWebviewState();
}

class _GoogleAuthWebviewState extends State<GoogleAuthWebview> {
  late final PlatformWebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PlatformWebViewController(
      const PlatformWebViewControllerCreationParams(),
    )
      ..setJavaScriptMode(JavaScriptMode.disabled)
      // ..setNavigationDelegate(
      //   NavigationDelegate(
      //     onNavigationRequest: (NavigationRequest request) {
      //       _handleUrl(request.url);
      //       return NavigationDecision.navigate;
      //     },
      //   ),
      // )
      ..loadRequest(
        LoadRequestParams(
          uri: Uri(
            scheme: 'https',
            host: 'dart.dev',
            path: '/guides/libraries/library-tour',
            fragment: 'numbers',
          ),
        ),
      );
  }

  void _handleUrl(String url) {
    if (url.startsWith('https://api.isomorphiq.com/google/verify')) {
      final uri = Uri.parse(url);
      final code = uri.queryParameters['code'];
      final error = uri.queryParameters['error'];

      if (code != null) {
        widget.onSuccess(code);
        Navigator.pop(context);
      } else if (error != null) {
        widget.onError(error);
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Google Authentication')),
      body: PlatformWebViewWidget(
        PlatformWebViewWidgetCreationParams(controller: _controller),
      ).build(context),
    );
  }
}
