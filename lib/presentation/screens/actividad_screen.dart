import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/config/dio_config.dart';
import 'package:permission_handler/permission_handler.dart';

class AudioProcessingScreen extends StatefulWidget {
  const AudioProcessingScreen({super.key});

  @override
  _AudioProcessingScreenState createState() => _AudioProcessingScreenState();
}

class _AudioProcessingScreenState extends State<AudioProcessingScreen> {
  File? _audioFile;
  bool _isLoading = false;
  String _responseMessage = '';

  Future<void> _pickAudioFile() async {
    PermissionStatus status = await Permission.storage.request();
    if (status.isGranted) {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.audio,
      );
      if (result != null) {
        setState(() {
          _audioFile = File(result.files.single.path!);
        });
      }
    } else {
      setState(() {
        _responseMessage = 'Permiso denegado para acceder al almacenamiento.';
      });
    }
  }

  Future<void> _processAudio() async {
    if (_audioFile == null) {
      setState(() {
        _responseMessage = 'Por favor, selecciona un archivo de audio.';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _responseMessage = '';
    });

    try {
      var formData = FormData.fromMap({
        'audio': await MultipartFile.fromFile(_audioFile!.path),
        'courseId': 1,
      });

      var response = await DioConfig.dioWithAuthorizationMultipart.post(
        '/teacher-ai/process-class',
        data: formData,
      );

      if (response.statusCode == 200) {
        var responseData = await response.data;
        var jsonResponse = json.decode(responseData);
        setState(() {
          _responseMessage = jsonResponse['message'] ?? 'Audio procesado exitosamente';
        });
      } else {
        setState(() {
          _responseMessage = 'Error al procesar el audio: ${response.statusCode}';
        });
      }
    } catch (error) {
      setState(() {
        _responseMessage = 'Error: $error';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Procesar Audio de Clase'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _pickAudioFile,
              child: Text(_audioFile == null ? 'Seleccionar Archivo de Audio' : 'Archivo Seleccionado'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading ? null : _processAudio,
              child: _isLoading ? const CircularProgressIndicator() : const Text('Procesar Audio'),
            ),
            const SizedBox(height: 20),
            Text(_responseMessage),
          ],
        ),
      ),
    );
  }
}