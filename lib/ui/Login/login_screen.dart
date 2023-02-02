import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:souq_4_shop_online/ui/Widget/bottons.dart';
import 'package:souq_4_shop_online/ui/Widget/text_form_field.dart';
import 'package:souq_4_shop_online/ui/Widget/text_label.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'login';
  LoginScreen({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Text(
              'Welcome Back To Route',
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700
              ),
            ),
            Text(
              'Please sign in with your mail',
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w200
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [

                      const DefaultTextLabel(textLabel: 'User Name'),
                      DefaultTextFormField(
                        context: context,
                        controller: userNameController,
                        keyboardType: TextInputType.name,
                        prefix: FontAwesomeIcons.signature,
                        validate: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your user name';
                          }
                          return null;
                        },
                        hint: 'enter your name',
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
                          if (confirmPasswordController != passwordController) {
                            return 'password isn\'t same';
                          }
                          return null;
                        },
                        hint: 'enter your password',
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
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                ),
                                onPressed: () {},
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
    );
  }

  void loginValidate() {
    if (formKey.currentState?.validate() == false) {
      return;
    }
  }
}
