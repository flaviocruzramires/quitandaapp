import 'package:dio/dio.dart';

abstract class HttpMethods {
  static const String get = 'get';
  static const String post = 'post';
  static const String put = 'put';
  static const String patch = 'patch';
  static const String delete = 'delete';
}

class HttpManager {
  Future<Map> restRequest({
    required String url,
    required String method,
    Map<String, dynamic>? headers,
    Map<dynamic, dynamic>? body,
  }) async {
    // Headers
    final defaultHeaders = headers?.cast<String, String>() ?? {};

    final dio = Dio();

    try {
      Response response = await dio.request(
        url,
        options: Options(
          method: method,
          headers: defaultHeaders,
        ),
        data: body,
      );

      return response.data; // resultado do
    } on DioError catch (error) {
      if (error.response!.statusCode! >= 400 &&
          error.response!.statusCode! < 404) {
        return {'error': 'Usuário ou senha inválidos'};
      }
      print('error Dio ${error.message} ');
      return {};
    } catch (error) {
      return {};
    }
  }
}
