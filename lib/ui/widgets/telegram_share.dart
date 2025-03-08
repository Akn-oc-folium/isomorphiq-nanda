import 'package:telegram_web_app/telegram_web_app.dart';

class TelegramShare {
  static Future<void> shareInviteLink(String userId) async {
    // Example: Link to your Bot with a referral parameter
    const botUsername = 'isomorph_bot';
    final inviteLink = 'https://t.me/$botUsername/isomorphiq';
    final message = 'Join this awesome Mini App! $inviteLink';

    // 1) Try Telegram deep link (to open "Share" in Telegram)
    final tgUrl = Uri.encodeFull('tg://msg?text=$message');

    // 2) If that fails (or you need an alternative approach), fallback to web sharing:
    final webShareUrl =
        Uri.encodeFull('https://t.me/share/url?url=$inviteLink');

    // We’re inside the Telegram Mini App, so we can attempt opening “tg://” with the in-app browser
    try {
      // Open links in Telegram’s in-app browser:
      TelegramWebApp.instance.openLink(tgUrl);
    } catch (e) {
      // Fallback if "tg://" doesn’t work
      TelegramWebApp.instance.openLink(webShareUrl);
    }
  }
}
