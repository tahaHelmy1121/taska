import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import '../../const/url.dart';
import '../model/activemodel.dart';
dynamic toArabic({required Uint8List bodyBytes}) {
  return jsonDecode(utf8.decode(bodyBytes));
}

class ResendCode {
  static Future<ActivePassModel> getResendRepo({var code, email}) async {
    Map<String, dynamic> body = {"code": '$code', "email": '$email'};
    print('pody is $body');
    var response = await http.post(
      Uri.http(baseUrl,active),
      body: body,
      headers: {
        //  "Accept": "application/vnd.api+json",
        "Accept-Language": "ar",
      },
    );

    if (response.statusCode == 200) {
      print(response.statusCode);
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = ActivePassModel.fromJson(json);
      return result;
    } else {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = ActivePassModel.fromJson(json);
      return result;
    }
  }
}
