import 'package:http/http.dart' as http;
import 'dart:convert';

Future<bool> login(String email, String password) async {
  var url = Uri.parse('http://192.168.5.129:5000/login');

  var loginData = {'email': email, 'senha': password};
  var headers = {'Content-Type': 'application/json'};

  var response =
      await http.post(url, headers: headers, body: json.encode(loginData));

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
