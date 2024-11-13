import 'package:flutter_template/config/dio_config.dart';
import 'package:flutter_template/domain/data_sources/index.dart';
import 'package:flutter_template/domain/entities/index.dart';
import 'package:flutter_template/infrastructure/models/index.dart';

class EquipmentDataSourceImpl implements EquipmentDataSource {
  EquipmentDataSourceImpl();

  @override
  Future<List<Equipment>> getEquipments() async {
    try {
      final response = await DioConfig.dioWithAuthorization.get(
        '/equipment',
      );
      var data = response.data['data'];

      List<Equipment> equipments = [];

      for (var equipmentJson in data) {
        equipments.add(EquipmentModelMapper.fromJson(equipmentJson));
      }

      return equipments;
    } catch (e) {
      throw Exception('Error al obtener los equipamientos');
    }
  }

  @override
  Future<List<Equipment>> getEquipmentsByIdEmergency(String idEmergency) async {
    try {
      final response = await DioConfig.dioWithAuthorization.get(
        '/resource/by-emergency/$idEmergency',
      );

      var data = response.data['data'];

      List<Equipment> equipments = [];

      for (var item in data) {
        var equipmentJson = item['equipment'];
        if (equipmentJson != null) {
          equipments.add(EquipmentModelMapper.fromJson(equipmentJson));
        }
      }

      return equipments;
    } catch (e) {
      throw Exception('Error al obtener los equipamientos de la emergencia');
    }
  }

  @override
  Future<void> uploadResource(Resource resource) async {
    try {
      final response = await DioConfig.dioWithAuthorization
          .post('/resource', data: ResourceModelMapper.toJson(resource));
      var data = response.data['data'];
    } catch (e) {
      throw Exception('Error al insertar los recursos');
    }
  }
}
