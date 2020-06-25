class User {
  //           "createdBy": {
  //               "id": 112,
  //               "firstName": "Mia",
  //               "lastName": "Romaguera",
  //               "bio": "Cum repellat ratione quidem consectetur ut et nam. Voluptas eligendi consequuntur sint beatae distinctio non cumque. Voluptas non commodi corporis ipsa non. In sequi quia dolorum facilis nemo. Reiciendis velit quam quam. Non nemo itaque nihil ipsa. Autem veritatis laboriosam sit hic deserunt in et.",
  //               "email": "willis93@example.org",
  //               "profilePicture": "https://lorempixel.com/150/150/?22013",
  //               "joinedOn": "Apr 19, 2020"
  //           },

  final int id;
  final String firstName;
  final String lastName;
  final String bio;
  final String email;
  final String profilePicture;
  final String joinedOn;

  User.fromJson(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'] ?? 0,
        firstName = jsonMap['firstName'] ?? "",
        lastName = jsonMap['lastName'] ?? "",
        bio = jsonMap['bio'] ?? "",
        email = jsonMap['email'] ?? "",
        profilePicture = jsonMap['profilePicture'] ?? "",
        joinedOn = jsonMap['joinedOn'] ?? "";
}
