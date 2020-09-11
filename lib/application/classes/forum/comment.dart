import 'package:forsat/application/classes/auth/user.dart';

class Comment {
  final String comment;
  final User createdBy;

  Comment.fromJson(Map<String, dynamic> jsonMap)
      : comment = jsonMap['comment'] ?? "",
        createdBy = User.fromJson(jsonMap['createdBy']);
}
