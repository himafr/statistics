import 'package:flutter/material.dart';
import 'package:statistics/constant.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key,required this.text,required this.onPress});
  final String text;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity ,
      child: TextButton(
        child: Text(text,style: kNormalTextStyle,),
        onPressed: ()=> onPress(),
      ),
    );
  }
}