import 'package:flutter/material.dart';
import 'package:forsat/values/images.dart';

class CreatedByInfoWidget extends StatelessWidget {
  const CreatedByInfoWidget({
    Key key,
    @required this.fullName,
    @required this.email,
    @required this.createdAt,
    this.avatarRadius,
    this.fontSize,
  }) : super(key: key);

  final String fullName;
  final String email;
  final String createdAt;
  final double avatarRadius;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: avatarRadius ?? 30,
          backgroundImage: AssetImage(Images.testImage),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fullName,
                style: TextStyle(
                    fontSize: fontSize ?? 16, fontWeight: FontWeight.bold),
              ),
              Text(email)
            ],
          ),
        ),
        Text(createdAt)
      ],
    );
  }
}
