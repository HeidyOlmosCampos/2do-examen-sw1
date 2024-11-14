import '../domain/entities/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instance = UserPreferences._internal();
  late SharedPreferences _prefs;

  factory UserPreferences() => _instance;

  UserPreferences._internal();

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  SharedPreferences get prefs => _prefs;

  String get accessToken => _prefs.getString('accessToken') ?? '';
  int get id => _prefs.getInt('id') ?? 0;
  String get email => _prefs.getString('email') ?? '';
  String get name => _prefs.getString('name') ?? '';
  String get role => _prefs.getString('role') ?? '';

  set accessToken(String accessToken) =>
      _prefs.setString('accessToken', accessToken);
  set id(int id) => _prefs.setInt('id', id);
  set email(String email) => _prefs.setString('email', email);
  set name(String name) => _prefs.setString('name', name);
  set role(String role) => _prefs.setString('role', role);

  static void saveUserPreferences(User data) {
    final prefs = UserPreferences();

    prefs.accessToken = data.accessToken;
    prefs.id = data.uid;
    prefs.email = data.email;
    prefs.name = data.name;
    prefs.role = data.role;
  }

  void clearUser() {
    _prefs.setString('accessToken', '');
    _prefs.setInt('id', 0);
    _prefs.setString('email', '');
    _prefs.setString('name', '');
    _prefs.setString('role', '');
  }
}
