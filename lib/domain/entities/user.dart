class User {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String name;
  final String lastName;
  final String email;
  final String cellphone;
  final String grade;
  final DateTime birthdate;
  final String? profileUrl;
  final String? urlImage;
  final bool isActive;
  final bool isDeleted;
  final String role;
  final String? password;
  final String accessToken;

  User({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.lastName,
    required this.email,
    required this.cellphone,
    required this.grade,
    required this.birthdate,
    this.profileUrl,
    this.urlImage,
    required this.isActive,
    required this.isDeleted,
    this.password,
    required this.accessToken,
    required this.role,
  });

  @override
  String toString() {
    return 'User(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, name: $name, lastName: $lastName, email: $email, cellphone: $cellphone, grade: $grade, birthdate: $birthdate, profileUrl: $profileUrl, urlImage: $urlImage, isActive: $isActive, isDeleted: $isDeleted, role: $role, accessToken: $accessToken)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.name == name &&
        other.lastName == lastName &&
        other.email == email &&
        other.cellphone == cellphone &&
        other.grade == grade &&
        other.birthdate == birthdate &&
        other.profileUrl == profileUrl &&
        other.urlImage == urlImage &&
        other.urlImage == urlImage &&
        other.isActive == isActive &&
        other.isDeleted == isDeleted &&
        other.role == role &&
        other.accessToken == accessToken;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        name.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        cellphone.hashCode ^
        grade.hashCode ^
        birthdate.hashCode ^
        profileUrl.hashCode ^
        urlImage.hashCode ^
        urlImage.hashCode ^
        isActive.hashCode ^
        isDeleted.hashCode ^
        role.hashCode ^
        accessToken.hashCode;
  }
}
