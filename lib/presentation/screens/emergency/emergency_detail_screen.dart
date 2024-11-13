import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/providers/emergency_image_provider.dart';
import 'package:flutter_template/presentation/screens/emergency/bitacora_screen.dart';
import 'package:flutter_template/presentation/screens/emergency/emergency_equipment_screen.dart';
import 'package:flutter_template/presentation/screens/emergency/emergency_map_screen.dart';
import 'package:flutter_template/presentation/screens/emergency/emergency_personal_screen.dart';
import 'package:flutter_template/presentation/screens/emergency/emergency_photos_screen.dart';
import 'package:flutter_template/presentation/screens/formulary/formulary_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_template/domain/entities/index.dart';
import 'package:flutter_template/presentation/components/index.dart';
import 'package:flutter_template/presentation/constants/index.dart';
import 'package:flutter_template/presentation/providers/index.dart';

class EmergencyDetailsScreen extends StatefulWidget {
  final Emergency emergency;

  const EmergencyDetailsScreen({super.key, required this.emergency});

  @override
  State<EmergencyDetailsScreen> createState() => _EmergencyDetailsScreenState();
}

class _EmergencyDetailsScreenState extends State<EmergencyDetailsScreen> {
  @override
  void initState() {
    super.initState();
    final Emergency emergency = widget.emergency;
  }

  @override
  Widget build(BuildContext context) {
    final Emergency emergency = widget.emergency;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 25, 45),
      appBar: const CustomAppBar(title: 'Detalles de la Emergencia'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                widget.emergency.name.toUpperCase(),
                style: const TextStyle(
                    fontSize: 24.0, fontWeight: FontWeight.bold, color: red),
              ),
            ),
            const SizedBox(height: 12.0),
            Row(
              children: [
                const Text(
                  'Descripción:',
                  style: TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.bold, color: red),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    widget.emergency.locationDescription ??
                        'No hay descripción disponible',
                    style: const TextStyle(fontSize: 18.0, color: gray),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            Row(
              children: [
                const Text(
                  'Fecha:',
                  style: TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.bold, color: red),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    widget.emergency.date,
                    style: const TextStyle(fontSize: 18.0, color: gray),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            Row(
              children: [
                const Text(
                  'Hora:',
                  style: TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.bold, color: red),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    widget.emergency.hour,
                    style: const TextStyle(fontSize: 18.0, color: gray),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            Row(
              children: [
                const Text(
                  'Estado:',
                  style: TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.bold, color: red),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    widget.emergency.state,
                    style: const TextStyle(fontSize: 18.0, color: gray),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            Row(
              children: [
                const Text(
                  'Tipo:',
                  style: TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.bold, color: red),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    widget.emergency.type,
                    style: const TextStyle(fontSize: 18.0, color: gray),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24.0),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        final emergencyImageProvider =
                            context.read<EmergencyImageProvider>();
                        Emergency newEmergency = await emergencyImageProvider
                            .getEmergencyById(emergency.id);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                EmergencyMapScreen(emergency: newEmergency),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: red,
                        minimumSize: const Size.fromHeight(50),
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text(
                        'Mapa Situacional',
                        style: TextStyle(color: white),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    ElevatedButton(
                      onPressed: () async {
                        final emergencyImageProvider =
                            context.read<EmergencyImageProvider>();
                        await emergencyImageProvider
                            .getImagesEmergency(emergency.id);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EmergencyPhotosScreen(
                                imageUrls:
                                    emergencyImageProvider.emergencyImageList,
                                idEmergency: emergency.id),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: red,
                        minimumSize: const Size.fromHeight(50),
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text(
                        'Imagenes Adjuntas',
                        style: TextStyle(color: white),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EmergencyPersonalScreen(
                                idEmergency: emergency.id),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: red,
                        minimumSize: const Size.fromHeight(50),
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text(
                        'Personal',
                        style: TextStyle(color: white),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                EquipmentScreen(emergency: widget.emergency),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: red,
                        minimumSize: const Size.fromHeight(50),
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text(
                        'Recursos',
                        style: TextStyle(color: white),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FormularyScreen(
                              idEmergency: emergency.id,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: red,
                        minimumSize: const Size.fromHeight(50),
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text(
                        'Formularios',
                        style: TextStyle(color: white),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BitacoraScreen(
                              idEmergency: emergency.id,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: red,
                        minimumSize: const Size.fromHeight(50),
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text(
                        'Bitacora',
                        style: TextStyle(color: white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
