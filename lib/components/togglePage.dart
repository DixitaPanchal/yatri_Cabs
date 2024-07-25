import 'package:flutter/material.dart';
import 'package:interview_yatri_cabs/Pages/airport.dart';
import 'package:interview_yatri_cabs/Pages/localtrip.dart';
import 'package:interview_yatri_cabs/Pages/roundtrip.dart';

class ToggleButton extends StatefulWidget {
  const ToggleButton({super.key});

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {

  bool showHomeScreen = true;
  bool showLocalTrip = true;

  void togglePage() {
    setState(() {
      showHomeScreen = !showHomeScreen;
      showLocalTrip = !showLocalTrip;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showHomeScreen)
      return RoundTrip();

    if(showLocalTrip)
      return LocalTrip();

    else
      return Airport();


  }
}
