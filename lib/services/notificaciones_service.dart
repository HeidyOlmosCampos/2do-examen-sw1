import 'package:flutter_template/config/dio_config.dart';
import 'package:flutter_template/domain/entities/index.dart';
import 'package:flutter_template/domain/entities/notificacion.dart';
import 'package:flutter_template/infrastructure/models/notificacion_model_mapper.dart';



// Future<ApiResponse> getCursos() async {
//   ApiResponse apiResponse = ApiResponse();
//   try {
//     final response = await http.get(Uri.parse(cursosURL));

//     switch (response.statusCode) {
//       case 200:
//         apiResponse.data =
//             jsonDecode(response.body).map((p) => Cursos.fromJson(p)).toList();
//         apiResponse.data as List<dynamic>;
//         break;
//       case 401:
//         apiResponse.error = unautorized;
//         break;
//       default:
//         apiResponse.error = somethingWentWrong;
//         break;
//     }
//   } catch (e) {
//     apiResponse.error = serverError;
//   }
//   return apiResponse;
// }

Future<List<Notificacion>> getNotificaciones() async {
  try {

    final response = await DioConfig.dioWithAuthorization.get(
      '/enhanced-notifications/my-notifications',
    );
    var data = response.data['notifications'];

    List<Notificacion> notificaciones = [];

    for (var notificacionJson in data) {
      notificaciones.add(NotificacionModelMapper.fromJson(notificacionJson));
    }

    // for (Notificacion notif in notificaciones){
    //   if(notif.estado.toUpperCase() == 'ENVIADO'){
    //    //marcar como recibido 
    //   }
    // }

    return notificaciones;
  } catch (e) {
    throw Exception('Error al obtener las emergencias');
  }
}


Future<String> marcarLeido(String notificacionId) async {
  try {
    final response = await DioConfig.dioWithAuthorization.post(
      '/enhanced-notifications/notifications/$notificacionId/read',
    );

    return 'LEÍDO';
  } catch (e) {
    throw Exception('Error al marcar la notificacion');
  }
}


// Future<ApiResponse> getUnCurso(int id_curso) async {
//   ApiResponse apiResponse = ApiResponse();
//   try {
//     String token = await getToken();
//     final response = await http.get(
//       Uri.parse(getUnCursoURL + '/$id_curso'), 
//       headers: {
//         'Accept': 'application/json',
//         'Authorization': 'Bearer $token'
//       }
//     );

//     switch (response.statusCode) {
//       case 200: apiResponse.data = Cursos.fromJson(jsonDecode(response.body));
//         break;
//       case 404:
//         apiResponse.error = unautorized;
//         break;
//       default:
//         apiResponse.error = somethingWentWrong;
//         break;
//     }
//   } catch (e) {
//     apiResponse.error = serverError;
//   }
//   return apiResponse;
// }
