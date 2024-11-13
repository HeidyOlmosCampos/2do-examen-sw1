import 'package:flutter_template/domain/data_sources/index.dart';
import 'package:flutter_template/domain/entities/index.dart';
import 'package:flutter_template/domain/repositories/index.dart';

class EquipmentRepositoryImpl implements EquipmentRepository {
  final EquipmentDataSource _equipmentDataSource;

  EquipmentRepositoryImpl(this._equipmentDataSource);

  @override
  Future<List<Equipment>> getEquipments() async {
    try {
      final equipments = await _equipmentDataSource.getEquipments();
      return equipments;
    } catch (e) {
      throw Exception('Error al obtener los equipamientos');
    }
  }

  @override
  Future<List<Equipment>> getEquipmentsByIdEmergency(String idEmergency) async {
    try {
      final equipments =
          await _equipmentDataSource.getEquipmentsByIdEmergency(idEmergency);
      return equipments;
    } catch (e) {
      throw Exception('Error al obtener los equipamientos de la emergencia');
    }
  }

  @override
  Future<void> uploadResource(Resource resource) async {
    try {
      await _equipmentDataSource.uploadResource(resource);
    } catch (e) {
      throw Exception('Error al subir los recursos');
    }
  }
}
