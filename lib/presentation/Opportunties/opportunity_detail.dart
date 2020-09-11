import 'package:flutter/material.dart';
import 'package:forsat/application/classes/opportunity/opportunity.dart';
import 'package:forsat/values/images.dart';
import 'package:forsat/widgets/opportunity_links_widget.dart';

class OpportunityDetailPage extends StatefulWidget {
  OpportunityDetailPage({Key key}) : super(key: key);

  @override
  _OpportunityDetailPageState createState() => _OpportunityDetailPageState();
}

class _OpportunityDetailPageState extends State<OpportunityDetailPage> {
  @override
  Widget build(BuildContext context) {
    final Opportunity opportunity =
        ModalRoute.of(context).settings.arguments as Opportunity;
    final heightSpacer = SizedBox(
      height: 15,
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(Images.testImage),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Text(
                "${opportunity.title}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            OpportunityLinsWidget(
              categoryName: opportunity.category.name,
              views: opportunity.id.toString(),
              deadline: opportunity.deadline,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleTextWidget(
                    title: "Benifits",
                  ),
                  heightSpacer,
                  Text(opportunity.opportuityDetail.benefits),
                  heightSpacer,
                  TitleTextWidget(
                    title: "Application Process",
                  ),
                  heightSpacer,
                  Text(opportunity.opportuityDetail.applicationProcess),
                  heightSpacer,
                  TitleTextWidget(
                    title: "Further Queries",
                  ),
                  heightSpacer,
                  Text(opportunity.opportuityDetail.furtherQueries),
                  heightSpacer,
                  TitleTextWidget(
                    title: "Eligibilities",
                  ),
                  heightSpacer,
                  Text(opportunity.opportuityDetail.eligibilities),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$title :",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}
