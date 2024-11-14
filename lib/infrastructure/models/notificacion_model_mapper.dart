import 'package:flutter_template/domain/entities/notificacion.dart';

class NotificacionModelMapper {

  // Método estático para mapear un JSON a Notificacion
  static Notificacion fromJson(Map<String, dynamic> json) {
    return Notificacion(
      id: json['id'],
      titulo: json['titulo'],
      mensaje: json['mensaje'],
      fecha: json['fecha'],
      hora: json['hora'],
      tipo: json['tipo'],
      lugar: json['lugar'],
      fechaCierre: json['fecha_cierre'],
      creadoPor: CreadoPor.fromList(json['creado_por']),
      cursoId: json['curso_id'],
      tipoDestinatario: json['tipo_destinatario'],
      estado: json['estado'],
    );
  }

  static List<Notificacion> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => fromJson(json)).toList();
  }
}



