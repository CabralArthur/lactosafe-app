import 'dart:convert';

import 'package:LactoSafe/src/http/http_get_user_record.dart';
import 'package:LactoSafe/src/model/user_model.dart';

import '../http/exceptions.dart';
import '../model/info_food_model.dart';

abstract class IUserRecordRepository {
  Future<List<FoodModel>> getUserRecord();
}

class UserRecordRepository implements IUserRecordRepository {
  HttpGetUserRecord client = HttpGetUserRecord();

  UserRecordRepository({required this.client});
  @override
  Future<List<FoodModel>> getUserRecord() async {
    final response = await client.post(
        url: 'http://192.168.0.109:5000/historico_alimentos',
        userId: userStore.getUserId); // pegar id do usuario quando ele logar
    if (response.statusCode == 200) {
      final List<FoodModel> userRecords = [];
      final decodedResponseUserRecord = jsonDecode(response.body);

      decodedResponseUserRecord['historico_alimentos'].map((item) {
        final userRecord = FoodModel.recordFromMap(item);
        userRecords.add(userRecord);
      }).toList();
      return userRecords;
    } else if (response.statusCode == 404) {
      throw NotFoundExeption("A url informada não é válida");
    } else {
      throw Exception("Não foi possivel carregar os alimentos.");
    }
  }
}
