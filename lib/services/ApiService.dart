import 'dart:convert';
import 'dart:developer';
import 'package:card_app/models/ApiResponse.dart';
import 'package:http/http.dart' as http;

final http.Client _client = http.Client();

class ApiService {
  late ApiResponse _response;

  Future<ApiResponse> get(String url, {dynamic queryParams}) async {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    try {
      Uri uri = Uri.https(url, queryParams);
      final response = await _client.get(
        uri,
        headers: headers,
      );
      log("Response Status: ${response.statusCode}");

      // Checking for successful response
      if (response.statusCode >= 200 && response.statusCode < 299) {
        return ApiResponse.fromJson(json.decode(response.body.toString()));
      } else {
        // To Handle different error responses
        if (response.statusCode == 404) {
          log("Error: Not Found (404) - The resource could not be found.");
        } else if (response.statusCode == 500) {
          log("Error: Server Error (500) - The server encountered an error.");
        } else {
          log("Unexpected error occurred with status code: ${response.statusCode}");
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
