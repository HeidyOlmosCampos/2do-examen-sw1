import 'package:flutter_template/domain/entities/index.dart';
import 'package:flutter_template/domain/repositories/index.dart';
import 'package:flutter_template/domain/use_cases/index.dart';

class EmergencyUseCaseImpl implements EmergencyUseCase {
  final EmergencyRepository _emergencyRepository;

  EmergencyUseCaseImpl(this._emergencyRepository);

  @override
  Future<List<Emergency>> getEmergencies() async {
    return await _emergencyRepository.getEmergencies();
  }

  @override
  Future<Emergency> getEmergencyById(String idEmergency) async {
    return await _emergencyRepository.getEmergencyById(idEmergency);
  }
  
  @override
  Future<List<String>> getImagesEmergency(String idEmergency) async {
    return await _emergencyRepository.getImagesEmergency(idEmergency);
  }

  @override
  Future<void> uploadImage(String idEmergency, String url) async {
    return await _emergencyRepository.uploadImage(idEmergency, url);
  }

  @override
  Future<List<User2>> getUserEmergency(String idEmergency) async {
    return await _emergencyRepository.getUserEmergency(idEmergency);
  }

  @override
  Future<List<User2>> uploadImageScanUser(String idEmergency, String url) async {
    return await _emergencyRepository.uploadImageScanUser(idEmergency, url);
  }

  @override
  Future<void> uploadCoordinatesE(String idEmergency, List<double> coordinatesE) async {
    return await _emergencyRepository.uploadCoordinatesE(idEmergency, coordinatesE);
  }

  @override
  Future<void> uploadCoordinatesPC(String idEmergency, List<double> coordinatesPC) async {
    return await _emergencyRepository.uploadCoordinatesPC(idEmergency, coordinatesPC);
  }
  
  @override
  Future<List<Actionn>> getActionsByEmergency(String idEmergency) async {
    return await _emergencyRepository.getActionsByEmergency(idEmergency);
  }

  @override
  Future<List<Actionn>> uploadAction(String idEmergency, String prompt) async {
    return await _emergencyRepository.uploadAction(idEmergency, prompt);
  }

}