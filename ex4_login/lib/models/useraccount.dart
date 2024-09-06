class UserAccount {
  late int? id;
  late String username;
  String? password;

  UserAccount({required this.username, this.id, this.password} );

  UserAccount.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id.toString(),
      'username' : username,
      'password' : password
    };
  }

  @override
  String toString() {
    return username;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAccount &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}