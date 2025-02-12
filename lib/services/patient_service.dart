
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:frontend/models/patient/patient_model.dart';

import 'api_service.dart';

class PatientService {

  Future<PatientModel> findById(String uuid) async {
    /*Response response = await ApiService.instance
        .getDio()
        .get('/erp/patient/$uuid');
    if(response.statusCode == 200) {
      return PatientModel.fromJson(response.data);
    } else{
      throw Exception('Não conseguiu');
    }*/
    PatientModel p = PatientModel.fromJson({
      "uuid": "213123182381",
      "gender": "Masculino",
      "birthDate": "1999-07-08T11:00:00.000Z",
      "phoneNumber": "(48) 99137-6906",
      "healthNumber": "1321231231",
      "nationalRegistry": "31321312",
      "nationalRegistryExpirationDate": "2030-04-05T12:00:00.00000Z",
      "occupation": "Programador",
      "address": {
        "id": 1,
        "street":  "Rua Alvorada",
        "number": "321",
        "neighborhood":  "Kobrasol",
        "city": "São José",
        "state":  "Santa Catarina",
        "country": "Brasil"
      },
      "fullName": "Fernando Alvarez",
      "email": "patient.tester@gmail.com",
      "documentNumber": "012.312.512-23",
      "createdAt": "2022-04-05T12:00:00.00000Z",
      "updatedAt": "2022-04-05T12:00:00.00000Z",
      "roleName": "PATIENT"
    });
    return p;
  }

}