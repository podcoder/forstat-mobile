import 'package:dio/dio.dart';

class CommonError extends Error {
  final String message;
  CommonError({this.message});
}

CommonError showNetworkError(DioError networkError) {
  String message = "";

  if (networkError.response != null) {
    if (networkError.response.statusCode == 401) {
      message = networkError.response.data;
    } else if (networkError.response.statusCode == 422) {
      Map<String, dynamic> validationErrors =
          networkError.response.data["errors"];
      for (var err in validationErrors.values) {
        message += "\n$err";
      }
    } else {
      message = "An error is occured";
    }
  } else {
    message = "Can't reach to the server";
  }

  throw CommonError(message: message);
}
