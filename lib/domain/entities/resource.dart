class Resource {
  final String stateInitial;
  final String stateEnd;
  final String date;
  final String hour;
  final String emergencyId;
  final String equipmentId;

  Resource({
    required this.stateInitial,
    required this.stateEnd,
    required this.date,
    required this.hour,
    required this.emergencyId,
    required this.equipmentId,
  });
}