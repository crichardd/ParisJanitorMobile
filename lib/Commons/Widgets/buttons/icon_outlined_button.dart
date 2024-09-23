import 'package:flutter/material.dart';

class IconOutlinedButton extends StatelessWidget {
  const IconOutlinedButton({super.key, required this.icon, required this.text, required this.onPressed,});

  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
      child: SizedBox(
        height: 50,
        child: OutlinedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(
                  color: Colors.red,
                ),
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: Colors.black,
              ),
              const Spacer(),
              Text(
                text,
                style: const TextStyle(color: Colors.black),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
