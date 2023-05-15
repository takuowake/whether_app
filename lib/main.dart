import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whether_app/view/input_page.dart';
import 'package:whether_app/view/result_page.dart';

import 'config/config.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clima',
      theme: ThemeData(
        appBarTheme: kAppBarTheme,
        scaffoldBackgroundColor: kScaffoldBackgroundColor,
        inputDecorationTheme: InputDecorationTheme(
          border: kTextFieldStyle,
          enabledBorder: kTextFieldStyle,
        ),
      ),
      routes: {
        '/': (context) => InputPage(),
        '/result': ((context) => const ResultPage()),
      },
    );
  }
}