import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/constants/index.dart';
import 'package:google_fonts/google_fonts.dart';

class UserTile extends StatelessWidget {
  final String cellphone;
  final String role;
  final String grade;
  final String name;

  const UserTile({
    Key? key,
    required this.cellphone,
    required this.role,
    required this.grade,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: red,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name.toUpperCase(),
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.phone,
                color: Colors.white,
                size: 18,
              ),
              const SizedBox(width: 4),
              Text(
                'Telefono - Rol',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            '$cellphone - $role',
            style: GoogleFonts.inter(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Grado: $grade',
            style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Color getStatusColor(String type) {
    return type == 'incendio'
        ? Colors.orange
        : type == 'cancelada'
            ? Colors.red
            : type == 'finalizado'
                ? Colors.green
                : type == 'postergada'
                    ? Colors.blue
                    : type == 'no realizada'
                        ? Colors.grey
                        : Colors.orange;
  }
}
