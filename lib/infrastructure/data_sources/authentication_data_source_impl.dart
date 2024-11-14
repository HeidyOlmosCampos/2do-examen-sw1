import '../../config/dio_config.dart';
import '../../domain/data_sources/authentication_data_source.dart';
import '../../domain/entities/user.dart';

import '../models/user_model_mapper.dart';

class AuthenticationDataSourceImpl implements AuthenticationDataSource {
  AuthenticationDataSourceImpl();

  @override
  Future<User> authenticate(String username, String password) async {
    try {
      final response = await DioConfig.dioWithoutAuthorization.post(
        '/auth/login',        
        data: {
          'username': username,
          'password': password,
        },
      );

      var data = response.data;      
      User user = UserModelMapper.fromJson(data);

      return user;
    } catch (e) {
      throw Exception('Error de autenticación');
    }
  }

  @override
  Future<User> getUser(String id) {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<User> updateUser(User user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
