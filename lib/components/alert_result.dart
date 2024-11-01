import 'package:flutter/material.dart';


showAlertDialog(BuildContext context,List<String> result) {
List<Text> text=[];
for(int i=0;i<result.length;i++){
  text.add(Text(result[i]));
}
  Widget show=result.length==1?text[0]:Column(children: text,);
  // set up the button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () { 
       Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Result"),
    content:show ,
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}