import 'package:dio/dio.dart';
import 'package:forsat/base_url.dart';

class ForsatApi {
  static BaseOptions _baseOptions = new BaseOptions(baseUrl: BASE_URL);

  // For unauthenticated apis
  static Dio dio = new Dio(_baseOptions);

  // Autheticated routes
  static Dio dioAuth() {
    return Dio();
  }
}
