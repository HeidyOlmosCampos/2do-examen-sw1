import 'package:flutter/material.dart';
import 'package:flutter_template/domain/entities/index.dart';
import 'package:flutter_template/domain/use_cases/index.dart';

class EmergencyImageProvider extends ChangeNotifier {
  final EmergencyUseCase _emergencyUseCase;

  List<String> _emergencyImageList = [];
  List<User2> _emergencyUserList = [];
  bool _isLoading = false;

  EmergencyImageProvider(this._emergencyUseCase);

  bool get isLoading => _isLoading;
  List<String> get emergencyImageList => _emergencyImageList;
  List<User2> get emergencyUserList => _emergencyUserList;

  Future<void> getImagesEmergency(String idEmergency) async {
    _isLoading = true;
    try {
      _emergencyImageList =
          await _emergencyUseCase.getImagesEmergency(idEmergency);
    } catch (error) {
      throw Exception(
          'Ocurrio un error en el provider al obtener las imagenes de la emergencia');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<Emergency> getEmergencyById(String idEmergency) async {
    _isLoading = true;
    try {
      return await _emergencyUseCase.getEmergencyById(idEmergency);
    } catch (error) {
      throw Exception(
          'Ocurrio un error en el provider al obtener la emergencia por id');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> uploadImage(String idEmergency, String url) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _emergencyUseCase.uploadImage(idEmergency, url);
    } catch (e) {
      throw Exception('Ocurrió un error en el provider al subir la imagen');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> uploadImageScanUser(String idEmergency, String url) async {
    _isLoading = true;
    notifyListeners();
    try {
      await _emergencyUseCase.uploadImageScanUser(idEmergency, url);
    } catch (e) {
      throw Exception(
          'Ocurrió un error en el provider al subir la imagen para el escaneo');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> uploadCoordinatesE(
      String idEmergency, List<double> coordinatesE) async {
    _isLoading = true;
    notifyListeners();
    try {
      await _emergencyUseCase.uploadCoordinatesE(idEmergency, coordinatesE);
    } catch (e) {
      throw Exception(
          'Ocurrió un error en el provider al insertar coordenadase');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> uploadCoordinatesPC(
      String idEmergency, List<double> coordinatesPC) async {
    _isLoading = true;
    notifyListeners();
    try {
      await _emergencyUseCase.uploadCoordinatesPC(idEmergency, coordinatesPC);
    } catch (e) {
      throw Exception(
          'Ocurrió un error en el provider al insertar coordenadaspc');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getUserEmergency(String idEmergency) async {
    _isLoading = true;
    try {
      _emergencyUserList =
          await _emergencyUseCase.getUserEmergency(idEmergency);
    } catch (error) {
      throw Exception(
          'Ocurrio un error en el provider al obtener los usuarios de la emergencia');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
