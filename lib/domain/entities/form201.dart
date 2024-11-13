class Form201 {
  final String objective;
  final String strategy;
  final String safetyMessage;
  final String urlOrganizationChart;
  final String thread;
  final String isolation;
  final String affectedAreas;
  final String tactics;
  final String egressRoute;
  final String entryRoute;
  final String affectedAreasM;
  final String date;
  final String? id;
  String? emergency;
  final String? createdAt;
  final String? updatedAt;

  Form201({
    required this.objective,
    required this.strategy,
    required this.safetyMessage,
    required this.urlOrganizationChart,
    required this.thread,
    required this.isolation,
    required this.affectedAreas,
    required this.tactics,
    required this.egressRoute,
    required this.entryRoute,
    required this.affectedAreasM,
    required this.date,
    this.id,
    this.emergency,
    this.createdAt,
    this.updatedAt,
  });

  set setEmergency(String value) => emergency = value;
}
