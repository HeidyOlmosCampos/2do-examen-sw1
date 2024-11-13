import 'package:flutter_template/domain/entities/index.dart';
import 'package:flutter_template/domain/repositories/index.dart';
import 'package:flutter_template/domain/use_cases/index.dart';

class FormularyUseCaseImpl implements FormularyUseCase {
  final FormularyRepository _formularyRepository;

  FormularyUseCaseImpl(this._formularyRepository);

  @override
  Future<List<Form201>> getForms(String idEmergency) async {
    return await _formularyRepository.getForms(idEmergency);
  }

  @override
  Future<void> uploadForm(String idEmergency, Form201 form) async {
    await _formularyRepository.uploadForm(idEmergency, form);
  }
}
