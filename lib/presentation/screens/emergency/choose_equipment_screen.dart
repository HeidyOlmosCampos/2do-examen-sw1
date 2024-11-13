import 'package:flutter/material.dart';
import 'package:flutter_template/domain/entities/index.dart';
import 'package:flutter_template/presentation/components/index.dart';
import 'package:flutter_template/presentation/constants/index.dart';
import 'package:flutter_template/presentation/providers/index.dart';
import 'package:provider/provider.dart';

class ChooseEquipmentScreen extends StatefulWidget {
  final Emergency emergency;

  const ChooseEquipmentScreen({super.key, required this.emergency});

  @override
  _ChooseEquipmentScreenState createState() => _ChooseEquipmentScreenState();
}

class _ChooseEquipmentScreenState extends State<ChooseEquipmentScreen> {
  final String nextButtonText = 'Finalizar';
  List<String> _selectedEquipmentIds = [];

  @override
  Widget build(BuildContext context) {
    final resourceProvider = context.watch<ResourceProvider>();
    final equipmentProvider = context.watch<EquipmentProvider>();
    final List<Equipment> equipmentList = equipmentProvider.equipmentList;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 25, 45),
      appBar: const CustomAppBar(title: 'Selecciona tus Recursos'),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: equipmentList.map((equipment) {
            return SizedBox(
              width: 150,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (_selectedEquipmentIds.contains(equipment.id)) {
                      _selectedEquipmentIds.remove(equipment.id);
                    } else {
                      _selectedEquipmentIds.add(equipment.id);
                    }
                  });
                },
                child: Card(
                  color: _selectedEquipmentIds.contains(equipment.id)
                      ? red
                      : Colors.white,
                  child: Column(
                    children: [
                      Image.network(
                        equipment.urlPhoto,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          equipment.name,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 40),
              child: InkWell(
                onTap: equipmentProvider.isUpdating
                    ? null
                    : () async {
                        if (_selectedEquipmentIds.isNotEmpty) {
                          _selectedEquipmentIds.forEach((equipmentId) async {
                            DateTime now = DateTime.now();

                            final resource = Resource(date: "${now.year}-${now.month}-${now.day}", emergencyId: widget.emergency.id, equipmentId: equipmentId, hour: now.hour.toString(), stateEnd: "Dañado", stateInitial: "Bueno" );
                            await resourceProvider.uploadResource(resource);
                          });
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/', (route) => false);
                          CustomDialog.showSuccessDialog(
                            context,
                            "Selección completada",
                            "Has seleccionado tus equipos correctamente.",
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Error'),
                              content: const Text('Debes seleccionar al menos un equipo.'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      nextButtonText,
                      style: TextStyle(
                        color: _selectedEquipmentIds.isNotEmpty
                            ? red
                            : gray,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: _selectedEquipmentIds.isNotEmpty
                          ? red
                          : gray,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
