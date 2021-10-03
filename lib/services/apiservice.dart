import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class ApiService {
//==============================================================================
// CALL GOOGLE API
//==============================================================================
  static Future fnCallGoogleApi() async {
    //============================================================================
    // PREPARE VARIABLE
    //============================================================================
    Uri uri =
        Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});
    //============================================================================
    // CALL HTTP.GET
    //============================================================================
    var response = await http.get(uri);
    //============================================================================
    // GET RESPONSE
    //============================================================================
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var totalItems = jsonResponse['totalItems'];
      // ignore: avoid_print
      print('totalItems: $totalItems.');
    } else {
      // ignore: avoid_print
      print('Request failed with status: ${response.statusCode}.');
    }
  }

//==============================================================================
// CALL GOOGLE API
//==============================================================================
  static Future fnCallAzureApiGet() async {
    //============================================================================
    // PREPARE VARIABLE
    //============================================================================
    Uri uri = Uri.http('ap-telework-api.azurewebsites.net', '/getMockUp');
    //============================================================================
    // CALL HTTP.GET
    //============================================================================
    var response = await http.get(uri);
    //============================================================================
    // CHECK STATUS CODE
    //============================================================================
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      String company = jsonResponse['company'];
      String department = jsonResponse['department'];
      String email = jsonResponse['email'];
      // ignore: avoid_print
      print(
          'https://ap-telework-api.azurewebsites.net/getMockUp - company: $company');
      // ignore: avoid_print
      print(
          'https://ap-telework-api.azurewebsites.net/getMockUp - department: $department');
      // ignore: avoid_print
      print(
          'https://ap-telework-api.azurewebsites.net/getMockUp - email: $email');
    } else {
      // ignore: avoid_print
      print('Request failed with status: ${response.statusCode}.');
    }
  }

//==============================================================================
// CALL GOOGLE API
//==============================================================================
  static Future fnCallAzureApiPost() async {
    //============================================================================
    // PREPARE VARIABLE
    //============================================================================
    Uri uri = Uri.http('ap-telework-api.azurewebsites.net', '/Login');
    var requestHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    };
    //============================================================================
    // CALL HTTP.GET
    //============================================================================
    var response = await http.post(
      uri,
      headers: requestHeaders,
      body: convert.jsonEncode(<String, dynamic>{
        "company": "J632",
        "username": "095-AIAP",
        "password": "095-AIAP"
      }),
    );
    //============================================================================
    // CHECK STATUS CODE
    //============================================================================
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      String company = jsonResponse['company'];
      String department = jsonResponse['department'];
      String email = jsonResponse['email'];
      // ignore: avoid_print
      print(
          'https://ap-telework-api.azurewebsites.net/Login - company: $company');
      // ignore: avoid_print
      print(
          'https://ap-telework-api.azurewebsites.net/Login - department: $department');
      // ignore: avoid_print
      print('https://ap-telework-api.azurewebsites.net/Login - email: $email');
    } else {
      // ignore: avoid_print
      print(
          'Request failed with status: ${response.statusCode} ${response.body.toString()}.');
    }
  }
}
