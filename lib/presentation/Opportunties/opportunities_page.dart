import 'package:flutter/material.dart';
// import 'package:forsat/application/state/opportunity_state.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class OpportunitiesPage extends StatefulWidget {
  OpportunitiesPage({Key key}) : super(key: key);

  @override
  _OpportunitiesPageState createState() => _OpportunitiesPageState();
}

class _OpportunitiesPageState extends State<OpportunitiesPage>
    with AutomaticKeepAliveClientMixin {
  // final _opportunitiesStateRM = Injector.getAsReactive<OpportunityState>();

  @override
  void initState() {
    // _opportunitiesStateRM
    //     .setState((opportunityState) => opportunityState.getAllOpportunities());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Opportunities Page'),
      ),
      body: SingleChildScrollView(
        child: StateBuilder(
          models: [],
          builder: (_, model) {
            return Column(
              children: <Widget>[],
            );
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
