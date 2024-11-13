import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/constants/index.dart';
import 'package:provider/provider.dart';
import 'package:flutter_template/presentation/components/index.dart';
import 'package:flutter_template/presentation/providers/index.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:permission_handler/permission_handler.dart';

class BitacoraScreen extends StatefulWidget {
  final String idEmergency;

  BitacoraScreen({super.key, required this.idEmergency});

  @override
  State<BitacoraScreen> createState() => _BitacoraScreenState();
}

class _BitacoraScreenState extends State<BitacoraScreen> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _spokenText = '';

  @override
  void initState() {
    super.initState();
    final actionProvider = context.read<ActionProvider>();
    actionProvider.getActionsByEmergency(widget.idEmergency);
    _speech = stt.SpeechToText();
  }

  void _startListening() async {
    var status = await Permission.microphone.status;
    if (!status.isGranted) {
      await Permission.microphone.request();
    }

    if (await Permission.microphone.isGranted) {
      if (!_isListening) {
        bool available = await _speech.initialize(
          onStatus: _onSpeechStatus,
          onError: (val) => print('onError: $val'),
        );
        if (available) {
          setState(() => _isListening = true);
          _speech.listen(
            listenFor: Duration(hours: 1), // Set to a very long duration
            pauseFor: Duration(seconds: 3), // Add a short pause duration
             partialResults: true, // Enable partial results for continuous updates
            onResult: (val) => setState(() {
              _spokenText = val.recognizedWords;
            }),
          );
        }
      }
    } else {
      print('Microphone permission denied');
    }
  }

  void _onSpeechStatus(String status) {
    print('onStatus: $status');
    if (status == 'notListening') {
      _startListening();
    }
  }

  void _stopListening() async {
    setState(() => _isListening = false);
    _speech.stop();
    print('Texto hablado: $_spokenText');
    final actionProvider = context.read<ActionProvider>();
    await actionProvider.uploadAction(widget.idEmergency, _spokenText);
    setState(() {
      _spokenText = ''; // Clear the spoken text
    });
  }

  @override
  Widget build(BuildContext context) {
    final actionProvider = context.watch<ActionProvider>();
    final actions = actionProvider.actionList;
    final isLoading = actionProvider.isLoading;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 25, 45),
      appBar: const CustomAppBar(title: 'Listado de Bitacora'),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : actions.isEmpty
              ? const Center(child: Text("No hay bitacoras"))
              : ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: actions.length,
                  itemBuilder: (context, index) {
                    final action = actions[index];
                    return Card(
                      color: gray,
                      elevation: 4.0,
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Descripcion: ${action.description}',
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 8.0),
                            Text('Fecha: ${action.date}',
                                style: const TextStyle(fontSize: 14)),
                            const SizedBox(height: 8.0),
                            Text('Hora: ${action.hour}',
                                style: const TextStyle(fontSize: 14)),
                            const SizedBox(height: 8.0),
                          ],
                        ),
                      ),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: red,
        onPressed: () {
          if (_isListening) {
            _stopListening();
          } else {
            _startListening();
          }
        },
        child: Icon(
          _isListening ? Icons.mic_off_rounded : Icons.mic_rounded,
          color: white,
        ),
      ),
    );
  }
}
