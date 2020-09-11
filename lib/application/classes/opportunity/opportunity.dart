import 'package:forsat/application/classes/auth/user.dart';
import 'package:forsat/application/classes/common/category.dart';
import 'package:forsat/application/classes/common/country.dart';
import 'package:forsat/application/classes/opportunity/opportunity_detail.dart';

class Opportunity {
  final int id;
  final String title;
  final Category category;
  final Country country;
  final String deadline;
  final User createdBy;
  final String organizer;
  final OpportunityDetail opportuityDetail;
  final String createdAt;
  final String updatedAt;

  Opportunity.fromJson(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'] ?? 0,
        title = jsonMap['title'] ?? "",
        category = jsonMap['category'] != null
            ? Category.fromJson(jsonMap['category'])
            : null,
        country = jsonMap['country'] != null
            ? Country.fromJson(jsonMap['country'])
            : null,
        deadline = jsonMap['deadline'] ?? "",
        createdBy =
            jsonMap['user'] != null ? User.fromJson(jsonMap['user']) : null,
        organizer = jsonMap['organizer'] ?? "",
        opportuityDetail = jsonMap['opportunityDetail'] != null
            ? OpportunityDetail.fromJson(jsonMap['opportunityDetail'])
            : null,
        createdAt = jsonMap['createdAt'] ?? "",
        updatedAt = jsonMap['updatedAt'] ?? "";

  // {
  //           "id": 1,
  //           "title": "Vel autem eveniet porro et iusto odit odit a est est doloribus cumque occaecati officia et occaecati et officiis.",
  //           "category": {
  //               "id": 2,
  //               "name": "Fellowship"
  //           },
  //           "country": {
  //               "id": 118,
  //               "name": "Kyrgyzstan",
  //               "phoneCode": "996",
  //               "countryCode": "KG"
  //           },
  //           "deadline": "Sun, Sep 4, 1988 8:36 AM",
  //           "createdBy": {
  //               "id": 112,
  //               "firstName": "Mia",
  //               "lastName": "Romaguera",
  //               "bio": "Cum repellat ratione quidem consectetur ut et nam. Voluptas eligendi consequuntur sint beatae distinctio non cumque. Voluptas non commodi corporis ipsa non. In sequi quia dolorum facilis nemo. Reiciendis velit quam quam. Non nemo itaque nihil ipsa. Autem veritatis laboriosam sit hic deserunt in et.",
  //               "email": "willis93@example.org",
  //               "profilePicture": "https://lorempixel.com/150/150/?22013",
  //               "joinedOn": "Apr 19, 2020"
  //           },
  //           "organizer": "McLaughlin and Sons",
  //           "opportunityDetail": {
  //               "benefits": "Sequi nobis excepturi est. Ullam quam occaecati sit qui sed. Placeat aut ex aperiam quia. Sunt delectus saepe error architecto possimus facere cum. Dignissimos rem occaecati esse animi et. Laboriosam impedit fugit quas dolor quia aliquam blanditiis. Illum exercitationem labore repudiandae et placeat nihil quod. Commodi eveniet et officia quaerat. Ut aut non velit velit qui sint. Voluptas consequatur nihil possimus. Neque qui nulla qui qui dolore et. Blanditiis at consequatur sit voluptatum et. Quisquam sunt impedit rerum accusamus aliquid qui sed et.",
  //               "applicationProcess": "Adipisci vel dolorum nihil et. Ea est doloribus est molestiae. Cumque reprehenderit velit sed. Consequuntur quibusdam doloremque deleniti rem impedit quas. Dicta vitae dicta facere possimus molestias. Dolores pariatur exercitationem excepturi sint vero autem mollitia aut. Harum qui vel eveniet ut rerum dolorem eum.",
  //               "furtherQueries": "Et quis quia et provident quae temporibus fugit quo. Eligendi neque nihil ut et accusantium ipsa. Accusamus minus est sequi rerum quo beatae ea. Similique error molestiae inventore recusandae. Neque veritatis ullam neque quia dicta asperiores. Optio suscipit architecto voluptas et. Repudiandae totam deleniti aut quam autem omnis quis.",
  //               "eligibilities": "Ea in occaecati dicta et. Dolorem repellendus quaerat molestiae et et minima architecto. Ducimus autem impedit sunt in deleniti. Aut ad dolor exercitationem porro quod. Non quos aspernatur et consequuntur voluptas vel. Facilis eos sit et aspernatur sunt. Ab alias repellendus quis quia dolores. Velit ut voluptatibus et et placeat dolorem.",
  //               "startDate": "Mon, Dec 21, 1998 7:53 PM",
  //               "endDate": "Wed, Nov 16, 2011 5:05 AM",
  //               "officialLink": "http://www.quigley.com/",
  //               "eligibleRegions": null
  //           },
  //           "createdAt": "2020-04-19 16:18:17",
  //           "updatedAt": "2020-04-19 16:18:17"
  //       },
}
