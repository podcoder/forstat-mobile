import 'package:flutter/material.dart';
import 'package:forsat/application/state/opportunity_state.dart';
import 'package:forsat/values/images.dart';
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
    TextStyle _iconTextStyle = TextStyle(
        fontFamily: 'Dosis', fontSize: 12, fontWeight: FontWeight.w600);
    double _iconSize = 20;
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
                  (opportunity) => Column(
                    children: <Widget>[
                      Image.asset(Images.testImage),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                        child: Text("${opportunity.title}",
                            style: TextStyle(
                                fontFamily: 'Dosis',
                                fontSize: 18,
                                fontWeight: FontWeight.w600)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {},
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.school,
                                  size: _iconSize,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "${opportunity.category.name}",
                                  style: _iconTextStyle,
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.remove_red_eye,
                                size: _iconSize,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "${opportunity.id}",
                                style: _iconTextStyle,
                              )
                            ],
                          ),
                          FlatButton(
                            onPressed: () {},
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.share,
                                  size: _iconSize,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Share", style: _iconTextStyle)
                              ],
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.event,
                                size: _iconSize,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "${opportunity.deadline}",
                                style: _iconTextStyle,
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
