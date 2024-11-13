import '../../domain/entities/emergency.dart';

class EmergencyModelMapper {
  static Emergency fromJson(Map<String, dynamic> json) {
    String location = '';
    String duration = '';
    List<String> coordinateE = ['-63.11', '-17.79'];
    List<String> coordinatePC = ['-63.13', '-17.79'];

    if (json['location_description'] != null) {
      location = json['location_description'];
    }
    if (json['duration'] != null || json['duration'] != '') {
      duration = json['duration'];
    }
    if (json['coordinates_e'] != null) {
      coordinateE = List<String>.from(json['coordinates_e']);
    }
    if (json['coordinates_pc'] != null) {
      coordinatePC = List<String>.from(json['coordinates_pc']);
    }

    return Emergency(
      id: json['id'],
      name: json['name'],
      locationDescription: location,
      date: json['date'],
      hour: json['hour'],
      type: json['type'],
      state: json['state'],
      duration: duration,
      coordinates: List<String>.from(json['coordinates']),
      coordinatesE: coordinateE,
      coordinatesPC: coordinatePC,
    );
  }

  static List<Emergency> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => fromJson(json)).toList();
  }
}
