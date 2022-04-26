import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/models/project_model.dart';
import 'package:flutter_web_portfolio/project_view/widgets/project_container.dart';
import 'package:flutter_web_portfolio/utilities/constant.dart';
import 'package:responsive_builder/responsive_builder.dart';

List<ProjectModel> projects = [
  ProjectModel(
    image: 'assets/images/cop_project.png',
    title: 'The Church Of Pentecost Belgium',
    description:
        'Most communication of th Church is through WhatsApp, making it difficult to promote or get information. The aim of this project was to make the Church\'s online presence more accessible. The website has been redesigned to make it easy to find the latest information about the Church. With the Cop App, you can follow the latest church activities.',
    technologies: [
      'Website & Mobile Design',
      'Website',
      'Mobile App',
      'Flutter'
    ],
    currentWork: true,
  ),
];

class ProjectView extends StatelessWidget {
  const ProjectView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: kAppBarHeight),
      child: ResponsiveBuilder(
        builder: (context, screenInfo) {
          if (screenInfo.isMobile || screenInfo.isTablet) {
            return const _MobileView();
          }
          return const _DesktopView();
        },
      ),
    );
  }
}

class _DesktopView extends StatelessWidget {
  const _DesktopView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kDesktopPadding),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'What I\'ve been up to',
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(height: 56),
          ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ProjectContainer(
                projectModel: projects[index],
              );
            },
            separatorBuilder: (context, index) => const Padding(
              padding: EdgeInsets.all(32),
              child: Divider(),
            ),
            itemCount: projects.length,
          ),
        ],
      ),
    );
  }
}

class _MobileView extends StatelessWidget {
  const _MobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenInfo) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: kMobilePadding),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                'What I\'ve been up to',
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(height: 56),
              ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ProjectContainer(
                    projectModel: projects[index],
                  );
                },
                separatorBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.all(32),
                  child: Divider(),
                ),
                itemCount: projects.length,
              ),
            ],
          ),
        );
      },
    );
  }
}
