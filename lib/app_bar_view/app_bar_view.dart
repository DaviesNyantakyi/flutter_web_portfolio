import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/utilities/constant.dart';
import 'package:flutter_web_portfolio/widgets/button.dart';
import 'package:responsive_builder/responsive_builder.dart';

List<String> kDrawerItems = [
  'Projects',
  'About Me',
  'Contact',
];

double _leadingWidth = 100;

class ApkerooLogo extends StatelessWidget {
  final double? width;
  final double? height;
  const ApkerooLogo({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/apkeroo_logo.png',
      width: width,
      height: height,
    );
  }
}

class AppBarView extends StatelessWidget {
  const AppBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenInfo) {
        if (screenInfo.isMobile || screenInfo.isTablet) {
          // Hide the drawer when in mobile view
          return const _MobileAppBarView();
        }
        return const _DesktopAppBarView();
      },
    );
  }
}

class _MobileAppBarView extends StatefulWidget {
  const _MobileAppBarView({Key? key}) : super(key: key);

  @override
  State<_MobileAppBarView> createState() => _MobileAppBarViewState();
}

class _MobileAppBarViewState extends State<_MobileAppBarView> {
  bool onHover = false;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: _leadingWidth,
      toolbarHeight: kAppBarHeight,
      leading: const Padding(
        padding: EdgeInsets.only(left: 50),
        child: ApkerooLogo(),
      ),
      actions: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(right: kMobilePadding),
            child: CustomInkwellButton(
              backgroundColor: onHover ? Colors.grey.shade200 : Colors.white,
              padding: const EdgeInsets.all(12),
              child: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onTap: () {
                Scaffold.of(context).openEndDrawer();
              },
              onHover: (value) {
                onHover = value;
                if (mounted) {
                  setState(() {});
                }
              },
            ),
          ),
        )
      ],
    );
  }
}

class _DesktopAppBarView extends StatelessWidget {
  const _DesktopAppBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: _leadingWidth,
      toolbarHeight: kAppBarHeight,
      leading: const Padding(
        padding: EdgeInsets.only(left: 50),
        child: ApkerooLogo(),
      ),
      actions: kDrawerItems
          .map(
            (e) => NavItem(
              text: e,
              onTap: () {},
              onHover: (value) {},
            ),
          )
          .toList(),
    );
  }
}

class NavItem extends StatefulWidget {
  final String? text;
  final Function(bool) onHover;
  final VoidCallback? onTap;

  const NavItem({Key? key, this.text, required this.onHover, this.onTap})
      : super(key: key);

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  bool onHover = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomInkwellButton(
        backgroundColor: onHover ? Colors.grey.shade200 : Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
          child: Text(
            widget.text ?? '',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        onTap: widget.onTap,
        onHover: (value) {
          onHover = value;
          widget.onHover(value);
          setState(() {});
        },
      ),
    );
  }
}
