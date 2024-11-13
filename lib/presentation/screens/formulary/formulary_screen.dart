import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/components/index.dart';
import 'package:flutter_template/presentation/constants/index.dart';
import 'package:flutter_template/presentation/screens/formulary/form_201_screen.dart';

class FormularyScreen extends StatefulWidget {
  String idEmergency;
  FormularyScreen({super.key, required this.idEmergency});

  @override
  State<FormularyScreen> createState() => _FormularyScreenState();
}

class _FormularyScreenState extends State<FormularyScreen> {
  void navigateToForm(BuildContext context, String form) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                Form201Screen(idEmergency: widget.idEmergency)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 25, 45),
      appBar: const CustomAppBar(title: 'Formularios'),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          formButton(context, 'FORM 201'),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }

  Widget formButton(BuildContext context, String form) {
    return ElevatedButton(
      onPressed: () => navigateToForm(context, form),
      style: ElevatedButton.styleFrom(
        backgroundColor: red,
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Text(
        form,
        style: const TextStyle(fontSize: 18, color: white),
      ),
    );
  }
}
