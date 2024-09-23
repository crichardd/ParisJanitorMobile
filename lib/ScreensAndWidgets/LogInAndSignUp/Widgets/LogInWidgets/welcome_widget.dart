import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:paris_janitor/Commons/Widgets/form_text_Field.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Image.asset(
            'images/main-logo.png',
            height: 60,
            width: 60,
          ),
        ),
         Text(
          AppLocalizations.of(context)!.welcome_message,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
