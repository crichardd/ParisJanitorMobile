import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';
import 'package:paris_janitor/Api/Model/SignUpDto.dart';
import 'package:paris_janitor/Api/Model/UserDto.dart';
import 'package:paris_janitor/Api/ViewModels/LoginViewModel.dart';
import 'package:paris_janitor/Commons/Widgets/buttons/common_elevated_rounded_button.dart';
import 'package:paris_janitor/ScreensAndWidgets/LogInAndSignUp/Widgets/SignUpWidgets/legal_name_widget.dart';
import 'package:paris_janitor/ScreensAndWidgets/LogInAndSignUp/Widgets/SignUpWidgets/password_widget.dart';

import 'birthday_widget.dart';
import 'email_widget.dart';

class SignUpBottom extends StatefulWidget {
  const SignUpBottom({super.key, required this.tempMail});

  final String tempMail;

  @override
  State<SignUpBottom> createState() => _SignUpBottomState();
}

class _SignUpBottomState extends State<SignUpBottom> {
  final LoginViewModel lgv = LoginViewModel();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  DateTime? _selectedDate;
  final TextEditingController mailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String nameError = '';
  String birthdayError = '';
  String mailError = '';
  String pwdError = '';

  void _handleDateSelected(DateTime? date) {
    setState(() {
      _selectedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    mailController.text = widget.tempMail;
    mailController.selection = TextSelection.fromPosition(
      TextPosition(offset: mailController.text.length),
    );

    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Column(
            children: [
              LegalNameWidget(
                firstNameController: firstNameController,
                lastNameController: lastNameController,
                fieldError: nameError.isNotEmpty ? nameError : null,
              ),
              BirthdayWidget(
                onDateSelected: _handleDateSelected,
                birthdayError: birthdayError.isNotEmpty ? birthdayError : null,
              ),
              EmailWidget(
                controller: mailController,
                mailError: mailError.isNotEmpty ? mailError : null,
              ),
              PasswordWidget(
                controller: passwordController,
                pwdError: pwdError.isNotEmpty ? pwdError : null,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 24.0,
                  left: 16.0,
                  right: 16.0,
                ),
                child: Text(
                  AppLocalizations.of(context)!.terms_and_conditions,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 36.0,
                  bottom: 52.0,
                ),
                child: CommonElevatedRoundedButton(
                  textContent: AppLocalizations.of(context)!.agree_and_continue,
                  onTap: register,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> register() async {
    setState(() {
      nameError = '';
      birthdayError = '';
      mailError = '';
      pwdError = '';
    });

    if (firstNameController.text.isEmpty) {
      nameError = AppLocalizations.of(context)!.empty_firstname_error;
    }
    if (lastNameController.text.isEmpty) {
      nameError += '\n${AppLocalizations.of(context)!.empty_lastname_error}';
    }
    if (_selectedDate == null) {
      birthdayError += AppLocalizations.of(context)!.empty_birthday_error;
    }
    if (passwordController.text.isEmpty) {
      pwdError = AppLocalizations.of(context)!.empty_password_error;
    }

    if (nameError.isNotEmpty     ||
        birthdayError.isNotEmpty ||
        pwdError.isNotEmpty      ||
        mailError.isNotEmpty) {
      setState(() {

      });
      return;
    }

    final SignUpDto newUser = SignUpDto(
      email: mailController.text,
      password: passwordController.text,
      lastName: lastNameController.text,
      firstName: firstNameController.text,
      birthday: _selectedDate.toString(),
    );

    var result = await lgv.signUpUser(newUser);
    if (result == true) {
      Navigator.of(context).pushNamed('/home');
    } else if (result == false &&
        lgv.error?.message == 'Email already in use') {
      setState(() {
        mailError = lgv.error!
            .message;
      });
    } else if (result == false) {
      final snackBar = SnackBar(
        content: Text(
          lgv.error?.message ?? 'Unknown error',
        ),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
