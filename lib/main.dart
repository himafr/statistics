// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:statistics/screens/classified_data.dart';
import 'package:statistics/screens/home_screen.dart';
import 'package:statistics/screens/unclassified_data.dart';
void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "hema sallem",
      theme: ThemeData.dark()
      .copyWith(scaffoldBackgroundColor: Color(0xff060604),
      primaryColor: Color(0xff060604)),
      initialRoute: "/",
      routes: {
        "/":(context) => MyHomePage(),
        "/classified_data":(context) => ClassifiedData(),
        "/unclassified_data":(context) => UnclassifiedData(),
      },
      // debugShowMaterialGrid: true,
      debugShowCheckedModeBanner: false,
      );
  }
  }