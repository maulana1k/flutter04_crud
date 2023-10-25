import 'dart:convert';

import 'package:crud_toko/model/registrasi.dart';
import 'package:crud_toko/helpers/api.dart';
import 'package:crud_toko/helpers/api_url.dart';

class RegistrasiBloc {
  static Future<Registrasi> registrasi({String? nama, String? email, String? password}) async {
    String apiUrl = ApiUrl.registrasi;

    var body = {"nama": nama, "email": email, "password": password};

    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return Registrasi.fromJson(jsonObj);
  }
}
