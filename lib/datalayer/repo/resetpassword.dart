import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

import '../../const/url.dart';
import '../model/newpass.dart';
import '../model/registermodel.dart';

dynamic toArabic({required Uint8List bodyBytes}) {
  return jsonDecode(utf8.decode(bodyBytes));
}

class ResetpasswordRepo {
  static Future<SetPassword> getResetResponse(
      {var  password,confirmPass}) async {
    Map<String, dynamic> body = {
      "password": password.toString(),
      "confirm_password": confirmPass.toString(),

    };

    var response = await http.post(
        Uri.http(baseUrl,reset),body: body,
        headers: {
         "Accept": "application/json",
          "Accept-Language": "ar",

        });

    print(response.body);
    if (response.statusCode == 200) {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = SetPassword.fromJson(json);
      return result;
    } else {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = SetPassword.fromJson(json);
      return result;
    }
  }
}
