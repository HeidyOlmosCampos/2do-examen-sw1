import 'package:flutter_template/domain/entities/index.dart';
import 'package:flutter_template/domain/repositories/index.dart';
import 'package:flutter_template/domain/use_cases/index.dart';

class EquipmentUseCaseImpl implements EquipmentUseCase {
  final EquipmentRepository _equipmentRepository;

  EquipmentUseCaseImpl(this._equipmentRepository);

  @override
  Future<List<Equipment>> getEquipments() async {
    return await _equipmentRepository.getEquipments();
  }

  @override
  Future<List<Equipment>> getEquipmentsByIdEmergency(String idEmergency) async {
    return await _equipmentRepository.getEquipmentsByIdEmergency(idEmergency);
  }

  @override
  Future<void> uploadResource(Resource resource) async {
    return await _equipmentRepository.uploadResource(resource);
  }
}
