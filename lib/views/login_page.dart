import 'package:app_somador/components/form_text_field_component.dart';
import 'package:app_somador/components/main_app_bar_component.dart';
import 'package:app_somador/components/main_button_component.dart';
import 'package:app_somador/components/snack_bar_component.dart';
import 'package:app_somador/controllers/access_controller.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Center(
        child: Form(
          key: _formKey,
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
              FormTextField(
                label: 'Usuário',
                hint: 'Usuário',
                textController: _usernameController,
                inputValidator: (username) {
                  if (username == null || username.isEmpty) {
                    return 'Preencha o campo username';
                  }

                  return null;
                },
              ),
              FormTextField(
                label: 'Senha',
                hint: 'Senha',
                obscureText: true,
                textController: _passwordController,
                inputValidator: (password) {
                  if (password == null || password.isEmpty) {
                    return 'Preencha o campo senha';
                  }

                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              MainButton(
                text: 'Entrar',
                onPressed: () async {
                  final navigator = Navigator.of(context);
                  final scaffoldMessenger = ScaffoldMessenger.of(context);

                  if (_formKey.currentState!.validate()) {
                    bool loginSuccess = await AccessController.instance.login(
                        _usernameController.text, _passwordController.text);

                    if (loginSuccess) {
                      navigator.popAndPushNamed('/somador');
                    } else {
                      scaffoldMessenger.showSnackBar(snackBar(
                        message: 'Falhou a autenticação',
                        color: Colors.red,
                      ));
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
