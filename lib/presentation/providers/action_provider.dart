import 'package:flutter/material.dart';
import 'package:flutter_template/domain/entities/index.dart';
import 'package:flutter_template/domain/use_cases/index.dart';

class ActionProvider extends ChangeNotifier {
  final EmergencyUseCase _emergencyUseCase;

  List<Actionn> _actionList = [];
  bool _isLoading = false;

  ActionProvider(this._emergencyUseCase);

  bool get isLoading => _isLoading;
  List<Actionn> get actionList => _actionList;

  Future<void> getActionsByEmergency(String idEmergency) async {
    _isLoading = true;
    try {
      _actionList = await _emergencyUseCase.getActionsByEmergency(idEmergency);
    } catch (error) {
      throw Exception(
          'Ocurrio un error en el provider al obtener las acciones por emergencia');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> uploadAction(String idEmergency, String prompt) async {
    _isLoading = true;
    notifyListeners();
    try {
      List<Actionn> actionsNews =
          await _emergencyUseCase.uploadAction(idEmergency, prompt);
      _actionList.addAll(actionsNews);
    } catch (error) {
      throw Exception('Ocurrio un error en el provider al insertar una accion');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
