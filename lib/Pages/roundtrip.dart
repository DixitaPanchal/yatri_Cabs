import 'dart:math';

import 'package:flutter/material.dart';
import 'package:interview_yatri_cabs/colors/Colors.dart';
import 'package:interview_yatri_cabs/components/text.dart';
import 'package:interview_yatri_cabs/widgets/button.dart';
import 'package:interview_yatri_cabs/widgets/pickcityOptions.dart';

class RoundTrip extends StatefulWidget {
  const RoundTrip({super.key});

  @override
  State<RoundTrip> createState() => _RoundTripState();
}

class _RoundTripState extends State<RoundTrip> {
  int currentIndex = 0;

  bool bell = false;

  late PageController controller;
  TextEditingController pickcityName = TextEditingController();
  TextEditingController dropxityName = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColors,
      body: body(),
    );
  }

  Widget body() {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 35, left: 15),
                child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(8)),
                    height: screenHeight * 0.1,
                    width: screenWidth * 0.6,
                    child: Image.asset("assets/logos.png")),
              ),
              Padding(
                padding: EdgeInsets.only(top: 35, right: 10),
                child: GestureDetector(
                  onTap: (){
                    setState(() {

                      bell =  !bell;

                    });
                  },
                  child: Icon(
                    Icons.notifications_active,
                    color: bell== true? textColor : Colors.yellow,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 5),
            child: Row(
              children: [
                Text(
                  "India's Leading",
                  style: AppWidget.HeadText1(),
                ),
                Text(
                  " Inter-City",
                  style: AppWidget.HeadText2(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Text(
                  "One Way",
                  style: AppWidget.HeadText2(),
                ),
                Text(
                  " Cab Service Provider",
                  style: AppWidget.HeadText1(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset("assets/cabAd.jpeg", height: MediaQuery.of(context).size.height * 0.2,)),
          ),
          TransportationOption(),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Button(txt: "One-way", btnclr: false, height2: 28,),
              Button(txt: "Round Trip", btnclr: true, height2: 28,),
      
            ],
          ),
          SizedBox(height: 5,),
      
         PickUpCity(),

          SizedBox(height: 3,),

          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset("assets/cabAd2.png", height: MediaQuery.of(context).size.height * 0.2, width: MediaQuery.of(context).size.width*0.95, fit: BoxFit.fill,)),
          ),

        ],
      ),
    );
  }

  Widget TransportationOption() {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stack(
            children: [
              Container(
                height: screenHeight * 0.1,
                width: screenWidth * 0.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: greentextColor),
              ),
              Positioned(
                top: 15,
                left: 25,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/map.png",
                      height: 40,
                      width: 40,
                      color: textColor,
                      alignment: Alignment.center,
                    ),
                    Text("Outstation Trip", style: AppWidget.SimpleText1(),),

                  ],
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                height: screenHeight * 0.1,
                width: screenWidth * 0.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: textColor),
              ),
              Positioned(
                left: 38,
                top: 15,
                child: Column(

                  children: [
                    Image.asset(
                      "assets/train.png",
                      height: 40,
                      width: 40,
                      color: Colors.black,
                      alignment: Alignment.center,
                    ),
                    Text("Local Trip", style: AppWidget.SimpleText2(),),

                  ],
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                height: screenHeight * 0.1,
                width: screenWidth * 0.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: textColor),
              ),
              Positioned(
                left: 25,
                top: 15,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/airport.png",
                      height: 40,
                      width: 40,
                      color: Colors.black,
                      alignment: Alignment.center,
                    ),
                    Text("Airport Transfer", style: AppWidget.SimpleText2(),),

                  ],
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }

  Widget PickUpCity() {
    double height= MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
          decoration: BoxDecoration(
            color: textColor,
            borderRadius: BorderRadius.circular(20),
          ),
          height: height*0.5,
          width: width,
        ),
          Positioned(
            top: 20,
              left:20 ,
              child: Column(
                children: [
                  PickUpCityContainers("assets/locationMap.png", "Pick-Up City", "Type City Name"),
                  SizedBox(height: 10,),
                  PickUpCityContainers("assets/Flag.png", "Drop City", "Type City Name"),
                  SizedBox(height: 10,),
                  PickUpCityContainers("assets/world.png", "Pick-up Date", "DD-MM-YYYY"),
                  SizedBox(height: 10,),
                  PickUpCityContainers("assets/time.png", "Time", "HH:MM"),
                  SizedBox(height: 30,),
                  Button(txt: "Explore Cabes", btnclr: false, height2: 40,),

                ],
              )),



        ]
      ),
    );
  }


  Widget PickUpCityContainers(String iconsType, String TextName, String hintText  ) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.075,
      width: MediaQuery.of(context).size.width *0.85,
      decoration: BoxDecoration(
        color: lightGreen,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
                child: Image.asset(iconsType, height: 30, width: 30,)),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(TextName, style: AppWidget.TextFieldTxtGreen(),),
                    Text(hintText, style: AppWidget.TextFieldHintText(),)
                    
                  ],
                ),

              ],
            ),
          ),

        ],
      ),


    );

  }
}
