import 'package:flutter/material.dart';
import 'package:forsat/application/state/opportunity_state.dart';
import 'package:forsat/router/route_constants.dart';
import 'package:forsat/values/images.dart';
import 'package:forsat/widgets/opportunity_links_widget.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class OpportunitiesPage extends StatefulWidget {
  OpportunitiesPage({Key key}) : super(key: key);

  @override
  _OpportunitiesPageState createState() => _OpportunitiesPageState();
}

class _OpportunitiesPageState extends State<OpportunitiesPage>
    with AutomaticKeepAliveClientMixin {
  final _opportunitiesStateRM = RM.get<OpportunityState>();
  ScrollController _scrollController;

  @override
  void didChangeDependencies() {
    _scrollController = ScrollController();
    _getNewOpportunties();
    _scrollController.addListener(() {
      double currentPosition = _scrollController.position.pixels;
      double maxScrollExtent = _scrollController.position.maxScrollExtent;

      if (currentPosition >= maxScrollExtent &&
          !_opportunitiesStateRM.state.loading) {
        _getNewOpportunties();
      }
    });

    super.didChangeDependencies();
  }

  void _getNewOpportunties() {
    _opportunitiesStateRM
        .setState((opportunityState) => opportunityState.getAllOpportunities());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Opportunities Page'),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: StateBuilder<OpportunityState>(
          observe: () => _opportunitiesStateRM,
          builder: (context, model) {
            return Column(
              children: <Widget>[
                ...model.state.opportunities.map(
                  (opportunity) => GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, opportunityDetailRoute,
                          arguments: opportunity);
                    },
                    child: Column(
                      children: <Widget>[
                        Image.asset(Images.testImage),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                          child: Text("${opportunity.title}",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600)),
                        ),
                        OpportunityLinsWidget(
                          categoryName: opportunity.category.name,
                          views: opportunity.id.toString(),
                          deadline: opportunity.deadline,
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, addNewOpportunity);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
