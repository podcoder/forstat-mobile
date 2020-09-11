import 'package:flutter/foundation.dart';
import 'package:forsat/application/classes/common/pagination.dart';
import 'package:forsat/application/classes/forum/question.dart';

class Questions {
  final Pagination pagination;
  final List<Question> questions;

  Questions({
    @required this.pagination,
    @required this.questions,
  });
}
