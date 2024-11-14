import '../../domain/models/authentication_model.dart';
import '../../domain/entities/index.dart';

class UserModelMapper {
  static User fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['user']['uid'],
      username: json['user']['username'],
      name: json['user']['name'],
      email: json['user']['email'],
      role: json['user']['role'],
      accessToken: json['token']
    );
  }

  static User fromJsonRegister(Map<String, dynamic> json) {
    return User(
      uid: json['user']['uid'],
      username: json['user']['username'],
      name: json['user']['name'],
      email: json['user']['email'],
      role: json['user']['role'],
      accessToken: json['token'] ?? ''
    );
  }

  static List<User> fromJsonList(List<dynamic> json) {
    return json.map((user) => fromJson(user)).toList();
  }

  static Map<String, dynamic> toJson(User model) {
    return {
      'uid': model.uid,
      'username': model.username,
      'name': model.name,
      'email': model.email,
      'role': model.role
    };
  }

  static AuthenticationModel toAuthenticationModel(User user) {
    // Asumiendo que el token no está directamente en el modelo User actualizado,
    // este método puede necesitar ajuste dependiendo de cómo se maneja la autenticación.
    return AuthenticationModel(token: user.accessToken); // Ajuste según sea necesario
  }

  static User copyWith(User user, {
    int? uid,
    String? username,
    String? name,
    String? email,
    String? role,
    String? accessToken
  }) {
    return User(
      uid: uid ?? user.uid,
      username: username ?? user.username,
      name: name ?? user.name,
      email: email ?? user.email,
      role: role ?? user.role,
      accessToken: accessToken ?? user.accessToken,
    );
  }
}
