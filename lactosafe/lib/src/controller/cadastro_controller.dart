import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future Cadastro(String email, String password, String username, String endereco,
    String intolerancia, BuildContext context) async {
  var url = Uri.parse('http://192.168.0.109:5000/cadastro');

  var cadastroData = {
    'email': email,
    'senha': password,
    //Atualmente a API só recebe os campo email e senha - 05/09/23
    // 'username': username,
    // 'endereco': endereco,
    // 'intolerancia': intolerancia,
  };

  var headers = {'Content-Type': 'application/json'};


  try {
      var response =
        await http.post(url, headers: headers, body: json.encode(cadastroData));
    if (response.statusCode == 200) {
      final decodedUser = jsonDecode(response.body);

      if (decodedUser['isRegistered'] == true) {
        // ignore: use_build_context_synchronously
        return decodedUser['isRegistered'];
        
      } else {
        //Configurar melhor quando o usuario já estiver cadastrado
        return 'O cadastro falhou: ${decodedUser['message']}';
      }
    } else {
      throw Exception('Falha na requisição: ${response.statusCode}');
    }
  } catch (error) {
    return 'Erro: $error';
  }
}
