import 'package:flutter/material.dart';
import 'package:paris_janitor/Commons/Widgets/buttons/icon_outlined_button.dart';

class MainScreenBottom extends StatelessWidget {
  const MainScreenBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.all(8)),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                    indent: 24,
                    endIndent: 8,
                  ),
                ),
                Text('or'),
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                    indent: 8,
                    endIndent: 24,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 36,
              ),
              child: Column(
                children: [
                  IconOutlinedButton(
                    icon: Icons.local_phone,
                    text: 'Continue with Phone',
                    onPressed: externalConnect,
                  ),
                  IconOutlinedButton(
                    icon: Icons.apple,
                    text: 'Continue with Apple',
                    onPressed: externalConnect,
                  ),
                  IconOutlinedButton(
                    icon: Icons.facebook,
                    text: 'Continue with Facebook',
                    onPressed: externalConnect,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void externalConnect() {}
