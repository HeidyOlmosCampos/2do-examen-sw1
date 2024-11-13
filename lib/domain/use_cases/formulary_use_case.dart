import 'package:flutter_template/domain/entities/index.dart';

abstract class FormularyUseCase {
Future<List<Form201>> getForms(String idEmergency);
Future<void> uploadForm(String idEmergency, Form201 form);
}