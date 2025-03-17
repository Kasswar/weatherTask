import 'package:bot_toast/bot_toast.dart';

class Toast {
  Toast._();
  static void showLoading(
      {BackButtonBehavior backButtonBehavior = BackButtonBehavior.ignore}) {
    BotToast.showLoading(
      duration: const Duration(seconds: 1),
      backButtonBehavior: backButtonBehavior,
    );
  }

  static closeAllLoading() {
    BotToast.closeAllLoading();
  }

  static void showText({required String text}) {
    BotToast.showText(text: text);
  }
}
