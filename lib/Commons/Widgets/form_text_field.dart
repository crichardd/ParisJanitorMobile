import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FormTextField extends StatefulWidget {
  const FormTextField(
      {super.key,
      required this.textFieldValue,
      required this.controller,
      required this.isPassword});

  final String textFieldValue;
  final TextEditingController controller;
  final bool isPassword;

  @override
  State<FormTextField> createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  bool _isObscured = true;

  @override
  void initState() {
    super.initState();
    _isObscured = widget
        .isPassword; // Initialize based on whether it's a password field or not
  }

  void _toggleVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _isObscured,
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.textFieldValue,
        hintText:  AppLocalizations.of(context)!.form_field_hint + widget.textFieldValue,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        suffixIcon: widget.isPassword
            ? TextButton(
                onPressed: _toggleVisibility,
                child: Text(
                  _isObscured ? AppLocalizations.of(context)!.password_display : AppLocalizations.of(context)!.password_hide,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
