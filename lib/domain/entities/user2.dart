class User2 {
  final String id;
  final bool isActive;
  final bool isDeleted;
  final String role;
  final String name;
  final String lastName;
  final String password; // Opcional: Normalmente no debería incluirse en la entidad por razones de seguridad
  final String cellphone;
  final String email;
  final String grade;
  final String birthdate;
  final String? urlImage; // Puede ser nulo si no se proporciona
  final String createdAt;
  final String updatedAt;

  User2({
    required this.id,
    required this.isActive,
    required this.isDeleted,
    required this.role,
    required this.name,
    required this.lastName,
    required this.password,
    required this.cellphone,
    required this.email,
    required this.grade,
    required this.birthdate,
    this.urlImage,
    required this.createdAt,
    required this.updatedAt,
  }); 
}