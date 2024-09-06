import 'dart:convert';

import 'package:ex4_login/models/authentication_result.dart';
import 'package:ex4_login/models/useraccount.dart';
import 'package:ex4_login/services/dummyapi.dart';
import 'package:http/http.dart' as http;

class UserAccountRoutes extends DummyAPI {
  static const authRoutes = '${DummyAPI.apiUrl}/auth/login';
  static const userAccountRoutes = '${DummyAPI.apiUrl}/users';

  Future insert(UserAccount useraccount) async {
    var result = await http.post(Uri.https(DummyAPI.apiServer, '$userAccountRoutes/add'),
        body: useraccount.toMap());
    if (result.statusCode != 200) throw StatusErrorException(result.statusCode);
  }

  Future search(String username) async {
    var result = await http.get(Uri.https(DummyAPI.apiServer, '$userAccountRoutes/search',
      { 'q' : username }));
    if (result.statusCode != 200) throw StatusErrorException(result.statusCode);
    final Map<String, dynamic> datas = jsonDecode(result.body);
    return datas['total'] > 0;
  }

  Future<AuthenticationResult> authenticate(String username, String password) async {
    var result = await http.post(Uri.https(DummyAPI.apiServer, authRoutes),
        body: { 'username' : username, 'password' : password});
    if (result.statusCode != 200) throw StatusErrorException(result.statusCode);
    final Map<String, dynamic> datas = jsonDecode(result.body);
    return AuthenticationResult.fromMap(datas);
  }

}