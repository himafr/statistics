// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:statistics/components/alert_result.dart';
import 'package:statistics/components/linear_button.dart';
import 'package:statistics/constant.dart';
import 'package:statistics/modules/median_classified.dart';
import 'package:statistics/modules/mode_classified.dart';
import 'package:statistics/modules/range_classified.dart';
import 'package:statistics/modules/sd.classified.dart';
import '../modules/x_dash_classified.dart';
class ClassifiedData extends StatefulWidget {
  const ClassifiedData({super.key});

  @override
  State<ClassifiedData> createState() => _ClassifiedDataState();
}

class _ClassifiedDataState extends State<ClassifiedData> {
  late List<double> _x;
  late List<int> _y;
  List<Widget> x = [];
  List<Widget> y = [];
    void nav({required String route,arg}){
    Navigator.pushNamed(context, route,arguments:arg );
  }
    void setX(String field1) {
    setState((){
    List<String> values=field1.split(",");
    List<double?> value= values.map((e)=> double.tryParse(e)).toList();
    _x=value.where((e)=>e!=null).cast<double>().toList();
    x.clear();
    for(int i=0;i<_x.length;i++){
     x.add(Text(_x[i].toString()));
     x.add(Text("  ||  "));
    }
  } ); 
  }
    void setY(String field2) {
    setState((){
    List<String> values=field2.split(",");
    List<int?> value= values.map((e)=> int.tryParse(e)).toList();
    _y=value.where((e)=>e!=null).cast<int>().toList();
    y.clear();
    for(int i=0;i<_y.length;i++){
     y.add(Text(_y[i].toString()));
     y.add(Text("  ||  "));
    }
  } ); 
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: const [
            Icon(
              Icons.heart_broken_outlined,
              size: 40.0,
              color: Color.fromARGB(255, 248, 12, 142),
            ),
          ],
          title: Text(
            "بيانات  مبوبة ",
            style: kTextStyle,
            textDirection: TextDirection.rtl,
          ),
          centerTitle: true,
          elevation: 30.0,
          bottomOpacity: 0.5,
        )
        ,
        body: Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(

                        children: x,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      onChanged: (v){setX(v);},
                        decoration: InputDecoration(
                      labelText: 'Enter your text',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16)),
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: y,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      onChanged: (v){setY(v);},
                        decoration: InputDecoration(
                      labelText: 'Enter your text',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16)),
                    )),
                  ],
                ),
                SizedBox(
                    height: 30.0,
                    child: Divider(
                      color: Colors.cyan,
                      endIndent: 30.0,
                      indent: 30.0,
                    )),
                LinearButton(text: "المتوسط , الوسط", onPress: () {
                  XDashClassified result =XDashClassified(nums: _x,fi: _y);
                  showAlertDialog(context, ["Xdash  ${result.getXDash()}"]);
                }),
                SizedBox(
                    height: 30.0,
                    child: Divider(
                      color: Colors.cyan,
                      endIndent: 30.0,
                      indent: 30.0,
                    )),
                LinearButton(text: "الوسيط", onPress: () {
                 MedianClassified result =MedianClassified(nums: _x,f: _y,q: 4);
                  showAlertDialog(context, ["Q1  ${result.getMed(q: 1)}","Q2  ${result.getMed(q: 2)}","Q3  ${result.getMed(q: 3)}"]);
                }),
                SizedBox(
                    height: 30.0,
                    child: Divider(
                      color: Colors.cyan,
                      endIndent: 30.0,
                      indent: 30.0,
                    )),
                LinearButton(text: "المنوال ", onPress: () {
                   ModeClassified result =ModeClassified(nums: _x,f: _y);
                  showAlertDialog(context, ["Mode  ${result.getMode()}"]);
                }),
                SizedBox(
                    height: 30.0,
                    child: Divider(
                      color: Colors.cyan,
                      endIndent: 30.0,
                      indent: 30.0,
                    )),
                LinearButton(text: "الانحراف المعياري  ", onPress: () {
                   SDClassified result =SDClassified(xi: _x,fi: _y);
                  showAlertDialog(context, ["SD  ${result.getSD()}"]);
                }),
                SizedBox(
                    height: 30.0,
                    child: Divider(
                      color: Colors.cyan,
                      endIndent: 30.0,
                      indent: 30.0,
                    )),
                LinearButton(text: " المدي", onPress: () {
                   RangeClassified result =RangeClassified(nums: _x,);
                   SemiRangeClassified result2 =SemiRangeClassified(n: _x,f: _y);
                  showAlertDialog(context, ["Normal Range  ${result.getRange()}","Semi Range  ${result2.getSemiRange()}"]);
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
