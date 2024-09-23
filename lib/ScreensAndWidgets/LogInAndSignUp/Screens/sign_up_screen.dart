import 'package:flutter/material.dart';

import '../Widgets/SignUpWidgets/sign_up_bottom.dart';
import '../Widgets/SignUpWidgets/sign_up_top.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key, required this.mail});

  final String mail;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SignUpTop(),
            const Divider(
              thickness: 1.5,
              color: Colors.black,
            ),
            SignUpBottom(tempMail: widget.mail,),
          ],
        ),
      ),
    );
  }
}
