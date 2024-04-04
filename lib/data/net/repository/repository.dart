import 'package:http/http.dart';
import 'package:mediasoft_academy_flutter/data/net/model/api.dart';

class Repository {
  static Future<Response> getSchedulesMain() async {
    return await Api.getSchedulesData();
  }
}
