import 'dart:convert';
import 'dart:io';
import 'package:LactoSafe/src/model/info_food_model.dart';
import "package:http/http.dart" as http;

Future setFoodInformation(File? image) async {
  //O ipv4 varia de acordo com a maquina
  var url = Uri.parse('http://192.168.0.109:5000/recognize-image');

  var request = http.MultipartRequest('POST', url);
  request.files.add(await http.MultipartFile.fromPath('image', image!.path));

  var response = await request.send();
  print(response);

  if (response.statusCode == 200) {
    // Requisição bem-sucedida, trate a resposta aqui

    var responseString = await response.stream.bytesToString();
    final decodeResponse = jsonDecode(responseString);
    print(responseString);
    Foods[0].setNome(decodeResponse['nome']);
    Foods[0].setChanceLactose(decodeResponse['porcentagem']);

    return Foods;
  } else {
    // Erro na requisição, trate o erro aqui
    print('Erro na requisição: ${response.statusCode}');
  }
}
