import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/screens/emergency/notificacion_detail_screen.dart';
import 'package:flutter_template/services/notificaciones_service.dart';
import 'package:flutter_template/domain/entities/index.dart';
import 'package:flutter_template/presentation/components/index.dart';
import 'package:flutter_template/presentation/constants/index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Notificacion> notificaciones = [];

  Future<void> _getNotificaciones() async {
    final response = await getNotificaciones();
      setState((){
        notificaciones = response;
      });
  }

  @override
  void initState() {
    _getNotificaciones();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 25, 45),
      appBar: const CustomAppBar(title: 'Calendario'),
      drawer: const BuildDrawer(),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              grid(notificaciones),
            ],
          ),
        ),
      ),
    );
  }

  Widget header(int emergenciesCount) => const ListTile(
        title: Center(
          child: Text(
            'Bienvenido',
            style: TextStyle(
                color: red, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      );

  Widget grid(List<Notificacion> notificaciones) => Column(
        children: notificaciones.map((notificacion) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificacionDetailScreen(notificacion: notificacion),
                ),
              );
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: NotificationTile(
                title: notificacion.titulo,
                date: notificacion.fechaString,
                site: notificacion.lugarString,
                state: notificacion.estado,
                type: notificacion.tipo,
              ),
            ),
          );
        }).toList(),
      );
}
