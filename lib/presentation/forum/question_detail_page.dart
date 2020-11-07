import 'package:flutter/material.dart';
import 'package:forsat/application/classes/forum/question.dart';
import 'package:forsat/utils/actions_list.dart';
import 'package:forsat/values/branding_color.dart';
import 'package:forsat/widgets/created_by_info_widget.dart';

class QuestionDetailPage extends StatefulWidget {
  QuestionDetailPage({Key key}) : super(key: key);

  @override
  _QuestionDetailPageState createState() => _QuestionDetailPageState();
}

class _QuestionDetailPageState extends State<QuestionDetailPage> {
  @override
  Widget build(BuildContext context) {
    final Question question = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            onSelected: (val) {},
            itemBuilder: (_) => ActionList.getActions()
                .map(
                  (e) => PopupMenuItem(
                    child: Text(e.name),
                    value: e,
                  ),
                )
                .toList(),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        CreatedByInfoWidget(
                          fullName:
                              "${question.createdBy.firstName} ${question.createdBy.lastName}",
                          email: "${question.createdBy.email}",
                          createdAt: "2 days ago",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(question.question),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(children: [
                              Icon(Icons.comment),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "${question.comments.length} Comments",
                              ),
                            ]),
                            Row(children: [
                              Icon(Icons.remove_red_eye),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "340 Views",
                              ),
                            ])
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (question.comments.length > 0)
                    ...question.comments.map((comment) {
                      int index = question.comments.indexOf(comment);
                      return Container(
                        padding: const EdgeInsets.all(8.0),
                        color: index == 0 ? Colors.grey.shade300 : null,
                        child: Column(
                          children: [
                            CreatedByInfoWidget(
                              fullName:
                                  "${comment.createdBy.firstName} ${comment.createdBy.lastName}",
                              email: "${comment.createdBy.email}",
                              createdAt: "2 days ago",
                              avatarRadius: 20,
                              fontSize: 13,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(comment.comment)
                          ],
                        ),
                      );
                    }),
                ],
              ),
            ),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 1,
                spreadRadius: 1,
              ),
            ], color: Colors.white),
            height: 56,
            child: Row(
              children: [
                Flexible(
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        isDense: true,
                        hintText: "Add you comment here…"),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.send,
                    color: brandingColor,
                    size: 35,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
