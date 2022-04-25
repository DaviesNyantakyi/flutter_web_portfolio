import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/app_bar_view/app_bar_view.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: ApkerooLogo(),
          ),
          ...kDrawerItems
              .map(
                (e) => ListTile(
                  title: Text(e),
                  onTap: () {},
                ),
              )
              .toList()
        ],
      ),
    );
  }
}
