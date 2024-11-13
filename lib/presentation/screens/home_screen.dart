import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/screens/emergency/emergency_detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_template/domain/entities/index.dart';
import 'package:flutter_template/presentation/components/index.dart';
import 'package:flutter_template/presentation/constants/index.dart';
import 'package:flutter_template/presentation/providers/index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final emergencyProvider = context.watch<EmergencyProvider>();
    final emergencies = emergencyProvider.emergencyList;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 25, 45),
      appBar: const CustomAppBar(title: 'Emergencias'),
      drawer: const BuildDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            header(emergencies.length),
            const SizedBox(height: 20),
            grid(emergencies),
          ],
        ),
      ),
    );
  }

  Widget header(int emergenciesCount) => ListTile(
        title: const Center(
          child: Text(
            'Bienvenido',
            style: TextStyle(
                color: red, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        subtitle: Center(
          child: Text(
            'Total: $emergenciesCount emergencias',
            style: const TextStyle(color: Colors.grey),
          ),
        ),
      );

  Widget grid(List<Emergency> emergencies) => Column(
        children: emergencies.map((emergency) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EmergencyDetailsScreen(emergency: emergency),
                ),
              );
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: EmergencyTile(
                name: emergency.name,
                date: emergency.date,
                hour: emergency.hour,
                state: emergency.state,
                type: emergency.type.toUpperCase(),
              ),
            ),
          );
        }).toList(),
      );
}
