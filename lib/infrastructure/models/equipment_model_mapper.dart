import 'package:flutter_template/domain/entities/index.dart';

class EquipmentModelMapper {
  static Equipment fromJson(Map<String, dynamic> json) {
    return Equipment(
      id: json['id'],
      name: json['name'],
      utilization: json['utilization'],
      description: json['description'],
      acquisitionDate: json['acquisitionDate'],
      stateAcquisition: json['stateAcquisition'],
      stateActual: json['stateActual'],
      urlPhoto: json['urlPhoto'],
    );
  }

  static Map<String, dynamic> toJson(Equipment model) {
    return {
      'id': model.id,
      'name': model.name,
      'utilization': model.utilization,
      'description': model.description,
      'acquisitionDate': model.acquisitionDate,
      'stateAcquisition': model.stateAcquisition,
      'stateActual': model.stateActual,
      'urlPhoto': model.urlPhoto,
    };
  }
}
