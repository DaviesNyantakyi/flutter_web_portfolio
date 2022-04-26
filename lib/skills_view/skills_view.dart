import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/utilities/constant.dart';
import 'package:responsive_builder/responsive_builder.dart';

List<String> skills = [
  'UX/UI',
  'Figma',
  'Flutter',
  'Firebase',
];

class SkillsView extends StatelessWidget {
  const SkillsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenInfo) {
        return Container(
          margin: EdgeInsets.all(
            screenInfo.isMobile || screenInfo.isTablet
                ? kMobilePadding
                : kDesktopPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Skills',
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(height: kContentSpacing32),
              Column(
                children: skills
                    .map(
                      (e) => SkillCard(title: e),
                    )
                    .toList(),
              )
            ],
          ),
        );
      },
    );
  }
}

class SkillCard extends StatelessWidget {
  final Color? backgroundColor;
  final String title;
  const SkillCard({
    Key? key,
    this.backgroundColor,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Card(
        color: Colors.grey.shade100,
        elevation: 0,
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}
