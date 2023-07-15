import 'dart:io';

import 'package:LactoSafe/src/model/info_food_model.dart';

import "package:http/http.dart" as http;

Future getFood(File image) async {
  var url = Uri.parse('http://127.0.0.1:5000/recognize-image');

  var request = http.MultipartRequest('POST', url);
  request.files.add(await http.MultipartFile.fromPath('image', image.path));

  var response = await request.send();

  if (response.statusCode == 200) {
    // Requisição bem-sucedida, trate a resposta aqui
    var responseString = await response.stream.bytesToString();
    print(responseString);
  } else {
    // Erro na requisição, trate o erro aqui
    print('Erro na requisição: ${response.statusCode}');
  }
}

Future test() async {}
