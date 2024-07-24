import 'package:flutter/material.dart';
import 'package:interview_yatri_cabs/colors/Colors.dart';
import 'package:interview_yatri_cabs/components/text.dart';

class PickCityContainers extends StatelessWidget {
  final String TextName;
  final String iconsType;
  final String hintText;
  final TextEditingController? controller;

  const PickCityContainers({super.key, required this.TextName, required this.iconsType, required this.hintText, this.controller});

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        color: lightGreen,
      ),
      child: Row(
        children: [
          Image.asset(iconsType, height: 30, width: 30,),
          Column(
            children: [
              Text(TextName, style: AppWidget.TextFieldTxtGreen(),),
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(
                    color: hintTextColor
                  ),
                ),
              )
            ],
          ),
        ],
      ),


    );
  }
}
