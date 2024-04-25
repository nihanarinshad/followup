import 'dart:convert';
import 'package:http/http.dart' as http;

class AppService {
  final String _baseUrl = 'https://dev6.bo-l.com/api'; // Base URL for API

  Future<Map<String, dynamic>?> getAuthorization(
      String username, String password) async {
    // Create basic authentication header
    String basicAuth =
        'Basic ${base64.encode(utf8.encode('$username:$password'))}';
    Map<String, String> headers = {'authorization': basicAuth};

    try {
      print('363747');
      // Make POST request to the authorization endpoint
      http.Response response = await http.post(
        Uri.parse('$_baseUrl/tokens'),
        headers: headers,
      );
      print('object');
      print(response.statusCode);
      print(response.body);

      // Check if the response is successful (status code 200)
      if (response.statusCode == 200) {
        // Decode the response body
        Map<String, dynamic> data = json.decode(response.body);

        // Check if the response contains a token and a user type
        if (data.containsKey('token') && data.containsKey('user')) {
          // Return a map containing both the token and user type
          return {
            'token': data['token'],
            'user_type': data['user']['user_type'],
            'user_name': data['user']['username'],
          };
        } else {
          // If the response is missing either the token or user type, return null
          return null;
        }
      } else {
        // If the response status code is not 200, return null
        return null;
      }
    } catch (e) {
      // Handle any errors that occur during the request
      print('Error occurred during authorization: $e');
      return null;
    }
  }
}
