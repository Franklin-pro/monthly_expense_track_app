import 'package:flutter/material.dart';
// import 'package:tracker/View/Login/welcome_view.dart';
import 'package:tracker/View/main_tab/main_tab_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monthly Tracker App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Inter",
        useMaterial3: false,
      ),
      home: const MainTabView(),
    );
  }
}
