import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:souq_4_shop_online/components/adaptive/dialog.dart';
import 'package:souq_4_shop_online/ui/Login/login_navigator.dart';
import 'package:souq_4_shop_online/ui/Login/login_view_model.dart';
import 'package:souq_4_shop_online/ui/Register/register_screen.dart';
import 'package:souq_4_shop_online/ui/Widget/bottoms.dart';
import 'package:souq_4_shop_online/ui/Widget/text_form_field.dart';
import 'package:souq_4_shop_online/ui/Widget/text_label.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements LoginNavigator {
  var formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  LoginViewModel viewModel = LoginViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 20,
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/images/route_banner.png',
              ),
              const SizedBox(
                height: 68,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Welcome Back To Route',
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'Please sign in with your mail',
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w200),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const DefaultTextLabel(textLabel: 'User Name'),
                        DefaultTextFormField(
                          context: context,
                          controller: emailController,
                          keyboardType: TextInputType.name,
                          prefix: FontAwesomeIcons.signature,
                          validate: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter your user name';
                            }
                            return null;
                          },
                          hint: 'Enter your name',
                        ),
                        const DefaultTextLabel(textLabel: 'Password'),
                        DefaultTextFormField(
                          context: context,
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          isPassword: true,
                          prefix: FontAwesomeIcons.lock,
                          validate: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter password';
                            }
                            return null;
                          },
                          hint: 'Enter your password',
                          suffix: Icons.remove_red_eye_outlined,
                        ),
                        TextButton(
                            style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                alignment: Alignment.topRight),
                            onPressed: () {},
                            child: Text(
                              'Forgot Password?',
                              style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            )),
                        DefaultButton(
                            text: 'Login',
                            function: () {
                              loginValidate();
                            },
                            isUpperCase: false),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don’t have an account?',
                                style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              TextButton(
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                  ),
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, RegisterScreen.routeName);
                                  },
                                  child: Text(
                                    'Create Account',
                                    style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loginValidate() async {
    if (formKey.currentState?.validate() == false) {
      return;
    }

    viewModel.login(emailController.text, passwordController.text);
  }

  @override
  void hideDialog() {
    MyDialog.hideDialog(context);
  }

  @override
  void showLoadingDialog(String message, {bool isDismissible = true}) {
    MyDialog.showLoadingDialog(context, message, isDismissible: isDismissible);
  }

  @override
  void showMessage(String message,
      {bool isDismissible = true,
      String? posActionTitle,
      VoidCallback? posAction,
      String? negActionTitle,
      VoidCallback? negAction}) {
    MyDialog.showMessage(
      context,
      message,
      isDismissible: isDismissible,
      posAction: posAction,
      posActionTitle: posActionTitle,
      negAction: negAction,
      negActionTitle: negActionTitle,
    );
  }
}
