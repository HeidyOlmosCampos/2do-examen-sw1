import 'package:flutter/material.dart';
import 'package:flutter_template/domain/entities/index.dart';
import 'package:flutter_template/domain/use_cases/index.dart';

class EmergencyProvider extends ChangeNotifier {
  final EmergencyUseCase _emergencyUseCase;

  List<Emergency> _emergencyList = [];
  bool _isLoading = false;
  bool _isLoadingNewEmergencies = false;

  EmergencyProvider(this._emergencyUseCase) {
    getEmergencies();
  }

  bool get isLoading => _isLoading;
  bool get isLoadingNewEmergencies => _isLoadingNewEmergencies;
  List<Emergency> get emergencyList => _emergencyList;

  Future<void> getEmergencies() async {
    _isLoading = true;
    notifyListeners();
    try {
      _emergencyList = await _emergencyUseCase.getEmergencies();
    } catch (error) {
      throw Exception(
          'Ocurrio un error en el provider al obtener las emergencias');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}