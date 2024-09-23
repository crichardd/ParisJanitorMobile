import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:paris_janitor/Api/Model/ErrorResponseDto.dart';
import 'package:paris_janitor/Api/Model/UserDto.dart';
import 'package:paris_janitor/Api/ViewModels/LoginViewModel.dart';
import 'package:paris_janitor/Commons/Widgets/buttons/common_elevated_rounded_button.dart';
import 'package:paris_janitor/Commons/Widgets/form_text_field.dart';

class MainScreenTop extends StatefulWidget {
  const MainScreenTop({super.key});

  @override
  State<MainScreenTop> createState() => _MainScreenTopState();
}

class _MainScreenTopState extends State<MainScreenTop> {
  final LoginViewModel lgv = LoginViewModel();
  final TextEditingController controller = TextEditingController();
  String errorResponse = '';
  final bool networkError = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: closeLogin,
              child: const Text(
                'X',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28.0,
                ),
              ),
            ),
            const SizedBox(
              width: 72,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                AppLocalizations.of(context)!.log_or_sign_up,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
        const Divider(
          color: Colors.grey,
          thickness: 1.5,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 28.0,
            bottom: 24.0,
          ),
          child: FormTextField(
            textFieldValue: AppLocalizations.of(context)!.email,
            controller: controller,
            isPassword: false,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: Text(
            errorResponse,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 20.0,
            bottom: 16.0,
          ),
          child: CommonElevatedRoundedButton(
            textContent: AppLocalizations.of(context)!.common_btn_continue,
            onTap: () => checkMail(context),
          ),
        ),
      ],
    );
  }

  void closeLogin() {}
  void checkMail(BuildContext context) async {
    if (controller.text.isEmpty) {
      setState(() {
        errorResponse = '* Email cannot be empty';
      });
      return;
    }

    var result = await lgv.findUserByMail(controller.text);

    if (result == true) {
      Navigator.of(context).pushNamed(
        '/loginScreen',
        arguments: controller.text,
      );
    } else if (result == false && lgv.error?.message == 'User not found') {
      Navigator.of(context).pushNamed(
        '/signupScreen',
        arguments: controller.text,
      );
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
