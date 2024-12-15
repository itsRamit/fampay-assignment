import 'dart:convert';
import 'dart:developer';
import 'package:card_app/constants/ApiConstants.dart';
import 'package:card_app/models/ApiResponse.dart';
import 'package:card_app/utils/utils.dart';
import 'package:http/http.dart' as http;

final http.Client _client = http.Client();

class ApiService {
  Future<ApiResponse> get(String baseURl, String path ,{dynamic queryParams}) async {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    try {
      Uri uri = Uri.https(baseURl,
          '/$path', queryParams);
      final response = await _client.get(
        uri,
        headers: headers,
      );
      log("Response Status: ${response.statusCode}");

      // Checking for successful response
      if (response.statusCode >= 200 && response.statusCode < 299) {
        List<dynamic> listBody = json.decode(response.body.toString());
        Map<String, dynamic> jsonBody = listBody[0];
        return ApiResponse.fromJson(jsonBody);
      } else {
        // To Handle different error responses
        if (response.statusCode == 404) {
          Utils().toastmessage("Error: Not Found (404)");
        } else if (response.statusCode == 500) {
          Utils().toastmessage("Error: Server Error (500)");
        } else {
          Utils().toastmessage("Unexpected error occurred with status code: ${response.statusCode}");
        }
        throw Exception('Failed to load data');
      } 
    } catch (error) {
      // if catches any errors in the request process
      log("Error in GET request: $error");
      throw Exception('Error: $error');
    }
  }
}
