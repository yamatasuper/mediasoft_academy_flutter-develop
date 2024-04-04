import 'dart:convert';

import 'package:mediasoft_academy_flutter/data/net/model/schedules_main_response_model.dart';
import 'package:mediasoft_academy_flutter/data/net/repository/repository.dart';


class SchedulesMainScreenUseCase {
  static Future<SchedulesMainResponseModel?> executeSchedulesMain() async {
    try {
      final response = await Repository.getSchedulesMain();
      final data = jsonDecode(response.body);
      return SchedulesMainResponseModel.fromJson(data);
    } catch (ex) {
      return null;
    }
  }
}
