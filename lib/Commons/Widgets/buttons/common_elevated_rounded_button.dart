import 'package:flutter/material.dart';

class CommonElevatedRoundedButton extends StatelessWidget {
  const CommonElevatedRoundedButton({super.key, required this.textContent, required this.onTap});

  final String textContent;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68,
      width: double.infinity,
      child: ElevatedButton(

        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            Colors.pink,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(
                color: Colors.red,
              ),
            ),
          ),
        ),
        onPressed: onTap,
        child: Text(
          textContent,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }


}
