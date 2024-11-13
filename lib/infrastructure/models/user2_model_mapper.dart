import '../../domain/entities/index.dart';

class User2ModelMapper {
  static User2 fromJson(Map<String, dynamic> json) {
    return User2(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      name: json['name'],
      password: json['password'],
      lastName: json['last_name'],
      email: json['email'],
      cellphone: json['cellphone'],
      grade: json['grade'],
      birthdate: json['birthdate'],
      urlImage: json['url_image'],
      isActive: json['is_active'],
      isDeleted: json['is_deleted'],
      role: json['role'],
    );
  }

  static List<User2> fromJsonList(List<dynamic> json) {
    return json.map((user) => fromJson(user)).toList();
  }

  static Map<String, dynamic> toJson(User model) {
    return {
      'id': model.id,
      'created_at': model.createdAt.toIso8601String(),
      'updated_at': model.updatedAt.toIso8601String(),
      'name': model.name,
      'last_name': model.lastName,
      'email': model.email,
      'cellphone': model.cellphone,
      'grade': model.grade,
      'birthdate': model.birthdate.toIso8601String(),
      'url_image': model.urlImage,
      'is_active': model.isActive,
      'is_deleted': model.isDeleted,
      'role': model.role,
    };
  }
}