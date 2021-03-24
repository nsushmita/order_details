import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:order_details/utils/constants.dart';

final AuthService authService = AuthService();

class AuthService {
  Future get(String url) async {
    var res = await http.get(url, headers: {
      acceptKey: jsonContentType,
      contentTypeKey: jsonContentType,
    });

    var resBody = json.decode(res.body);

    if (resBody[resultKey] != null) {
      return resBody[resultKey];
    }
    return Future.error(genericErrorMessage);
  }
}
