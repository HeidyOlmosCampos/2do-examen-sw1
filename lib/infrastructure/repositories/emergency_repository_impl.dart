import 'package:flutter_template/domain/data_sources/index.dart';
import 'package:flutter_template/domain/entities/index.dart';
import 'package:flutter_template/domain/repositories/index.dart';

class EmergencyRepositoryImpl implements EmergencyRepository {
  final EmergencyDataSource _emergencyDataSource;

  EmergencyRepositoryImpl(this._emergencyDataSource);

  @override
  Future<List<Emergency>> getEmergencies() async {
    try {
      final emergencies = await _emergencyDataSource.getEmergencies();
      return emergencies;
    } catch (e) {
      throw Exception('Error al obtener las emergencias');
    }
  }

  @override
  Future<Emergency> getEmergencyById(String idEmergency) async {
    try {
      final emergency =
          await _emergencyDataSource.getEmergencyById(idEmergency);
      return emergency;
    } catch (e) {
      throw Exception('Error al obtener las emergencias por id');
    }
  }

  @override
  Future<List<String>> getImagesEmergency(String idEmergency) async {
    try {
      final emergencies =
          await _emergencyDataSource.getImagesEmergency(idEmergency);
      return emergencies;
    } catch (e) {
      throw Exception('Error al obtener las imagenes de la emergencia');
    }
  }

  @override
  Future<void> uploadImage(String idEmergency, String url) async {
    try {
      await _emergencyDataSource.uploadImage(idEmergency, url);
    } catch (e) {
      throw Exception('Error al subir la imagen de la emergencia');
    }
  }

  @override
  Future<List<User2>> uploadImageScanUser(
      String idEmergency, String url) async {
    try {
      final users =
          await _emergencyDataSource.uploadImageScanUser(idEmergency, url);
      return users;
    } catch (e) {
      throw Exception('Error al subir la imagen de la emergencia');
    }
  }

  @override
  Future<List<User2>> getUserEmergency(String idEmergency) async {
    try {
      final users = await _emergencyDataSource.getUserEmergency(idEmergency);
      return users;
    } catch (e) {
      throw Exception('Error al obtener los usuarios de la emergencia');
    }
  }

  @override
  Future<void> uploadCoordinatesE(
      String idEmergency, List<double> coordinatesE) async {
    try {
      await _emergencyDataSource.uploadCoordinatesE(idEmergency, coordinatesE);
    } catch (e) {
      throw Exception('Error al insertar las coordenadasE');
    }
  }

  @override
  Future<void> uploadCoordinatesPC(
      String idEmergency, List<double> coordinatesPC) async {
    try {
      await _emergencyDataSource.uploadCoordinatesPC(
          idEmergency, coordinatesPC);
    } catch (e) {
      throw Exception('Error al insertar las coordenadasPC');
    }
  }

  @override
  Future<List<Actionn>> getActionsByEmergency(String idEmergency) async {
    try {
      final actions =
          await _emergencyDataSource.getActionsByEmergency(idEmergency);
      return actions;
    } catch (e) {
      throw Exception('Error al obtener las acciones de la emergencia');
    }
  }

  @override
  Future<List<Actionn>> uploadAction(String idEmergency, String prompt) async {
    try {
      final actions = await _emergencyDataSource.uploadAction(idEmergency, prompt);
      return actions;
    } catch (e) {
      throw Exception('Error al subir la accion');
    }
  }
}
