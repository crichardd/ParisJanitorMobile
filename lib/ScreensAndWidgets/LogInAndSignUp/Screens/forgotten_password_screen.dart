import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/ForgottenWidgets/forgotten_bottom.dart';
import '../Widgets/ForgottenWidgets/forgotten_top.dart';

class ForgottenPasswordScreen extends StatefulWidget {
  const ForgottenPasswordScreen({super.key});

  @override
  State<ForgottenPasswordScreen> createState() =>
      _ForgottenPasswordScreenState();
}

class _ForgottenPasswordScreenState extends State<ForgottenPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            ForgottenTop(),
            Divider(
              thickness: 1.5,
              color: Colors.grey,
            ),
            ForgottenBottom(),
          ],
        ),
      ),
    );
  }
}
