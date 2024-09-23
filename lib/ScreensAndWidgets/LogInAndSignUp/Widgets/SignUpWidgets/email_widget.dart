import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:paris_janitor/Commons/Widgets/form_text_Field.dart';

class EmailWidget extends StatelessWidget {
  const EmailWidget({super.key, required this.controller, this.mailError});

  final TextEditingController controller;
  final String? mailError;

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
              AppLocalizations.of(context)!.email,
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
              textFieldValue: AppLocalizations.of(context)!.email,
              controller: controller,
              isPassword: false),
        ),
        if (mailError != null && mailError!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              left: 16.0,
              right: 16.0,
            ),
            child: Text(
              mailError!,
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
              AppLocalizations.of(context)!.email_desc,
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
