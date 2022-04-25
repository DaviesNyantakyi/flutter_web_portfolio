import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/app_bar_view/app_bar_view.dart';
import 'package:flutter_web_portfolio/header_view/header_view.dart';
import 'package:flutter_web_portfolio/project_view/project_view.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'widgets/drawer.dart';

class PortfolioView extends StatelessWidget {
  const PortfolioView({Key? key}) : super(key: key);

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
                children: const [
                  AppBarView(),
                  HeaderView(),
                  ProjectView(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
