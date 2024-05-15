import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpBaseClient {
  static const String _endpoint =
      'http://dev6.bo-l.com/api'; // Assuming this is your endpoint
// var token=Hive.box('')
  Future postRequest(String api, Map<String, String> header,
      [dynamic payLoad]) async {
    final url = Uri.parse('$_endpoint/$api');
    //print(url);

    try {
      final response = await http.post(url, headers: header, body: payLoad);
      print(response.body);
      print(response.statusCode);
      return _parseResponseData(response);
    } catch (e) {
      print('Error occurred during POST request: $e');
      return null;
    }
  }

  Future postNoBodyRequest(String api, Map<String, String> header,
      [dynamic payLoad]) async {
    final url = Uri.parse('$_endpoint/$api');
    //print(url);

    try {
      final response = await http.post(url, headers: header);
      return _parseResponseData(response);
      // print(response.body);
      // print(response.statusCode);
    } catch (e) {
      print('Error occurred during POST request: $e');
      return null;
    }
  }

  Future getRequest(String api, Map<String, String> header) async {
    final url = Uri.parse('$_endpoint/$api');

    try {
      final response = await http.get(url, headers: header);
      return _parseResponseData(response);
      // return response.body;
    } catch (e) {
      print('catched error = $e');
    }
  }

  Future putRequest(
      String api, Map<String, String> header, String requestBody) async {
    final url = Uri.parse('$_endpoint/$api');

    try {
      final response = await http.put(url, headers: header, body: requestBody);
      return _parseResponseData(response);
      // return response.body;
    } catch (e) {
      print('catched error = $e');
    }
  }

  dynamic _parseResponseData(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);

      case 401:
        return response.body;

      case 403:
        return response.body;
      case 400:
        return response.body;
      case 500:
        // Handle 500 error
        break;
      default:
        print(response.body);
    }
  }
}
