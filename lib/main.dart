import 'package:flutter/material.dart';

import 'header_view/portfolio_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Davies Nyantakyi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(),
        fontFamily: 'Poppins',
        appBarTheme: const AppBarTheme(elevation: 0, color: Colors.transparent),
      ),
      home: const PortfolioView(),
    );
  }
}
