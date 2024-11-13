import 'package:flutter/material.dart';
import 'package:flutter_template/domain/entities/index.dart';
import 'package:flutter_template/domain/use_cases/index.dart';

class FormularyProvider extends ChangeNotifier {
  final FormularyUseCase _formularyUseCase;

  List<Form201> _formularyList = [];
  bool _isLoading = false;

  FormularyProvider(this._formularyUseCase);

  bool get isLoading => _isLoading;
  List<Form201> get formularyList => _formularyList;

  Future<void> getForms(String idEmergency) async {
    _isLoading = true;
    try {
      _formularyList = await _formularyUseCase.getForms(idEmergency);
    } catch (error) {
      throw Exception('Ocurrio un error en el provider al obtener los form201');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addForm(String idEmergency, Form201 form) async {
    _isLoading = true;
    notifyListeners();
    try {
      await _formularyUseCase.uploadForm(idEmergency, form);
      _formularyList.add(form);
    } catch (error) {
      throw Exception('Ocurrio un error en el provider al insertar un form201');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
