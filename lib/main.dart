import 'package:bmi_calculator1/screens/results_page.dart';
import 'package:flutter/material.dart';

import 'screens/input_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(199, 24, 30, 80),
      foregroundColor: Colors.white,
    )),
    home: const InputPage(),
    routes: {
      "/home": (context) => const InputPage(),
    },
  ));
}


