class AuthenticationResult {
  late int id;
  late String username;
  late String token;

  AuthenticationResult(this.id, this.username, this.token);

  AuthenticationResult.fromMap(Map<String, dynamic> json) {
    username = json['username'];
    id = json['id'];
    token = json['token'];
  }

}