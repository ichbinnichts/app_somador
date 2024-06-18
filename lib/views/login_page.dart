import 'package:app_somador/components/form_text_field_component.dart';
import 'package:app_somador/components/main_app_bar_component.dart';
import 'package:app_somador/components/main_button_component.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FormTextField(label: 'Email', hint: 'example@email.com'),
            FormTextField(label: 'Senha', hint: 'Senha'),
            const SizedBox(
              height: 10,
            ),
            MainButton(
              text: 'Entrar',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
