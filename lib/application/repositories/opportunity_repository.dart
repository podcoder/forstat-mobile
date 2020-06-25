import 'package:dio/dio.dart';
import 'package:forsat/application/classes/errors/common_error.dart';
import 'package:forsat/application/classes/opportunity/opportunity.dart';
import 'package:forsat/application/forsat_api.dart';
import 'package:forsat/application/storage/localstorage.dart';
import 'package:forsat/application/storage/storage_keys.dart';

abstract class OpportunityRepository {
  // We need to fetch the opportuntities
  Future<List<Opportunity>> getAllOpportunities();
}

class OpportunityRepositoryImpl implements OpportunityRepository {
  @override
  Future<List<Opportunity>> getAllOpportunities() async {
    try {
      final response = await ForsatApi.dio.get("/api/opportunity",
          options: Options(headers: {
            'Authorization': "Bearer ${LocalStorage.getItem(TOKEN)}"
          }));
      List _temp = response.data['data'];
      List<Opportunity> _opportunties = _temp
          .map((opportunity) => Opportunity.fromJson(opportunity))
          .toList();
      return _opportunties;
    } on DioError catch (e) {
      throw showNetworkError(e);
    }
  }
}
