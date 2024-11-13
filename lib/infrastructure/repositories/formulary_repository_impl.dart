import 'package:flutter_template/domain/data_sources/index.dart';
import 'package:flutter_template/domain/entities/index.dart';
import 'package:flutter_template/domain/repositories/index.dart';

class FormularyRepositoryImpl implements FormularyRepository {
  final FormularyDataSource _formularyDataSource;

  FormularyRepositoryImpl(this._formularyDataSource);

  @override
  Future<List<Form201>> getForms(String idEmergency) async {
    try {
      final forms = await _formularyDataSource.getForms(idEmergency);
      return forms;
    } catch (e) {
      throw Exception('Error al obtener los form201');
    }
  }

  @override
  Future<void> uploadForm(String idEmergency, Form201 form) async {
    try {
      await _formularyDataSource.uploadForm(idEmergency, form);
    } catch (e) {
      throw Exception('Error al insertar un form201');
    }
  }
}
