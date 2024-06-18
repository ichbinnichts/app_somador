import 'dart:convert';

import 'package:app_somador/constants/constants.dart';
import 'package:http/http.dart' as http;

class AccessController {
  static final AccessController instance = AccessController();

  static const String _baseUrl = baseLoginUrl;

  Future<bool> login(String username, String password) async {
    http.Response response = await http.post(Uri.parse(_baseUrl),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode(
          {
            'username': username,
            'password': password,
          },
        ));
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
