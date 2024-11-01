import 'package:flutter/material.dart';
import 'package:statistics/constant.dart';

class LinearButton extends StatelessWidget {
  const LinearButton({super.key, required this.text, required this.onPress});
  final String text;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return const LinearGradient(
          colors: [Colors.blue, Colors.purple],
          tileMode: TileMode.mirror,
        ).createShader(rect);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        child: TextButton(
          onPressed: () {
            onPress();
          },
          child: Text(
            text,
            style: kNormalTextStyle,
            textDirection: TextDirection.rtl,
          ),
        ),
      ),
    );
  }
}
