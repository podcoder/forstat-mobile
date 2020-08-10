import 'package:dio/dio.dart';
import 'package:forsat/application/classes/common/pagination.dart';
import 'package:forsat/application/classes/errors/common_error.dart';
import 'package:forsat/application/classes/opportunity/opportunities.dart';
import 'package:forsat/application/classes/opportunity/opportunity.dart';
import 'package:forsat/application/forsat_api.dart';
import 'package:forsat/application/storage/localstorage.dart';
import 'package:forsat/application/storage/storage_keys.dart';

abstract class OpportunityRepository {
  // We need to fetch the opportuntities
  Future<Opportunities> getAllOpportunities(int page);
}

class OpportunityRepositoryImpl implements OpportunityRepository {
  @override
  Future<Opportunities> getAllOpportunities(int page) async {
    try {
      final response = await ForsatApi.dio.get("/api/opportunity?page=$page",
          options: Options(headers: {
            'Authorization': "Bearer ${LocalStorage.getItem(TOKEN)}"
          }));
      List _temp = response.data['data'];
      var _meta = response.data['meta'];

      Pagination pagination = Pagination.fromJson(_meta);

      List<Opportunity> _opportunties = _temp
          .map((opportunity) => Opportunity.fromJson(opportunity))
          .toList();
      return new Opportunities(
          pagination: pagination, opportunities: _opportunties);
    } on DioError catch (e) {
      throw showNetworkError(e);
    }
  }
}
