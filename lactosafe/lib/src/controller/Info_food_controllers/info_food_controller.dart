// import 'dart:convert';
// import 'dart:io';
// import 'package:LactoSafe/src/model/info_food_model.dart';
// import 'package:flutter/material.dart';
// import "package:http/http.dart" as http;



// Future setFoodInformation(File? image) async {
//   //O ipv4 varia de acordo com a maquina
//   var url = Uri.parse('http://192.168.0.109:5000/recognize-image');

//   var request = http.MultipartRequest('POST', url);
//   request.files.add(await http.MultipartFile.fromPath('image', image!.path));

//   var response = await request.send();

//   if (response.statusCode == 200) {
//     // Requisição bem-sucedida, trate a resposta aqui
    
//     var responseString = await response.stream.bytesToString();
//     final decodeResponse = jsonDecode(responseString);
//     debugPrint(responseString);
//     Foods[0].setNome(decodeResponse['nome']);
//     Foods[0].setChanceLactose(decodeResponse['porcentagem']);
//     Foods.add(FoodModel(nome: "Churrasco",helpText:'_helpText',chanceLactose: 70, image: null));
//     Foods.add(FoodModel(nome: "Camarao", helpText: '_helpText',chanceLactose: 90, image: null));

//     return Foods;
    
//   } else {
//     // Erro na requisição, trate o erro aqui
//     print('Erro na requisição: ${response.statusCode}');
//   }
// }

