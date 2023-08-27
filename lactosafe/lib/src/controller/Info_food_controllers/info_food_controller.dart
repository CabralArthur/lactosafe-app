import 'dart:convert';

import 'package:LactoSafe/src/http/http_get_lactose_risk.dart';
import 'package:LactoSafe/src/model/info_food_model.dart';

Future<FoodModel> getFoodRisk({required FoodModel food}) async {
  final HttpGetLactoseRisk client = HttpGetLactoseRisk();
  int functionGetUserId = 1; //fazer função para pegar id do usuario que esta utilizando o aplicativo.

  final response = await client.post(
      url: "http://192.168.0.109:5000/calcular_risco",
      userId: functionGetUserId,
      foodName: food.getFoodName);

  if(response.statusCode == 200){
    //var responseString = await response.toString();
    final decodedResponse = await jsonDecode(response.body);
    food.setLactoseRisk(decodedResponse["risco_lactose"]);
    food.setLactoseRiskStr(decodedResponse["risco_str"]);
    food.setHelpText(decodedResponse["texto_ajuda"]);

    print(decodedResponse);
    print(decodedResponse["risco_str"]);
    print(decodedResponse["risco_lactose"]);
    print(decodedResponse["texto_ajuda"]);

    print(food.getLactoseRisk);
    print(food.getLactoseRiskStr);
  } else {
    throw response.statusCode;
  }

  return food;
  
}

