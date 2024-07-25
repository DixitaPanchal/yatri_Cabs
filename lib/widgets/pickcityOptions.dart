import 'package:flutter/material.dart';
import 'package:interview_yatri_cabs/colors/Colors.dart';
import 'package:interview_yatri_cabs/components/text.dart';

class PickCityContainers extends StatelessWidget {

  final String hintText;
  final TextEditingController? controller;

  const PickCityContainers({super.key,required this.hintText, this.controller});

  @override
  Widget build(BuildContext context){
    return TextField(
      controller: controller,
      decoration: InputDecoration(

      ),
    );
  }
}
