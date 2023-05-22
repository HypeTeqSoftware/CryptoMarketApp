import 'dart:convert';

import 'package:http/http.dart' as http;

class APICallModel {

  // Get API
  static Future<http.Response> getAPICallMethod(String apiUrl) async {
    Uri url = Uri.parse(apiUrl);
    var response;
    try {
      response = await http.get(url,headers: {
        "Content-Type": "application/json",
        "Accept":"application/json",
      });
    } catch (e) {
      print("response => ${e.toString()}");
      // ShowSnackBar.showSnackBar(
      //     text: AppString.errorMessage,
      //     snackBarBackgroundColor: AppColors.redColor);
    }
    return response;
  }

  // Post API
  static Future<http.Response> postAPICallMethod(String apiUrl, Map<String,dynamic> body) async{
    Uri url = Uri.parse(apiUrl);
    var response;
    Map<String,String> headers = {
      "EmailID": "adil@hypeteq.com",
      "Content-Type": "application/json"
    };
    try {
      response = await http.post(url,body: jsonEncode(body),headers:headers);
      print(response);
    } catch (e) {
      print("response => ${e.toString()}");
      // ShowSnackBar.showSnackBar(
      //     text: AppString.errorMessage,
      //     snackBarBackgroundColor: AppColors.redColor);
    }
    return response;
  }

  // delete API
  static Future<http.Response> deleteAPICallMethod(String apiUrl)async{
    Uri url = Uri.parse(apiUrl);
    var response;
    Map<String,String> headers = {
      "EmailID": "adil@hypeteq.com",
    };
    try {
      response = await http.delete(url,headers: headers);
      print(response);
    } catch (e) {
      print("response => ${e.toString()}");
      // ShowSnackBar.showSnackBar(
      //     text: AppString.errorMessage,
      //     snackBarBackgroundColor: AppColors.redColor);
    }
    return response;
  }
}
