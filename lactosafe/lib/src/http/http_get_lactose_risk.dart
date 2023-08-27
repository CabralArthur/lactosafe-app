import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class IHttpGetLactoseRisk {
  Future post(
      {required String url, required int userId, required String foodName});
}

class HttpGetLactoseRisk implements IHttpGetLactoseRisk {
  @override
  Future post(
      {required String url, required int userId, required String foodName}) async {
    Map data = {"id_usuario": userId, "nome_alimento": foodName};
    var body = json.encode(data);
    var response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: body);

    return response;

  }
}
