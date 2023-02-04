import 'package:flutter/material.dart';
import 'package:souq_4_shop_online/apis/api_manager.dart';
import 'package:souq_4_shop_online/ui/Login/login_navigator.dart';

class LoginViewModel extends ChangeNotifier {
  LoginNavigator? navigator;

  void login(String email, String password) async {
    navigator?.showLoadingDialog('Loading...');
    try {
      var response = await ApisManager.login(password, email);
      navigator?.hideDialog();
      if (response.message != null) {
        navigator?.showMessage(response.message ?? '', posActionTitle: 'Ok');
        return;
      } else {
        navigator?.showMessage(
          'Login is Successfully',
          posActionTitle: 'Ok',
        );
      }
    } catch (error) {
      navigator?.hideDialog();
      navigator?.showMessage('Error ,$error');
    }
  }
}
