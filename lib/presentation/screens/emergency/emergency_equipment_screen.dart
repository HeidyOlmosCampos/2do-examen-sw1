import 'package:flutter/material.dart';
import 'package:flutter_template/domain/entities/index.dart';
import 'package:flutter_template/presentation/components/index.dart';
import 'package:flutter_template/presentation/constants/index.dart';
import 'package:flutter_template/presentation/providers/index.dart';
import 'package:flutter_template/presentation/screens/emergency/choose_equipment_screen.dart';
import 'package:provider/provider.dart';

class EquipmentScreen extends StatefulWidget {
  final Emergency emergency;

  const EquipmentScreen({super.key, required this.emergency});

  @override
  State<EquipmentScreen> createState() => _EquipmentScreenState();
}

class _EquipmentScreenState extends State<EquipmentScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final equipmentProvider = context.read<ResourceProvider>();
    equipmentProvider.getResources(widget.emergency.id);
  }

  @override
  Widget build(BuildContext context) {
    final equipmentProvider = context.watch<ResourceProvider>();
    final List<Equipment> equipmentList = equipmentProvider.resourceList;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 25, 45),
      appBar: const CustomAppBar(title: 'Recursos de la Emergencia'),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
        child: equipmentList.isEmpty
            ? const Text(
                'No hay recursos asignados. Asigna alguno!',
                style: TextStyle(color: gray, fontSize: 18),
              )
            : Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: equipmentList.map((equipment) {
                  return SizedBox(
                    width: 150,
                    child: Card(
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
                  );
                }).toList(),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: red,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChooseEquipmentScreen(
                      emergency: widget.emergency,
                    )),
          );
        },
        child: const Icon(
          Icons.add,
          color: white,
        ),
      ),
    );
  }
}
