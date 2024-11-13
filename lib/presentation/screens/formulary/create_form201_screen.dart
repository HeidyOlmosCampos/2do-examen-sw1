import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/components/index.dart';
import 'package:flutter_template/presentation/constants/index.dart';
import 'package:provider/provider.dart';
import 'package:flutter_template/domain/entities/form201.dart';
import 'package:flutter_template/presentation/providers/index.dart';

class NewFormScreen extends StatefulWidget {
  final String idEmergency;

  const NewFormScreen({super.key, required this.idEmergency});

  @override
  State<NewFormScreen> createState() => _NewFormScreenState();
}

class _NewFormScreenState extends State<NewFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _objectiveController = TextEditingController();
  final _strategyController = TextEditingController();
  final _safetyMessageController = TextEditingController();
  final _threadController = TextEditingController();
  final _isolationController = TextEditingController();
  final _affectedAreasController = TextEditingController();
  final _tacticsController = TextEditingController();
  final _egressRouteController = TextEditingController();
  final _entryRouteController = TextEditingController();
  final _affectedAreasMController = TextEditingController();
  final _dateController = TextEditingController();

  @override
  void dispose() {
    _objectiveController.dispose();
    _strategyController.dispose();
    _safetyMessageController.dispose();
    _threadController.dispose();
    _isolationController.dispose();
    _affectedAreasController.dispose();
    _tacticsController.dispose();
    _egressRouteController.dispose();
    _entryRouteController.dispose();
    _affectedAreasMController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final newForm = Form201(
          objective: _objectiveController.text,
          strategy: _strategyController.text,
          safetyMessage: _safetyMessageController.text,
          urlOrganizationChart: '',
          thread: _threadController.text,
          isolation: _isolationController.text,
          affectedAreas: _affectedAreasController.text,
          tactics: _tacticsController.text,
          egressRoute: _egressRouteController.text,
          entryRoute: _entryRouteController.text,
          affectedAreasM: _affectedAreasMController.text,
          date: _dateController.text,
          emergency: widget.idEmergency);

      final formularyProvider = context.read<FormularyProvider>();
      await formularyProvider.addForm(widget.idEmergency, newForm).then((_) {
        Navigator.pop(context, true);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 25, 45),
      appBar: const CustomAppBar(title: 'Formulario 201'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                style: const TextStyle(color: gray),
                controller: _objectiveController,
                decoration: const InputDecoration(labelText: 'Objetivo'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an objective';
                  }
                  return null;
                },
              ),
              TextFormField(
                style: const TextStyle(color: gray),
                controller: _strategyController,
                decoration: const InputDecoration(labelText: 'Estrategia'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a strategy';
                  }
                  return null;
                },
              ),
              TextFormField(
                style: const TextStyle(color: gray),
                controller: _safetyMessageController,
                decoration: const InputDecoration(labelText: 'Mensaje de Seguridad'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a safety message';
                  }
                  return null;
                },
              ),
              TextFormField(
                style: const TextStyle(color: gray),
                controller: _threadController,
                decoration: const InputDecoration(labelText: 'Hilo'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a thread';
                  }
                  return null;
                },
              ),
              TextFormField(
                style: const TextStyle(color: gray),
                controller: _isolationController,
                decoration: const InputDecoration(labelText: 'Aislamiento'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter isolation details';
                  }
                  return null;
                },
              ),
              TextFormField(
                style: const TextStyle(color: gray),
                controller: _affectedAreasController,
                decoration: const InputDecoration(labelText: 'Areas Afectadas'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter affected areas';
                  }
                  return null;
                },
              ),
              TextFormField(
                style: const TextStyle(color: gray),
                controller: _tacticsController,
                decoration: const InputDecoration(labelText: 'Tacticas'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter tactics';
                  }
                  return null;
                },
              ),
              TextFormField(
                style: const TextStyle(color: gray),
                controller: _egressRouteController,
                decoration: const InputDecoration(labelText: 'Ruta de Salida'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an egress route';
                  }
                  return null;
                },
              ),
              TextFormField(
                style: const TextStyle(color: gray),
                controller: _entryRouteController,
                decoration: const InputDecoration(labelText: 'Ruta de Entrada'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an entry route';
                  }
                  return null;
                },
              ),
              TextFormField(
                style: const TextStyle(color: gray),
                controller: _affectedAreasMController,
                decoration: const InputDecoration(labelText: 'Areas Afectadas (mtrs)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter affected areasM';
                  }
                  return null;
                },
              ),
              TextFormField(
                style: const TextStyle(color: gray),
                controller: _dateController,
                decoration: const InputDecoration(labelText: 'Fecha'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a date';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: red,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Crear',
                  style: TextStyle(color: white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
