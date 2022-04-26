import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/models/project_model.dart';

class ProjectImage extends StatelessWidget {
  const ProjectImage({
    Key? key,
    required this.projectModel,
  }) : super(key: key);

  final ProjectModel projectModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      child: Image.asset(
        projectModel.image,
      ),
    );
  }
}
