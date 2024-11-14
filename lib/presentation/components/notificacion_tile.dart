import 'package:flutter/material.dart';

class NotificationTile extends StatelessWidget {
  final String title;
  final String site;
  final String date;
  final String state;
  final String type;

  const NotificationTile({
    super.key,
    required this.title,
    required this.site,
    required this.date,
    required this.state,
    required this.type
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 5.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF3E9FF), // Color de fondo similar al de la imagen
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoText("TITULO:", title, Colors.purple, FontWeight.bold),
          _buildInfoText("LUGAR:", site, Colors.purple, FontWeight.bold),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildIndicator(date.toUpperCase(), const Color.fromARGB(255, 151, 221, 206)),
              _buildIndicator(type.toUpperCase(), const Color(0xFFB5A6D3)),
              _buildIndicator(state.toUpperCase(), const Color.fromARGB(255, 240, 147, 135)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoText(String label, String value, Color labelColor, FontWeight fontWeight) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "$label ",
              style: TextStyle(color: labelColor, fontWeight: fontWeight),
            ),
            TextSpan(
              text: value,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIndicator(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: getBoxColor(text, color),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
        )
      ),
    );
  }
}


getBoxColor(String text, Color color) {
  if (text == 'LEÍDO') {
    return Colors.green;
  } else if (text == 'RECIBIDO') {
    return const Color.fromARGB(255, 108, 175, 230);
  } else {
    return color;
  }
}