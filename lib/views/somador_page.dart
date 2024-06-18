import 'package:app_somador/components/form_text_field_component.dart';
import 'package:app_somador/components/main_app_bar_component.dart';
import 'package:app_somador/components/main_button_component.dart';
import 'package:app_somador/components/main_text_component.dart';
import 'package:app_somador/components/snack_bar_component.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SomadorPage extends StatefulWidget {
  const SomadorPage({super.key});

  @override
  State<SomadorPage> createState() => _SomadorPageState();
}

class _SomadorPageState extends State<SomadorPage> {
  SharedPreferences? prefs;
  String _username = 'Guest';
  double resultado = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadPreferences();
  }

  void _loadPreferences() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs?.getString('username') ?? 'Guest';
    });
  }

  @override
  Widget build(BuildContext context) {
    final numero1 = TextEditingController();
    final numero2 = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: appBar(),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              mainText('Olá, ${_username}'),
              const SizedBox(
                height: 80,
              ),
              const Text(
                'Entre com os valores',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 10,
              ),
              FormTextField(
                label: 'Número 1',
                hint: '',
                textController: numero1,
                inputValidator: (numero) {
                  if (numero == null || numero.isEmpty) {
                    return 'Número 1 não preenchido';
                  }

                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              FormTextField(
                label: 'Número 2',
                hint: '',
                textController: numero2,
                inputValidator: (numero) {
                  if (numero == null || numero.isEmpty) {
                    return 'Número 2 não preenchido';
                  }

                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              MainButton(
                text: 'Calcular',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      resultado = double.parse(numero1.text) +
                          double.parse(numero2.text);
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(snackBar(
                      message: 'Dados não preenchidos',
                      color: Colors.red,
                    ));
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Resultado: $resultado',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
