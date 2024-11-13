import 'package:flutter/material.dart';
import 'package:flutter_template/domain/entities/index.dart';
import 'package:flutter_template/domain/use_cases/index.dart';

class ResourceProvider extends ChangeNotifier {
  final EquipmentUseCase _equipmentUseCase;

  List<Equipment> _resourceList = [];
  bool _isLoading = false;

  ResourceProvider(this._equipmentUseCase);

  bool get isLoading => _isLoading;
  List<Equipment> get resourceList => _resourceList;

  Future<void> getResources(String idEmergency) async {
    _isLoading = true;
    try {
      _resourceList = await _equipmentUseCase.getEquipmentsByIdEmergency(idEmergency);
    } catch (error) {
      throw Exception('Ocurrio un error en el provider al obtener los recursos por emergencia');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> uploadResource(Resource resource) async {
    _isLoading = true;
    notifyListeners();
    try {
      await _equipmentUseCase.uploadResource(resource);
    } catch (error) {
      throw Exception('Ocurrio un error en el provider al insertar un resource');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
