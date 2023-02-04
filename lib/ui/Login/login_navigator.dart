import 'dart:ui';

abstract class LoginNavigator {
  void hideDialog();

  void showMessage(
    String message, {
    bool isDismissible = true,
    String? posActionTitle,
    VoidCallback? posAction,
    String? negActionTitle,
    VoidCallback? negAction,
  });

  void showLoadingDialog(
    String message, {
    bool isDismissible = true,
  });
}
