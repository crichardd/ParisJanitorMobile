import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:paris_janitor/Commons/Widgets/form_text_Field.dart';

class PasswordWidget extends StatelessWidget {
  const PasswordWidget({super.key, required this.controller, this.pwdError});

  final TextEditingController controller;
  final String? pwdError;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 16.0,
            left: 16.0,
            right: 16.0,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              AppLocalizations.of(context)!.password,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 16.0,
            left: 16.0,
            right: 16.0,
          ),
          child: FormTextField(
            textFieldValue: "Password",
            controller: controller,
            isPassword: true,
          ),
        ),
        if (pwdError != null && pwdError!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              left: 16.0,
              right: 16.0,
            ),
            child: Text(
              pwdError!,
              style: const TextStyle(
                color: Colors.red,
              ),
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
            left: 16.0,
            right: 16.0,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "${AppLocalizations.of(context)!.password_rule_1}\n${AppLocalizations.of(context)!.password_rule_2}\n${AppLocalizations.of(context)!.password_rule_3}\n${AppLocalizations.of(context)!.password_rule_4}",
              style: const TextStyle(
                fontSize: 12.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
