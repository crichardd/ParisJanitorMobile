import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:paris_janitor/ScreensAndWidgets/LogInAndSignUp/Widgets/MainWidgets/main_screen_bottom.dart';
import 'package:paris_janitor/ScreensAndWidgets/LogInAndSignUp/Widgets/MainWidgets/main_screen_top.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainScreenTop(),
            MainScreenBottom(),
          ],
        ),
      ),
    );
  }


}
