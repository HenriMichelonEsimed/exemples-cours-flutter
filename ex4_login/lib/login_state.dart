import 'package:ex4_login/models/useraccount.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginState extends ChangeNotifier {
  UserAccount? _user;
  String? _token;

  LoginState() {
    SharedPreferences.getInstance().then((prefs) {
      final token = prefs.getString("token");
      final id = int.parse(prefs.getString("id") ?? '-1');
      final username = prefs.getString("username");
      if ((token != null) && (username != null)) {
        _user = UserAccount(id: id, username: username);
        _token = token;
        notifyListeners();
      }
    });
  }

  bool get connected => _user != null;
  UserAccount get user => _user!;
  String get token => _token!;

  set token(String value) {
    _token = value;
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString("token", _token!);
    });
  }

  set user(UserAccount value) {
    _user = value;
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString("id", _user!.id.toString());
      prefs.setString("username", _user!.username);
    });
  }

  disconnect() {
    SharedPreferences.getInstance().then((prefs) {
      prefs.remove("token");
      prefs.remove("id");
      prefs.remove("username");
    });
    _user = null;
    _token = null;
    notifyListeners();
  }

}