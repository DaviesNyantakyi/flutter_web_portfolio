import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/utilities/constant.dart';
import 'package:flutter_web_portfolio/widgets/button.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenInfo) {
        if (screenInfo.isMobile) {
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
      padding: EdgeInsets.all(kDesktopPadding),
      child: _HeaderBody(),
    );
  }
}

class _DesktopView extends StatelessWidget {
  const _DesktopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kContentHeight,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDesktopPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              child: _HeaderBody(),
            ),
            const SizedBox(width: 64),
            Flexible(
              child: Image.asset(
                'assets/images/man_with_phone.png',
                height: 600,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _HeaderBody extends StatelessWidget {
  const _HeaderBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final headingStyle = Theme.of(context).textTheme.headline4?.copyWith(
          color: Colors.black,
        );
    final bodyStyle = Theme.of(context).textTheme.bodyText1?.copyWith(
          color: Colors.black,
          fontSize: 18,
        );
    return ResponsiveBuilder(
      builder: (context, screenInfo) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(
              'I\'m a Flutter',
              style: headingStyle,
              maxLines: 1,
            ),
            Row(
              children: [
                Flexible(
                  flex: 5,
                  child: AutoSizeText(
                    'Developer ',
                    style: headingStyle,
                    maxLines: 1,
                  ),
                ),
                Flexible(
                  child: AutoSizeText(
                    '</>',
                    style: headingStyle,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            AutoSizeText(
              'Hallo, I\'m Davies Nyantakyi. I have 2 years of expercience with building mobile apps using flutter.',
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
              onPressed: () {},
            )
          ],
        );
      },
    );
  }
}
