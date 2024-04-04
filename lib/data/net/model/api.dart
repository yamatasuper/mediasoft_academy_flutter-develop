import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class Api {
  static Future<http.Response> getSchedulesData() async {
    try {
      var response = await http.get(
        Uri.parse(
          '',
        ),
      );
      if (response.statusCode == 200) {
        Logger().d(
          "Получены курсы\n"
          'Responce Body: ${response.body}\n'
          'Тип запроса: Get\n'
          'https://$user1:$password1@',
        );
        return response;
      } else {
        throw APILoadException('Ошибка загрузки данных с API');
      }
    } on SocketException {
      // Utilities.noInternetStreamController.add(true);
      Logger().e("Нет интернета");
      throw const SocketException('Нет интернета');
    } on APILoadException catch (e) {
      // Utilities.noAPIStreamController.add(true);
      Logger().e("Не удалось проверить доступность адреса\n"
          'Подробности: ${e.message}');
      throw APILoadException('Ошибка загрузки данных с API');
    }
  }
}

class APILoadException implements Exception {
  String message;

  APILoadException(this.message);
}
