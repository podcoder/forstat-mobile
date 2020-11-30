import 'package:dio/dio.dart';
import 'package:forsat/application/classes/common/category.dart';
import 'package:forsat/application/classes/common/country.dart';
import 'package:forsat/application/classes/errors/common_error.dart';
import 'package:forsat/application/forsat_api.dart';
import 'package:forsat/application/storage/localstorage.dart';
import 'package:forsat/application/storage/storage_keys.dart';

abstract class CommonRepository {
  Future<List<Category>> categories();
  Future<List<Country>> countries();
}

class CommonRepositoryImpl implements CommonRepository {
  @override
  Future<List<Category>> categories() async {
    try {
      var response = await ForsatApi.dio.get(
        "/api/lookups/category",
        options: Options(headers: {
          'Authorization': "Bearer ${LocalStorage.getItem(TOKEN)}"
        }),
      );

      List data = response.data["data"];

      return data.map((e) => Category.fromJson(e)).toList();
    } on DioError catch (e) {
      throw showNetworkError(e);
    }
  }

  @override
  Future<List<Country>> countries() async {
    try {
      var response = await ForsatApi.dio.get(
        "/api/lookups/country",
        options: Options(headers: {
          'Authorization': "Bearer ${LocalStorage.getItem(TOKEN)}"
        }),
      );

      List data = response.data["data"];

      return data.map((e) => Country.fromJson(e)).toList();
    } on DioError catch (e) {
      throw showNetworkError(e);
    }
  }
}
