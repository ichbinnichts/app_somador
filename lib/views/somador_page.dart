import 'package:app_somador/components/main_app_bar_component.dart';
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
    return Scaffold(
      appBar: appBar(),
      body: Center(
        child: Column(
          children: [Text('Olá, ${_username}')],
        ),
      ),
    );
  }
}
