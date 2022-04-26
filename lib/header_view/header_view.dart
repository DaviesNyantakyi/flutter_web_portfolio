import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/utilities/constant.dart';
import 'package:flutter_web_portfolio/widgets/button.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenInfo) {
        if (screenInfo.isMobile || screenInfo.isTablet) {
          return const _MobileView();
        }

        return const _DesktopView();
      },
    );
  }
}

class _MobileView extends StatelessWidget {
  const _MobileView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: kMobilePadding),
      child: _HeaderBody(),
    );
  }
}

class _DesktopView extends StatelessWidget {
  const _DesktopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kDesktopPadding),
      height: kViewHeight,
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(
            flex: 5,
            child: _HeaderBody(),
          ),
          Expanded(
            flex: 2,
            child: Image.asset(
              'assets/images/man_with_phone.png',
              height: 700,
            ),
          )
        ],
      ),
    );
  }
}

class _HeaderBody extends StatefulWidget {
  const _HeaderBody({Key? key}) : super(key: key);

  @override
  State<_HeaderBody> createState() => _HeaderBodyState();
}

class _HeaderBodyState extends State<_HeaderBody> {
  Future<void> openMail() async {
    const url = 'mailto:apkeroo@outlook.com';

    await launchUrl(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    final headingStyle = Theme.of(context).textTheme.headline4;
    final bodyStyle = Theme.of(context).textTheme.bodyText1;
    return ResponsiveBuilder(
      builder: (context, screenInfo) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            AutoSizeText(
              'Flutter Developer </>',
              style: headingStyle,
              maxLines: 1,
            ),
            const SizedBox(height: 18),
            AutoSizeText(
              'Hallo, I\'m Davies Nyantakyi. I have 2 years of expercience building mobile apps using Flutter.',
              style: bodyStyle,
              maxLines: 3,
            ),
            SizedBox(height: screenInfo.isMobile ? 24 : 32),
            CustomElevatedButton(
              height: screenInfo.isMobile ? 44 : 52,
              backgroundColor: Colors.redAccent,
              child: AutoSizeText(
                'Contact Me',
                style: bodyStyle?.copyWith(color: Colors.white),
                maxLines: 1,
              ),
              onPressed: openMail,
            )
          ],
        );
      },
    );
  }
}
