import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:jaadara/datalayer/model/searchmodel.dart';

import '../../../const/url.dart';

dynamic toArabic({required Uint8List bodyBytes}) {
  return jsonDecode(utf8.decode(bodyBytes));
}

class SearchRepo {
  static Future<SearchModel> getSearchRepo({searchProduct}) async {
    var response = await http.post(Uri.http(baseUrl, search), headers: {
      "Accept": "application/json",
      "Accept-Language": "ar",
      "key": "limit"
    });

    if (response.statusCode == 200) {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = SearchModel.fromJson(json);
      print(
          "''''''''''''''''''''''''''''${result.data!.first.title}''''''''''''''");
      return result;
    } else {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = SearchModel.fromJson(json);
      return result;
    }
  }
}
