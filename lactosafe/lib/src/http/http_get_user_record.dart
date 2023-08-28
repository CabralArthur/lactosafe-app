import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class IHttpGetUserRecord {
  Future post({required String url, required int userId});
}

class HttpGetUserRecord implements IHttpGetUserRecord {
  @override
  Future post({required String url, required int userId}) async {
    Map data = {'id_usuario': userId};
    var body = json.encode(data);

    return await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: body);
  }
}
