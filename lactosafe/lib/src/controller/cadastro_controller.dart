import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future Cadastro(String email, String password, String username, String endereco,
    String intolerancia, BuildContext context) async {
  var url = Uri.parse('http://127.0.0.1:5000/cadastro');

  var cadastroData = {
    'email': email,
    'senha': password,
    'username': username,
    'endereco': endereco,
    'intolerancia': intolerancia,
  };

  var headers = {'Content-Type': 'application/json'};

  try {
    var response =
        await http.post(url, headers: headers, body: json.encode(cadastroData));

    if (response.statusCode == 200) {
      final decodedUser = jsonDecode(response.body);

      if (decodedUser['isRegistered'] == true) {
        // ignore: use_build_context_synchronously
        Navigator.popAndPushNamed(context, '/welcomePage');
      } else {
        return 'O cadastro falhou: ${decodedUser['error_message']}';
      }
    } else {
      throw Exception('Falha na requisição: ${response.statusCode}');
    }
  } catch (error) {
    return 'Erro: $error';
  }
}
