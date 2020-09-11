import 'package:flutter/material.dart';
import 'package:forsat/application/state/forum_state.dart';
import 'package:forsat/values/images.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class QuestionsPage extends StatefulWidget {
  QuestionsPage({Key key}) : super(key: key);

  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage>
    with AutomaticKeepAliveClientMixin {
  final _forumStateRM = RM.get<ForumState>();
  ScrollController _scrollController;

  @override
  void didChangeDependencies() {
    _scrollController = ScrollController();
    _getQuestions();
    _scrollController.addListener(() {
      double currentPosition = _scrollController.position.pixels;
      double maxScrollExtent = _scrollController.position.maxScrollExtent;

      if (currentPosition >= maxScrollExtent && !_forumStateRM.state.loading) {
        _getQuestions();
      }
    });

    super.didChangeDependencies();
  }

  void _getQuestions() {
    _forumStateRM.setState((forumState) => forumState.getAllQuestions());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Questions Page'),
      ),
      body: SingleChildScrollView(
          controller: _scrollController,
          child: StateBuilder<ForumState>(
            observe: () => _forumStateRM,
            builder: (context, model) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    ...model.state.questions.map(
                      (question) => GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage:
                                        AssetImage(Images.testImage),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${question.createdBy.firstName} ${question.createdBy.lastName}",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text("${question.createdBy.email}")
                                      ],
                                    ),
                                  ),
                                  Text("2 days ago")
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${question.question}",
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 1,
                                color: Colors.black26,
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          )),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
