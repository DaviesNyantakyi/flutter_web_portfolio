import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/models/project_model.dart';
import 'package:flutter_web_portfolio/project_view/widgets/project_image.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ProjectContainer extends StatelessWidget {
  final ProjectModel projectModel;
  const ProjectContainer({
    Key? key,
    required this.projectModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenInfo) {
        if (screenInfo.isMobile || screenInfo.isTablet) {
          return _MobileView(projectModel: projectModel);
        }
        return _DesktopView(projectModel: projectModel);
      },
    );
  }
}

class _MobileView extends StatelessWidget {
  const _MobileView({
    Key? key,
    required this.projectModel,
  }) : super(key: key);

  final ProjectModel projectModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProjectImage(projectModel: projectModel),
        const SizedBox(height: 24),
        _ProjectInfo(projectModel: projectModel),
      ],
    );
  }
}

class _DesktopView extends StatelessWidget {
  const _DesktopView({
    Key? key,
    required this.projectModel,
  }) : super(key: key);

  final ProjectModel projectModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ProjectImage(projectModel: projectModel),
        ),
        const Flexible(child: SizedBox(width: 32)),
        Expanded(
          child: _ProjectInfo(projectModel: projectModel),
        ),
      ],
    );
  }
}

class _ProjectInfo extends StatelessWidget {
  const _ProjectInfo({
    Key? key,
    required this.projectModel,
  }) : super(key: key);

  final ProjectModel projectModel;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenInfo) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            projectModel.currentWork
                ? AutoSizeText(
                    'Working on',
                    style: Theme.of(context).textTheme.bodyText1,
                  )
                : Container(),
            projectModel.currentWork ? const SizedBox(height: 8) : Container(),
            AutoSizeText(
              projectModel.title,
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 12),
            AutoSizeText(
              projectModel.description,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox(height: 24),
            Wrap(
              children: projectModel.technologies
                  .map(
                    (e) => Container(
                      padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
                      child: Chip(
                        backgroundColor: Colors.grey.shade200,
                        label: Text(e),
                      ),
                    ),
                  )
                  .toList(),
            )
          ],
        );
      },
    );
  }
}
