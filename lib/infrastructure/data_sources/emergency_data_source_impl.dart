import 'package:flutter_template/config/dio_config.dart';
import 'package:flutter_template/domain/data_sources/index.dart';
import 'package:flutter_template/domain/entities/index.dart';
import 'package:flutter_template/infrastructure/models/index.dart';
import 'package:dio/dio.dart';

class EmergencyDataSourceImpl implements EmergencyDataSource {
  EmergencyDataSourceImpl();

  @override
  Future<List<Emergency>> getEmergencies() async {
    try {
      final response = await DioConfig.dioWithAuthorization.get(
        '/emergency',
      );
      var data = response.data['data'];

      List<Emergency> emergencies = [];

      for (var emergencyJson in data) {
        emergencies.add(EmergencyModelMapper.fromJson(emergencyJson));
      }

      return emergencies;
    } catch (e) {
      throw Exception('Error al obtener las emergencias');
    }
  }

  @override
  Future<Emergency> getEmergencyById(String idEmergency) async {
    try {
      final response = await DioConfig.dioWithAuthorization.get(
        '/emergency/$idEmergency',
      );
      var data = response.data['data'];

      Emergency emergency = EmergencyModelMapper.fromJson(data);

      return emergency;
    } catch (e) {
      throw Exception('Error al obtener las emergencias por id');
    }
  }

  @override
  Future<List<String>> getImagesEmergency(String idEmergency) async {
    try {
      final dio = Dio();

      final response = await dio.get(
          'https://emergy-ws-production.up.railway.app/image/emergency-urls/$idEmergency');

      List<String> emergencies = List<String>.from(response.data);

      return emergencies;
    } catch (e) {
      throw Exception('Error al obtener las imagenes de emergencia');
    }
  }

  @override
  Future<void> uploadImage(String idEmergency, String url) async {
    try {
      final dio = Dio();

      var formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(url),
        'emergencyId': idEmergency,
      });

      dio.options.contentType = 'multipart/form-data';

      final response = await dio.post(
        'https://emergy-ws-production.up.railway.app/image/emergency-upload',
        data: formData,
      );
      var data = response.data['data'];
    } catch (e) {
      throw Exception('Error al subir la imagen');
    }
  }

  @override
  Future<List<User2>> uploadImageScanUser(
      String idEmergency, String url) async {
    try {
      final dio = Dio();

      var formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(url),
        'emergency_id': idEmergency,
      });

      dio.options.contentType = 'multipart/form-data';

      final response = await dio.post(
        'https://emergy-ws-production.up.railway.app/attend/create-by-image',
        data: formData,
      );

      List<dynamic> data = response.data;

      List<User2> users = [];

      for (var userJson in data) {
        users.add(User2ModelMapper.fromJson(userJson));
      }
      return users;
    } catch (e) {
      throw Exception('Error al subir la imagen para escaneo de personal');
    }
  }

  @override
  Future<List<User2>> getUserEmergency(String idEmergency) async {
    try {
      final dio = Dio();

      final response = await dio.get(
          'https://emergy-ws-production.up.railway.app/attend/get-by-emergencyId/$idEmergency');

      List<dynamic> data = response.data;

      List<User2> users = [];

      for (var userJson in data) {
        users.add(User2ModelMapper.fromJson(userJson));
      }

      return users;
    } catch (e) {
      throw Exception('Error al obtener los usuarios de la emergencia');
    }
  }

  @override
  Future<void> uploadCoordinatesE(
      String idEmergency, List<double> coordinatesE) async {
    try {
      final response = await DioConfig.dioWithAuthorization.patch(
          '/emergency/$idEmergency',
          data: {'coordinates_e': coordinatesE});
      var data = response.data['data'];
    } catch (e) {
      throw Exception('Error al insertar las coordenadasE');
    }
  }

  @override
  Future<void> uploadCoordinatesPC(
      String idEmergency, List<double> coordinatesPC) async {
    try {
      final response = await DioConfig.dioWithAuthorization.patch(
          '/emergency/$idEmergency',
          data: {'coordinates_pc': coordinatesPC});
      var data = response.data['data'];
    } catch (e) {
      throw Exception('Error al insertar las coordenadasPC');
    }
  }

  @override
  Future<List<Actionn>> getActionsByEmergency(String idEmergency) async {
    try {
      final response = await DioConfig.dioWithAuthorization.get(
        '/action/emergency/$idEmergency',
      );
      var data = response.data['data'];

      List<Actionn> actions = [];

      for (var actionJson in data) {
        actions.add(ActionModelMapper.fromJson(actionJson));
      }

      return actions;
    } catch (e) {
      throw Exception('Error al obtener las acciones por emergencia');
    }
  }

  @override
  Future<List<Actionn>> uploadAction(String idEmergency, String prompt) async {
    try {
      final dio = Dio();

      final response = await dio.post(
        'https://emergy-ws-production.up.railway.app/action/create-actions',
        data: {'promt': prompt, 'emergency_id': idEmergency},
      );

      List<dynamic> data = response.data;

      List<Actionn> actions = [];

      for (var actionJson in data) {
        actions.add(ActionModelMapper.fromJson(actionJson));
      }

      return actions;
    } catch (e) {
      throw Exception('Error al subir la accion');
    }
  }
}
