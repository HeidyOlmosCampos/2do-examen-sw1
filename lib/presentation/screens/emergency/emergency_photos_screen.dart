import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/constants/index.dart';
import 'package:flutter_template/presentation/providers/emergency_image_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_template/presentation/components/index.dart';
import 'dart:io';
import 'package:provider/provider.dart';

class EmergencyPhotosScreen extends StatefulWidget {
  final List<String> imageUrls;
  final String idEmergency;

  const EmergencyPhotosScreen(
      {super.key, required this.imageUrls, required this.idEmergency});

  @override
  _EmergencyPhotosScreenState createState() => _EmergencyPhotosScreenState();
}

class _EmergencyPhotosScreenState extends State<EmergencyPhotosScreen> {
  final ImagePicker _picker = ImagePicker();
  late List<String> _imageUrls;

  @override
  void initState() {
    super.initState();
    _imageUrls = List<String>.from(widget.imageUrls);
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageUrls.add(pickedFile.path);
      });
      final emergencyImageProvider = context.read<EmergencyImageProvider>();
      await emergencyImageProvider
          .uploadImage(widget.idEmergency, pickedFile.path)
          .then((_) {})
          .catchError((error) {
        print('Error uploading image: $error');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 25, 45),
      appBar: const CustomAppBar(title: 'Imágenes de la emergencia'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: _imageUrls.length,
          itemBuilder: (context, index) {
            final imageUrl = _imageUrls[index];
            return imageUrl.startsWith('https')
                ? Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  )
                : Image.file(
                    File(imageUrl),
                    fit: BoxFit.cover,
                  );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: red,
        onPressed: _pickImage,
        child: const Icon(Icons.add_a_photo, color: white),
      ),
    );
  }
}
