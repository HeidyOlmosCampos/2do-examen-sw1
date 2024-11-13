import '../../domain/entities/index.dart';

class ResourceModelMapper {
  static Resource fromJson(Map<String, dynamic> json) {
    return Resource(
      stateInitial: json['state_initial'],
      stateEnd: json['state_end'],
      date: json['date'],
      hour: json['hour'],
      emergencyId: json['emergencyId'],
      equipmentId: json['equipmentId'],
    );
  }

  static Map<String, dynamic> toJson(Resource model) {
    return {
      'state_initial': model.stateInitial,
      'state_end': model.stateEnd,
      'date': model.date,
      'hour': model.hour,
      'emergencyId': model.emergencyId,
      'equipmentId': model.equipmentId,
    };
  }
}
