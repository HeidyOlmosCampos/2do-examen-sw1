import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_template/domain/entities/index.dart';
import 'package:flutter_template/presentation/components/index.dart';
import 'package:flutter_template/presentation/constants/index.dart';
import 'package:flutter_template/presentation/providers/index.dart';

class EmergencyPersonalScreen extends StatefulWidget {
  final String idEmergency;

  const EmergencyPersonalScreen({super.key, required this.idEmergency});

  @override
  State<EmergencyPersonalScreen> createState() =>
      _EmergencyPersonalScreenState();
}

class _EmergencyPersonalScreenState extends State<EmergencyPersonalScreen> {
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    final emergencyUserProvider = context.read<EmergencyImageProvider>();
    emergencyUserProvider.getUserEmergency(widget.idEmergency);
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final emergencyImageProvider = context.read<EmergencyImageProvider>();
      await emergencyImageProvider
          .uploadImageScanUser(widget.idEmergency, pickedFile.path)
          .then((_) {})
          .catchError((error) {
        print('Error uploading image: $error');
      });
      final emergencyUserProvider = context.read<EmergencyImageProvider>();
      await emergencyUserProvider.getUserEmergency(widget.idEmergency);
    }
  }

  @override
  Widget build(BuildContext context) {
    final emergencyUserProvider = context.watch<EmergencyImageProvider>();
    final userEmergency = emergencyUserProvider.emergencyUserList;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 25, 45),
      appBar: const CustomAppBar(title: 'Personal'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            header(userEmergency.length),
            const SizedBox(height: 20),
            grid(userEmergency),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickImage,
        backgroundColor: red,
        child: const Icon(Icons.add_a_photo, color: white),
      ),
    );
  }

  Widget header(int emergenciesCount) => ListTile(
        title: const Center(
          child: Text(
            'Listado de Personal',
            style: TextStyle(
              color: red,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        subtitle: Center(
          child: Text(
            'Total: $emergenciesCount personal para la emergencia',
            style: const TextStyle(color: gray),
          ),
        ),
      );

  Widget grid(List<User2> users) => Column(
        children: users.map((user) {
          return GestureDetector(
            onTap: () {
              // Lógica para lo que quieres hacer al hacer tap en un usuario
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: UserTile(
                name: user.name,
                role: user.role,
                cellphone: user.cellphone,
                grade: user.grade.toLowerCase(),
              ),
            ),
          );
        }).toList(),
      );
}
