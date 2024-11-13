import 'package:flutter_template/domain/entities/index.dart';

abstract class EquipmentUseCase {
  Future<List<Equipment>> getEquipments();
  Future<List<Equipment>> getEquipmentsByIdEmergency(String idEmergency);
  Future<void> uploadResource(Resource resource);
}
