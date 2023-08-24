import "package:http/http.dart" as http;

Future login(String email, String password) async {
  var url = Uri.parse('http://127.0.0.1:5000/login'); // Replace with your Flask API URL

  var loginData = {'email': email, 'senha': password};

  var response = await http.post(url, body: loginData);

  if (response.statusCode == 200) {
    // Request successful, handle the response here
    var responseString = response.body;
    return responseString;
  } else {
    // Error in the request, handle the error here
    throw Exception('Error in the request: ${response.statusCode}');
  }
}