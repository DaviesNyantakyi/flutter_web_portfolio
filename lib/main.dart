import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'portfolio.dart';

void main() {
  runApp(const MyApp());
}

final fontStyle = GoogleFonts.montserrat();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Davies Nyantakyi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          headline4: fontStyle.copyWith(color: Colors.black),
          bodyText1: fontStyle.copyWith(color: Colors.black),
        ),
        fontFamily: 'Poppins',
        appBarTheme: const AppBarTheme(elevation: 0, color: Colors.transparent),
      ),
      home: const Portfolio(),
    );
  }
}
