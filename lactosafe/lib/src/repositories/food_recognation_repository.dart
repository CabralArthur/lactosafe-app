import 'dart:convert';
import 'dart:io';
import 'package:LactoSafe/src/http/http_client.dart';
import 'package:LactoSafe/src/model/info_food_model.dart';

import '../http/exceptions.dart';

abstract class IFoodRecognationRepository {
  Future<List<FoodModel>> getFoodsRecognation({required File image});
}

class FoodRecognizedRepository implements IFoodRecognationRepository {
  final HttpClientFoodRecognation client;
  static List<FoodModel> repository = [];

  FoodRecognizedRepository({required this.client});

  @override
  Future<List<FoodModel>> getFoodsRecognation({required File image}) async {
    final response = await client.post(
        url: 'http://192.168.0.109:5000/recognize-image', image: image);

    if (response.statusCode == 200) {
      var responseString = await response.stream.bytesToString();
      final List<FoodModel> foodsRecognized = [];

      final body = jsonDecode(responseString);

      body['recognized_foods'].map((item) {
        final FoodModel food = FoodModel.fromMap(item);
        
        foodsRecognized.add(food);
      }).toList();

      
      foodsRecognized[0].setImage(image);
      repository = foodsRecognized;
      return foodsRecognized;
    } else if (response.statusCode == 404) {
      throw NotFoundExeption("A url informada não é válida");
    } else {
      throw Exception("Não foi possivel carregar os alimentos.");
    }
  }
}
