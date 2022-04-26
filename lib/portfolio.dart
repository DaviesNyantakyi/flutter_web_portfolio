import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/app_bar_view/app_bar_view.dart';
import 'package:flutter_web_portfolio/header_view/header_view.dart';
import 'package:flutter_web_portfolio/project_view/project_view.dart';
import 'package:flutter_web_portfolio/skills_view/skills_view.dart';
import 'package:flutter_web_portfolio/utilities/constant.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'header_view/widgets/drawer.dart';

class Portfolio extends StatelessWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenInfo) {
        return Scaffold(
          endDrawer: screenInfo.isMobile || screenInfo.isTablet
              ? const DrawerView()
              : null,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppBarView(),
                  const HeaderView(),
                  screenInfo.isMobile || screenInfo.isTablet
                      ? const SizedBox(
                          height: 64,
                        )
                      : Container(),
                  const ProjectView(),
                  const SkillsView(),
                  Container(height: kAppBarHeight)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
