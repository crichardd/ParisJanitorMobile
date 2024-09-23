import 'package:flutter/material.dart';
import 'package:paris_janitor/Commons/Widgets/buttons/common_elevated_rounded_button.dart';
import 'package:paris_janitor/Commons/Widgets/form_text_Field.dart';

class ForgottenBottom extends StatefulWidget {
  const ForgottenBottom({super.key});

  @override
  State<ForgottenBottom> createState() => _ForgottenBottomState();
}

class _ForgottenBottomState extends State<ForgottenBottom> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  top: 16.0,
                ),
                child: Text(
                  "Enter the email adress associated with your account, and we'll email you a link to reset your password",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                  top: 28.0,
                  bottom: 24.0,
                ),
                child: FormTextField(
                    textFieldValue: "Email",
                    controller: controller,
                    isPassword: false),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  left: 8.0,
                  right: 8.0,
                ),
                child: CommonElevatedRoundedButton(
                  textContent: "Send reset link",
                  onTap: _onTap,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTap() {}
}
