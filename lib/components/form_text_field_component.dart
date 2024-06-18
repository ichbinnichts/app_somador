import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  final String label;
  final String hint;
  final bool? obscureText;
  final TextEditingController? textController;
  final String? Function(String?)? inputValidator;
  final Icon? iconInput;

  const FormTextField(
      {super.key,
      required this.label,
      required this.hint,
      this.obscureText,
      this.textController,
      this.inputValidator,
      this.iconInput});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1, vertical: 12),
      child: TextFormField(
        obscureText: obscureText ?? false,
        controller: textController,
        decoration: InputDecoration(
          prefixIcon: iconInput,
          labelText: label,
          hintText: hint,
        ),
        validator: inputValidator,
      ),
    );
  }
}
