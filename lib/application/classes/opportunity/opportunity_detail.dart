class OpportunityDetail {
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

  final String benefits;
  final String applicationProcess;
  final String furtherQueries;
  final String eligibilities;
  final String startDate;
  final String endDate;
  final String officialLink;
  final String eligibleRegions;

  OpportunityDetail.fromJson(Map<String, dynamic> jsonMap)
      : benefits = jsonMap['benefits'] ?? "",
        applicationProcess = jsonMap['applicationProcess'] ?? "",
        furtherQueries = jsonMap['furtherQueries'] ?? "",
        eligibilities = jsonMap['eligibilities'] ?? "",
        startDate = jsonMap['startDate'] ?? "",
        endDate = jsonMap['endDate'] ?? "",
        officialLink = jsonMap['officialLink'] ?? "",
        eligibleRegions = jsonMap['eligibleRegions'] ?? "";
}
