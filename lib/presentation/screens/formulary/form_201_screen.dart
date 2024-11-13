import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/constants/index.dart';
import 'package:flutter_template/presentation/screens/formulary/create_form201_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_template/presentation/components/index.dart';
import 'package:flutter_template/presentation/providers/index.dart';

class Form201Screen extends StatefulWidget {
  final String idEmergency;

  Form201Screen({super.key, required this.idEmergency});

  @override
  State<Form201Screen> createState() => _Form201ScreenState();
}

class _Form201ScreenState extends State<Form201Screen> {
  @override
  void initState() {
    super.initState();
    final formularyProvider = context.read<FormularyProvider>();
    formularyProvider.getForms(widget.idEmergency);
  }

  Future<void> _refreshForms() async {
    final formularyProvider = context.read<FormularyProvider>();
    await formularyProvider.getForms(widget.idEmergency);
  }

  @override
  Widget build(BuildContext context) {
    final formularyProvider = context.watch<FormularyProvider>();
    final forms = formularyProvider.formularyList;
    final isLoading = formularyProvider.isLoading;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 25, 45),
      appBar: const CustomAppBar(title: 'Listado de Form 201'),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : forms.isEmpty
              ? const Center(child: Text("No hay formularios disponibles"))
              : ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: forms.length,
                  itemBuilder: (context, index) {
                    final form = forms[index];
                    return Card(
                      color: gray,
                      elevation: 4.0,
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Objetivo: ${form.objective}',
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 8.0),
                            Text('Estrategia: ${form.strategy}',
                                style: const TextStyle(fontSize: 14)),
                            const SizedBox(height: 8.0),
                            Text('Mensaje Seguro: ${form.safetyMessage}',
                                style: const TextStyle(fontSize: 14)),
                            const SizedBox(height: 8.0),
                            Text('Hilo: ${form.thread}',
                                style: const TextStyle(fontSize: 14)),
                            const SizedBox(height: 8.0),
                            Text('Aislamiento: ${form.isolation}',
                                style: const TextStyle(fontSize: 14)),
                            const SizedBox(height: 8.0),
                            Text('Areas Afectadas: ${form.affectedAreas}',
                                style: const TextStyle(fontSize: 14)),
                            const SizedBox(height: 8.0),
                            Text('Tácticas: ${form.tactics}',
                                style: const TextStyle(fontSize: 14)),
                            const SizedBox(height: 8.0),
                            Text('Ruta de Salida: ${form.egressRoute}',
                                style: const TextStyle(fontSize: 14)),
                            const SizedBox(height: 8.0),
                            Text('Ruta de Entrada: ${form.entryRoute}',
                                style: const TextStyle(fontSize: 14)),
                            const SizedBox(height: 8.0),
                            Text('Affected AreasM: ${form.affectedAreasM}',
                                style: const TextStyle(fontSize: 14)),
                            const SizedBox(height: 8.0),
                            Text('Fecha: ${form.date}',
                                style: const TextStyle(fontSize: 14)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: red,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  NewFormScreen(idEmergency: widget.idEmergency)),
        ).then((result) {
          if (result == true) {
            _refreshForms();
          }
        }),
        child: const Icon(
          Icons.add,
          color: white,
        ),
      ),
    );
  }
}
