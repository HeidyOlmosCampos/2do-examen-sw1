import '../../domain/models/authentication_model.dart';
import '../../domain/entities/index.dart';

class UserModelMapper {
  static User fromJson(Map<String, dynamic> json) {
    return User(
      id: json['User']['id'],
      createdAt: DateTime.parse(json['User']['createdAt']),
      updatedAt: DateTime.parse(json['User']['updatedAt']),
      name: json['User']['name'],
      lastName: json['User']['last_name'],
      email: json['User']['email'],
      cellphone: json['User']['cellphone'],
      grade: json['User']['grade'],
      birthdate: DateTime.parse(json['User']['birthdate']),
      profileUrl: json['User']['profile_url'],
      urlImage: json['User']['url_image'],
      isActive: json['User']['is_active'],
      isDeleted: json['User']['is_deleted'],
      role: json['User']['role'],
      password: json['User']['password'],
      accessToken: json['accessToken'],
    );
  }

  static User fromJsonRegister(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      createdAt: DateTime.parse(json['User']['createdAt']),
      updatedAt: DateTime.parse(json['User']['updatedAt']),
      name: json['User']['name'],
      lastName: json['User']['last_name'],
      email: json['User']['email'],
      cellphone: json['User']['cellphone'],
      grade: json['User']['grade'],
      birthdate: DateTime.parse(json['User']['birthdate']),
      profileUrl: json['User']['profile_url'],
      urlImage: json['User']['url_image'],
      isActive: json['User']['is_active'],
      isDeleted: json['User']['is_deleted'],
      role: json['User']['role'],
      password: json['User']['password'],
      accessToken: json['accessToken'] ?? '',
    );
  }

  static List<User> fromJsonList(List<dynamic> json) {
    return json.map((user) => fromJson(user)).toList();
  }

  static Map<String, dynamic> toJson(User model) {
    return {
      'id': model.id,
      'createdAt': model.createdAt.toIso8601String(),
      'updatedAt': model.updatedAt.toIso8601String(),
      'name': model.name,
      'last_name': model.lastName,
      'email': model.email,
      'cellphone': model.cellphone,
      'grade': model.grade,
      'birthdate': model.birthdate.toIso8601String(),
      'profile_url': model.profileUrl,
      'url_image': model.urlImage,
      'is_active': model.isActive,
      'is_deleted': model.isDeleted,
      'role': model.role,
    };
  }

  static AuthenticationModel toAuthenticationModel(User user) {
    // Asumiendo que el token no está directamente en el modelo User actualizado,
    // este método puede necesitar ajuste dependiendo de cómo se maneja la autenticación.
    return AuthenticationModel(token: user.accessToken); // Ajuste según sea necesario
  }

  static User copyWith(User user, {
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? name,
    String? lastName,
    String? email,
    String? cellphone,
    String? grade,
    DateTime? birthdate,
    String? profileUrl,
    String? urlImage,
    bool? isActive,
    bool? isDeleted,
    String? role,
    String? password,
    String? accessToken
  }) {
    return User(
      id: id ?? user.id,
      createdAt: createdAt ?? user.createdAt,
      updatedAt: updatedAt ?? user.updatedAt,
      name: name ?? user.name,
      lastName: lastName ?? user.lastName,
      email: email ?? user.email,
      cellphone: cellphone ?? user.cellphone,
      grade: grade ?? user.grade,
      birthdate: birthdate ?? user.birthdate,
      profileUrl: profileUrl ?? user.profileUrl,
      urlImage: urlImage ?? user.urlImage,
      isActive: isActive ?? user.isActive,
      isDeleted: isDeleted ?? user.isDeleted,
      role: role ?? user.role,
      password: password ?? user.password,
      accessToken: accessToken ?? user.accessToken,
    );
  }
}
