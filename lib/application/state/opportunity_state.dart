import 'package:forsat/application/classes/common/pagination.dart';
import 'package:forsat/application/classes/opportunity/opportunities.dart';
import 'package:forsat/application/classes/opportunity/opportunity.dart';
import 'package:forsat/application/repositories/opportunity_repository.dart';

class OpportunityState {
  final OpportunityRepository _opportunityRepository;

  OpportunityState(this._opportunityRepository);

  List<Opportunity> _opportunities = [];
  List<Opportunity> get opportunities => _opportunities;

  Pagination _pagination;
  bool _loading = false;
  bool get loading => _loading;

  Future getAllOpportunities() async {
    int currentPage = 1;
    bool fetchNext = false;

    if (_pagination == null) {
      fetchNext = true;
    } else if (_pagination != null &&
        _pagination.currentPage < _pagination.lastPage) {
      currentPage = _pagination.currentPage + 1;
      fetchNext = true;
    } else {
      fetchNext = false;
    }

    if (fetchNext) {
      _loading = true;
      Opportunities _newOpportunties =
          await _opportunityRepository.getAllOpportunities(currentPage);
      _opportunities.addAll(_newOpportunties.opportunities);
      _pagination = _newOpportunties.pagination;
      _loading = false;
    }
  }
}
