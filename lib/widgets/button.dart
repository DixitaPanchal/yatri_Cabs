import 'package:flutter/material.dart';
import 'package:interview_yatri_cabs/colors/Colors.dart';
import 'package:interview_yatri_cabs/components/text.dart';

class Button extends StatelessWidget {
  final String txt;
  bool btnclr =false;
  final double height2;
  Button({super.key, required this.txt, required this.btnclr, required this.height2});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height2,
      width: MediaQuery.of(context).size.width*0.35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: btnclr == true?textColor: greentextColor,
      ),
      child: Center(child: Text(txt , style: btnclr== true? AppWidget.SimpleTextGreen(): AppWidget.SimpleTextWhite(),)),
    );
  }
}
