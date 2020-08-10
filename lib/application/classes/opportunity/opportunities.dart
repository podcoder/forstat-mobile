import 'package:forsat/application/classes/common/pagination.dart';
import 'package:forsat/application/classes/opportunity/opportunity.dart';

import 'package:flutter/foundation.dart';

class Opportunities {
  final Pagination pagination;
  final List<Opportunity> opportunities;

  Opportunities({
    @required this.pagination,
    @required this.opportunities,
  });
}
