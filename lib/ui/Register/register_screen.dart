import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:souq_4_shop_online/apis/api_manager.dart';
import 'package:souq_4_shop_online/components/adaptive/dialog.dart';
import 'package:souq_4_shop_online/ui/Widget/bottoms.dart';
import 'package:souq_4_shop_online/ui/Widget/text_form_field.dart';
import 'package:souq_4_shop_online/ui/Widget/text_label.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
          children: [
            Image.asset(
              'assets/images/route_banner.png',
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const DefaultTextLabel(textLabel: 'Full Name'),
                      DefaultTextFormField(
                        context: context,
                        controller: userNameController,
                        keyboardType: TextInputType.name,
                        prefix: FontAwesomeIcons.signature,
                        validate: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your full name';
                          }
                          return null;
                        },
                        hint: 'Enter your full name',
                      ),
                      const DefaultTextLabel(textLabel: 'Mobile Number'),
                      DefaultTextFormField(
                        context: context,
                        controller: mobileNumberController,
                        keyboardType: TextInputType.phone,
                        prefix: FontAwesomeIcons.phone,
                        validate: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your mobile number';
                          }
                          return null;
                        },
                        hint: 'Enter your mobile no.',
                      ),
                      const DefaultTextLabel(textLabel: 'Email Address'),
                      DefaultTextFormField(
                        context: context,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        prefix: FontAwesomeIcons.envelope,
                        validate: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter email address';
                          }
                          return null;
                        },
                        hint: 'Enter your email address',
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
                          if (confirmPasswordController.text !=
                              passwordController.text) {
                            return 'password isn\'t same';
                          }
                          return null;
                        },
                        hint: 'Enter password',
                        suffix: Icons.remove_red_eye_outlined,
                      ),
                      const DefaultTextLabel(
                          textLabel: 'Confirmation Password'),
                      DefaultTextFormField(
                        context: context,
                        controller: confirmPasswordController,
                        keyboardType: TextInputType.visiblePassword,
                        prefix: FontAwesomeIcons.lock,
                        isPassword: true,
                        validate: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please re-enter password';
                          }
                          if (confirmPasswordController.text !=
                              passwordController.text) {
                            return "password isn't same";
                          }
                          return null;
                        },
                        hint: 'Re-enter password',
                        suffix: Icons.remove_red_eye_outlined,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DefaultButton(
                        text: 'Sign up',
                        function: () {
                          registerValidate();
                        },
                      ),
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

  void registerValidate() async {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    MyDialog.showLoadingDialog(context, 'Loading...');
    try {
      var response = await ApisManager.register(
          userNameController.text,
          mobileNumberController.text,
          passwordController.text,
          confirmPasswordController.text,
          emailController.text);
      MyDialog.hideDialog(context);
      if (response.errors != null) {
        MyDialog.showMessage(context, response.joinErrors(),
            posActionTitle: 'Ok');
        return;
      } else {
        MyDialog.showMessage(context, 'Sign Up is Successfully',
            posActionTitle: 'Ok');
      }
    } catch (error) {
      MyDialog.hideDialog(context);
      MyDialog.showMessage(context, 'Error ,$error');
    }
  }
}