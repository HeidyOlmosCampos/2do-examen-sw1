import 'dart:ffi';

class Notificacion {
  int id;
  String titulo;
  String mensaje;
  dynamic fecha;  // Puede ser bool o String según los datos
  int hora;
  String tipo;
  dynamic lugar;  // Puede ser bool o String según los datos
  dynamic fechaCierre;  // Puede ser bool o String
  CreadoPor creadoPor;
  dynamic cursoId;
  String tipoDestinatario;
  String estado;

  Notificacion({
    required this.id,
    required this.titulo,
    required this.mensaje,
    required this.fecha,
    required this.hora,
    required this.tipo,
    required this.lugar,
    required this.fechaCierre,
    required this.creadoPor,
    required this.cursoId,
    required this.tipoDestinatario,
    required this.estado,
  });

 String get fechaCierreString {
    if (fechaCierre is Bool) {
      return 'No definida';
    }else if (fechaCierre is String) {
      return fechaCierre;
    }
    return '';  // si el parseo falla
  }

  String get fechaString {
    if (fecha is Bool) {
      return 'No definida';
    }else if (fecha is String) {
      return fecha;
    }
    return '';  // si el parseo falla
  }

  String get lugarString {
    if (lugar is Bool) {
      return 'No definido';
    }else if (lugar is String) {
      return lugar;
    }
    return 'No definido';  // si el parseo falla
  }

  String get cursoIdString {
    if (cursoId is Bool) {
      return 'No definido';
    }else if (cursoId is String) {
      return cursoId;
    }
    return 'No definido';  // si el parseo falla
  }
}

class CreadoPor {
  int id;
  String nombre;

  CreadoPor({required this.id, required this.nombre});

  // Método para mapear una lista a un objeto CreadoPor
  factory CreadoPor.fromList(List<dynamic> list) {
    return CreadoPor(
      id: list[0],
      nombre: list[1],
    );
  }
}
