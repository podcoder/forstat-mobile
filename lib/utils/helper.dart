import 'package:forsat/application/classes/common/pagination.dart';
import 'package:forsat/utils/pagination_fetch_next.dart';

class Helper {
  static PaginationFetchNext paginationFetchNext(Pagination _pagination) {
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

    return new PaginationFetchNext(currentPage, fetchNext);
  }
}
