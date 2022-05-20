import 'dart:convert';

import 'package:http/http.dart';

import '../api_endpoints.dart';
import '../models/user.dart';

/*
* signin
* signup
* profile
* */

class AuthService {
  Future<Map<String, dynamic>?> signIn(String email, String password) async {
    var url = Uri.parse(APIEndPoints.signIn);

    var data = jsonEncode(
      User(email: email, password: password).toJson(),
    );

    try {
      Response res = await post(
        url,
        headers: {"Content-Type": "Application/json"},
        body: data,
      );
      if (res.statusCode == 200) {
        return {"status": 'success', "data": json.decode(res.body)};
      }
      print(res);
      return {"status": 'failed', "data": json.decode(res.body)};
    } catch (e) {
      rethrow;
    }
  }
}
