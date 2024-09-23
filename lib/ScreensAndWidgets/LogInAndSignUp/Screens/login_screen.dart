import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:paris_janitor/Api/ViewModels/LoginViewModel.dart';
import 'package:paris_janitor/Commons/Widgets/buttons/common_elevated_rounded_button.dart';
import 'package:paris_janitor/Commons/Widgets/form_text_Field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../Widgets/LogInWidgets/login_top.dart';
import '../Widgets/LogInWidgets/welcome_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.mail});

  final String mail;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginViewModel lgv = LoginViewModel();
  final TextEditingController controller = TextEditingController();
  late bool passwordIncorect = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const LoginTop(),
            const Divider(
              thickness: 1.5,
              color: Colors.grey,
            ),
            WelcomeWidget(
              controller: controller,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 28.0,
                bottom: 24.0,
              ),
              child: FormTextField(
                textFieldValue: AppLocalizations.of(context)!.password,
                controller: controller,
                isPassword: true,
              ),
            ),
            if (passwordIncorect)
               Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: 8.0,
                  bottom: 8.0,
                ),
                child: Text(
                  AppLocalizations.of(context)!.incorrect_password,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 16.0,
                bottom: 24.0,
              ),
              child: CommonElevatedRoundedButton(
                textContent: AppLocalizations.of(context)!.common_btn_continue,
                onTap: connectUser,
              ),
            ),
            TextButton(
              onPressed: () => navForgottenPassword(context),
              child: Text(
                AppLocalizations.of(context)!.forgotten_password,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> connectUser() async {
    var result = await lgv.login(widget.mail, controller.text);
    
    if (result) {
      Navigator.of(context).pushNamed('/home');
    }else {
      setState(() {
        passwordIncorect = true;
      });
    }

  }

  void navForgottenPassword(BuildContext context) {
    Navigator.of(context).pushNamed('/forgottenPassword');
  }
}
