import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../Commons/Widgets/form_text_Field.dart';

class LegalNameWidget extends StatelessWidget {
  const LegalNameWidget(
      {super.key,
      required this.firstNameController,
      required this.lastNameController,
      this.fieldError});

  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final String? fieldError;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 28.0,
            left: 16.0,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              AppLocalizations.of(context)!.legal_name,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 16.0,
          ),
          child: FormTextField(
            textFieldValue: AppLocalizations.of(context)!.firstname_on_id,
            controller: firstNameController,
            isPassword: false,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 8.0,
          ),
          child: FormTextField(
            textFieldValue: AppLocalizations.of(context)!.lastname_on_id,
            controller: lastNameController,
            isPassword: false,
          ),
        ),
        if (fieldError != null && fieldError!.isNotEmpty)
          Padding(
            padding:
                const EdgeInsets.only(bottom: 8.0, left: 16.0, right: 16.0),
            child: Text(
              fieldError!,
              style: const TextStyle(color: Colors.red),
            ),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            AppLocalizations.of(context)!.legal_name_desc,
            style: const TextStyle(
              fontSize: 12.0,
            ),
          ),
        ),
      ],
    );
  }
}
