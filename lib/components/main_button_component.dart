import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  const MainButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.blue),
        foregroundColor: MaterialStatePropertyAll(Colors.white),
      ),
      child: Text(text),
    );
  }
}
