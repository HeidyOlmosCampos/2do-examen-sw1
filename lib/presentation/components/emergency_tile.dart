import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/constants/index.dart';
import 'package:google_fonts/google_fonts.dart';

class EmergencyTile extends StatelessWidget {
  final String state;
  final String date;
  final String hour;
  final String type;
  final String name;

  const EmergencyTile({
    Key? key,
    required this.state,
    required this.date,
    required this.hour,
    required this.type,
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
            name,
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
                Icons.calendar_month,
                color: Colors.white,
                size: 18,
              ),
              const SizedBox(width: 4),
              Text(
                'Fecha - Hora',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            '$date - $hour',
            style: GoogleFonts.inter(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'TIPO: $type',
            style: GoogleFonts.inter(
              fontSize: 14,
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
                        : Colors.yellow;
  }
}
