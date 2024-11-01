// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:statistics/constant.dart';
import 'package:statistics/widget/button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  void nav({required String route}){
    Navigator.pushNamed(context, route);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "hema sallem with statistics",
            style: kTextStyle,
          ),
          centerTitle: true,
          elevation: 20.0,
          bottomOpacity:0.5 ,
        ),
        body: Container(
          padding: EdgeInsets.only(left: 10.0,right: 10.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                MyButton(text: "بيانات مبوبة ", onPress: (){nav(route: "/classified_data");},),
                SizedBox(height: 25.0,),
                MyButton(text: "بيانات غير مبوبة  ", onPress: (){nav(route: "/unclassified_data");}),
                // SizedBox(height: 15.0,),
                // MyButton(text: "بيانات غير مبوبة مع تكرار", onPress: (){}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
