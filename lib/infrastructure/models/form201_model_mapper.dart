import '../../domain/entities/form201.dart';

class Form201ModelMapper {
  static Form201 fromJson(Map<String, dynamic> json) {
    return Form201(
      objective: json['objective'],
      strategy: json['strategy'],
      safetyMessage: json['safety_message'],
      urlOrganizationChart: json['url_organization_chart'],
      thread: json['thread'],
      isolation: json['isolation'],
      affectedAreas: json['affected_areas'],
      tactics: json['tactics'],
      egressRoute: json['egress_route'],
      entryRoute: json['entry_route'],
      affectedAreasM: json['affected_areasM'],
      date: json['date'],
      id: json['id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  static Map<String, dynamic> toJson(Form201 model) {
    return {
      'objective': model.objective,
      'strategy': model.strategy,
      'safety_message': model.safetyMessage,
      'url_organization_chart': model.urlOrganizationChart,
      'thread': model.thread,
      'isolation': model.isolation,
      'affected_areas': model.affectedAreas,
      'tactics': model.tactics,
      'egress_route': model.egressRoute,
      'entry_route': model.entryRoute,
      'affected_areasM': model.affectedAreasM,
      'date': model.date,
      'emergency': model.emergency,
    };
  }
}
