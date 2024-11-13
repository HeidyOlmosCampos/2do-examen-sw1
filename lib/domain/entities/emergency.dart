
class Emergency {
  String id;
  String name;
  String? locationDescription;
  String date;
  String hour;
  String type;
  String state;
  String duration;
  final List<String> coordinates;
  final List<String>? coordinatesE;
  final List<String>? coordinatesPC;

  Emergency({
    required this.id,
    required this.name,
    this.locationDescription,
    required this.date,
    required this.hour,
    required this.type,
    required this.state,
    required this.duration,
    required this.coordinates,
    this.coordinatesE,
    this.coordinatesPC,
  });
}
