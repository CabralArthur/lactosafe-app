import 'dart:io';
import 'package:http/http.dart' as http;

abstract class IHttpClient {
  Future post({required String url, required File? image});
}

class HttpClientFoodRecognation implements IHttpClient {
 

  @override
  Future post({required String url, required File? image}) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('image', image!.path));

    return await request.send();
    
  }

}