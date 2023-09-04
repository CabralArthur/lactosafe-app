import 'dart:convert';

import 'package:LactoSafe/src/http/http_get_lactose_risk.dart';
import 'package:LactoSafe/src/model/info_food_model.dart';
import 'package:LactoSafe/src/model/user_model.dart';

Future<FoodModel> getFoodRisk({required FoodModel food}) async {
  final HttpGetLactoseRisk client = HttpGetLactoseRisk();

  final response = await client.post(
      url: "http://192.168.0.109:5000/calcular_risco",
      userId: userStore.getUserId,
      foodName: food.getFoodName);

  if(response.statusCode == 200){
    final decodedResponse = await jsonDecode(response.body);
    food.setLactoseRisk(decodedResponse["risco_lactose"]);
    food.setLactoseRiskStr(decodedResponse["risco_str"]);
    food.setHelpText(decodedResponse["texto_ajuda"]);
  } else {
    throw response.statusCode;
  }

  return food;
  
}

