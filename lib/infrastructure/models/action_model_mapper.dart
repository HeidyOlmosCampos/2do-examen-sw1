import 'package:flutter_template/domain/entities/index.dart';

class ActionModelMapper {
  static Actionn fromJson(Map<String, dynamic> json) {
    return Actionn(
      id: json['id'],
      description: json['description'],
      date: json['date'],
      hour: json['hour'],
    );
  }

  static Map<String, dynamic> toJson(Actionn action) {
    return {
      'id': action.id,
      'description': action.description,
      'date': action.date,
      'hour': action.hour,
    };
  }
}
