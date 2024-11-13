import 'package:flutter/material.dart';
import 'package:flutter_template/domain/entities/index.dart';
import 'package:flutter_template/domain/use_cases/index.dart';

class EquipmentProvider extends ChangeNotifier {
  final EquipmentUseCase _equipmentUseCase;

  List<Equipment> _equipmentList = [];
  bool _isLoading = false;
  bool _isUpdating = false;
  bool _isLoadingNewEquipments = false;

  EquipmentProvider(this._equipmentUseCase) {
    getEquipments();
  }

  bool get isLoading => _isLoading;
  bool get isUpdating => _isUpdating;
  bool get isLoadingNewEquipments => _isLoadingNewEquipments;
  List<Equipment> get equipmentList => _equipmentList;

  Future<void> getEquipments() async {
    _isLoading = true;
    notifyListeners();
    try {
      _equipmentList = await _equipmentUseCase.getEquipments();
    } catch (error) {
      throw Exception(
          'Ocurrio un error en el provider al obtener los equipamientos');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
