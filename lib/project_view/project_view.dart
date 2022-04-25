import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/utilities/constant.dart';

class ProjectView extends StatelessWidget {
  const ProjectView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
      height: kContentHeight,
      width: double.infinity,
      child: LayoutBuilder(
        builder: (context, screenInfo) {
          return Column(
            children: [
              Container(
                color: Colors.blueAccent,
                height: 500,
                width: 400,
              ),
            ],
          );
        },
      ),
    );
  }
}
