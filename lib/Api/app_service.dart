import 'dart:convert';
import 'package:http/http.dart' as http;

class AppService {
  final String _baseUrl = 'https://dev6.bo-l.com/api'; 

  Future<Map<String, dynamic>?> getAuthorization(
      String username, String password) async {
    String basicAuth =
        'Basic ${base64.encode(utf8.encode('$username:$password'))}';
    Map<String, String> headers = {'authorization': basicAuth};

    try {
     
      http.Response response = await http.post(
        Uri.parse('$_baseUrl/tokens'),
        headers: headers,
      );
      print('object');
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);

        if (data.containsKey('token') && data.containsKey('user')) {
          return {
            'token': data['token'],
            'user_type': data['user']['user_type'],
            'user_name': data['user']['username'],
          };
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      print('Error occurred during authorization: $e');
      return null;
    }
  }
}
