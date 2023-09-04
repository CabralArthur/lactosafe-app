import 'package:LactoSafe/src/http/exceptions.dart';
import 'package:LactoSafe/src/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future login(String email, String password, BuildContext context) async {
  var url = Uri.parse('http://192.168.0.109:5000/login');

  var loginData = {'email': email, 'senha': password};
  var headers = {'Content-Type': 'application/json'};

  var response =
      await http.post(url, headers: headers, body: json.encode(loginData));

  if (response.statusCode == 200) {
    final decodedUser = jsonDecode(response.body);
    if (decodedUser['isLogged'] == true) {
      User user = User.fromMap(decodedUser);
      userStore = user;
    
      if (context.mounted) {
        Navigator.popAndPushNamed(context, '/home');
      }
    } else if (decodedUser['isLogged'] == false) {
      
      return decodedUser;
    }
  } else {
    return NotFoundExeption('Algum erro ocorreu');
  }
}
