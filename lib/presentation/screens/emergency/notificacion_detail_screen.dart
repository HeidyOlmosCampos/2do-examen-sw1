import 'package:flutter/material.dart';
import 'package:flutter_template/domain/entities/index.dart';
import 'package:flutter_template/presentation/components/index.dart';
import 'package:flutter_template/presentation/constants/index.dart';
import 'package:flutter_template/services/notificaciones_service.dart';

class NotificacionDetailScreen extends StatefulWidget {
  final Notificacion notificacion;

  const NotificacionDetailScreen({super.key, required this.notificacion});

  @override
  State<NotificacionDetailScreen> createState() => _NotificacionDetailScreenState();
}

class _NotificacionDetailScreenState extends State<NotificacionDetailScreen> {

  String estado = '';

  Future<void> _marcarComoLeida(String notificacionId) async {
    final response = await marcarLeido(notificacionId);
      setState((){
        estado = response;
      });
  }

  @override
  void initState() {
    final Notificacion notificacion = widget.notificacion;
    if(notificacion.estado.toUpperCase() == 'ENVIADO'){
      _marcarComoLeida(notificacion.id.toString());
      notificacion.estado = 'LEÍDO';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 25, 45),
      appBar: const CustomAppBar(title: 'Detalles de la Notificacion'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                widget.notificacion.titulo.toUpperCase(),
                style: const TextStyle(
                    fontSize: 24.0, fontWeight: FontWeight.bold, color: red),
              ),
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
                 _buildIndicator(widget.notificacion.tipo, const Color.fromARGB(255, 151, 221, 206)),
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
                    widget.notificacion.fechaString,
                    style: const TextStyle(fontSize: 18.0, color: gray),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            Row(
              children: [
                const Text(
                  'Fecha Cierre:',
                  style: TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.bold, color: red),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    widget.notificacion.fechaCierreString,
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
                    widget.notificacion.hora.toString(),
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
                 _buildIndicator(widget.notificacion.estado.toUpperCase(), const Color.fromARGB(255, 151, 221, 206)),
              ],
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
                    widget.notificacion.mensaje,
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
                    const SizedBox(height: 12.0),
                    ElevatedButton(
                      onPressed: () async {
                        // final emergencyImageProvider =
                        //     context.read<EmergencyImageProvider>();
                        // await emergencyImageProvider
                        //     .getImagesEmergency(notificacion.id);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => 
                        //     EmergencyPhotosScreen(
                        //       imageUrls:
                        //       emergencyImageProvider.emergencyImageList,
                        //       idEmergency: notificacion.id
                        //     ),
                        //   ),
                        // );
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
                    
                  ],
                ),
              ),
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