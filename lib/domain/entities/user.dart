class User {
  final int uid;
  final String username;
  final String name;
  final String email;
  final String role;
  final String accessToken;

  User({
    required this.uid,
    required this.username,
    required this.name,
    required this.email,
    required this.role,
    required this.accessToken
  });

  @override
  String toString() {
    return 'User(uid: $uid, username: $username, name: $name, email: $email, role: $role, accessToken: $accessToken)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.uid == uid &&
        other.username == username &&
        other.name == name &&
        other.email == email &&
        other.role == role &&
        other.accessToken == accessToken;
  }

  @override
  int get hashCode {
    return
        uid.hashCode ^
        username.hashCode ^
        name.hashCode ^
        email.hashCode ^
        role.hashCode ^
        accessToken.hashCode;
  }
}
