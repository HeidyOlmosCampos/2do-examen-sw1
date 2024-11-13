import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/screens/politics_private_screen.dart';
import 'package:flutter_template/presentation/screens/terms_and_conditions_screen.dart';
import 'package:flutter_template/share_preferens/user_preferences.dart';
import '../constants/index.dart';

class BuildDrawer extends StatelessWidget {
  const BuildDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final prefs = UserPreferences();

    return Drawer(
      backgroundColor: const Color.fromARGB(255, 1, 25, 45),
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              prefs.name,
              style: const TextStyle(fontSize: 18),
            ),
            accountEmail: Text(
              prefs.email,
              style: const TextStyle(fontSize: 16),
            ),
            decoration: const BoxDecoration(color: red),
          ),
          ListTile(
            leading: const Icon(Icons.my_library_books_sharp, color: red),
            title: const Text(
              'Terminos y Condiciones',
              style: TextStyle(color: red),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const TermsConditionsScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock, color: red),
            title: const Text(
              'Politicas de Privacidad',
              style: TextStyle(color: red),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const PrivateScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app, color: red),
            title: const Text(
              'Cerrar Sesión',
              style: TextStyle(color: red),
            ),
            onTap: () {
              final prefs = UserPreferences();
              prefs.clearUser();
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
