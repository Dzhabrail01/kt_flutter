import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response> get(String url) async {
    try {
      final response = await _dio.get(
        url,
        options: Options(
          receiveTimeout: const Duration(seconds: 5),
          sendTimeout: const Duration(seconds: 5),
        ),
      );
      return response;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception('Таймаут соединения');
      } else if (e.type == DioExceptionType.connectionError) {
        throw Exception('Ошибка подключения к сети');
      } else {
        throw Exception('Ошибка: ${e.message}');
      }
    }
  }
}