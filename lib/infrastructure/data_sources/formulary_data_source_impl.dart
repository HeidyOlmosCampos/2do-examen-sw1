import 'package:flutter/material.dart';
import 'package:flutter_template/config/dio_config.dart';
import 'package:flutter_template/domain/data_sources/index.dart';
import 'package:flutter_template/domain/entities/index.dart';
import 'package:flutter_template/infrastructure/models/index.dart';

class FormularyDataSourceImpl implements FormularyDataSource {
  FormularyDataSourceImpl();

  @override
  Future<List<Form201>> getForms(String idEmergency) async {
    try {
      final response = await DioConfig.dioWithAuthorization.get(
        '/form201/by-emergency/$idEmergency',
      );
      var data = response.data['data'];

      List<Form201> forms = [];

      for (var formJson in data) {
        forms.add(Form201ModelMapper.fromJson(formJson));
      }

      return forms;
    } catch (e) {
      throw Exception('Error al obtener los form201');
    }
  }

  @override
  Future<void> uploadForm(String idEmergency, Form201 form) async {
    try {
      final response = await DioConfig.dioWithAuthorization.post(
        '/form201',
        data: Form201ModelMapper.toJson(form),
      );
      var data = response.data['data'];
    } catch (e) {
      throw Exception('Error al insertar el formulario');
    }
  }
}
