import 'package:flutter/material.dart';

class ForgottenTop extends StatelessWidget {
  const ForgottenTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () => _onBack(context),
          child: Text(
            'X'.toUpperCase(),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            ),
          ),
        ),
        const SizedBox(width: 88,),
        const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 16.0,
          ),
          child: Text(
            'Reset Password',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }

  void _onBack(BuildContext context) {
    Navigator.of(context).pop();
  }
}
