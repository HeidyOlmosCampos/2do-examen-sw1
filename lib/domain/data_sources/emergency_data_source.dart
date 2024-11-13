import 'package:flutter_template/domain/entities/index.dart';

abstract class EmergencyDataSource {
  Future<List<Emergency>> getEmergencies();
  Future<Emergency> getEmergencyById(String idEmergency);
  Future<List<String>> getImagesEmergency(String idEmergency);
  Future<void> uploadImage(String idEmergency, String url);
  Future<List<User2>> uploadImageScanUser(String idEmergency, String url);
  Future<List<User2>> getUserEmergency(String idEmergency);
  Future<void> uploadCoordinatesE(String idEmergency, List<double> coordinatesE);
  Future<void> uploadCoordinatesPC(String idEmergency, List<double> coordinatesPC);
  Future<List<Actionn>> getActionsByEmergency(String idEmergency);
  Future<List<Actionn>> uploadAction(String idEmergency, String prompt);
}