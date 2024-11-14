
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
      'id': model.uid,
      'created_at': "",
      'updated_at': "",
      'name': model.name,
      'last_name': "",
      'email': model.email,
      'cellphone': "",
      'grade': "",
      'birthdate': "",
      'url_image': "",
      'is_active': "",
      'is_deleted': "",
      'role': model.role,
    };
  }
}