import 'dart:math';

import 'package:flutter/material.dart';
import 'package:interview_yatri_cabs/Pages/localtrip.dart';
import 'package:interview_yatri_cabs/Pages/roundtrip.dart';
import 'package:interview_yatri_cabs/SearchField/pickup.dart';
import 'package:interview_yatri_cabs/colors/Colors.dart';
import 'package:interview_yatri_cabs/components/text.dart';
import 'package:interview_yatri_cabs/service/CityProvider.dart';
import 'package:interview_yatri_cabs/widgets/button.dart';
import 'package:interview_yatri_cabs/widgets/pickcityOptions.dart';
import 'package:provider/provider.dart';

import '../SearchField/drop.dart';
import '../service/CityProvider.dart';
import 'airport.dart';

class LocalTrip extends StatefulWidget {
  const LocalTrip({super.key});

  @override
  State<LocalTrip> createState() => _LocalTripState();
}

class _LocalTripState extends State<LocalTrip> {

  DateTime date = DateTime.now();
  int currentIndex = 0;

  bool bell = false;
  bool datepicked = false;

  late PageController controller;
  TextEditingController pickcityName = TextEditingController();
  TextEditingController dropxityName = TextEditingController();
  TextEditingController datectr = TextEditingController();


  final List<Widget> _children = [
    RoundTrip(),
    LocalTrip(),
    Airport(),
  ];

  void onTabTapped(int index){
    setState(() {
      currentIndex = index;
    });
  }

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(context: context, firstDate: DateTime(1950),initialDate: DateTime.now(), lastDate: DateTime(2100));

    if(_picked!= null) {
      setState(() {
        datectr.text = _picked.toString().split(" ")[0];
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColors,
      body: body(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        backgroundColor: greentextColor,
        selectedItemColor: Colors.black,
        unselectedItemColor: greentextColor,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home' , ),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'My Trip'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Account'),
          BottomNavigationBarItem(icon: Icon(Icons.more_rounded), label: 'More'),


        ],
      ),

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
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RoundTrip(),));
                },
                child: Container(
                  height: screenHeight * 0.1,
                  width: screenWidth * 0.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: textColor),
                ),
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
                      color: Colors.black,
                      alignment: Alignment.center,
                    ),
                    Text("Outstation Trip", style: AppWidget.SimpleText2(),),

                  ],
                ),
              ),
            ],
          ),
          Stack(
            children: [
              GestureDetector(
                onTap: (){
                },
                child: Container(
                  height: screenHeight * 0.1,
                  width: screenWidth * 0.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: greentextColor),
                ),
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
                      color: textColor,
                      alignment: Alignment.center,
                    ),
                    Text("Local Trip", style: AppWidget.SimpleText1(),),

                  ],
                ),
              ),
            ],
          ),
          Stack(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Airport(),));
                },
                child: Container(
                  height: screenHeight * 0.1,
                  width: screenWidth * 0.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: textColor),
                ),
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
                left: 20,
                child: Column(
                  children: [
                    PickUpCityContainers("assets/locationMap.png", "Pickup City", "Type City Name", context),
                    SizedBox(height: 10,),
                    DateContainers("assets/world.png", "Pick-up Date", "DD-MM-YYYY", context),
                    SizedBox(height: 10,),
                    TimeContainers("assets/time.png", "Time", "HH:MM", context),
                    SizedBox(height: 30,),
                    Button(txt: "Explore Cabes", btnclr: false, height2: 40, border: false,),

                  ],
                )),



          ]
      ),
    );
  }


  Widget PickUpCityContainers(String iconsType, String TextName, String hintText, BuildContext context) {
    return Consumer<CityProvider>(builder: (context, CityProvider, child) {
      final city = CityProvider.selectedCity;
      return  GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => PickUplocation(),));
        },
        child: Container(
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
                        Text(city== null? hintText : '${city.name}', style: AppWidget.TextFieldHintText(),)
                      ],
                    ),

                  ],
                ),
              ),

            ],
          ),


        ),
      );




    });
  }

  Widget DropCityContainers(String iconsType, String TextName, String hintText, BuildContext context) {
    return Consumer<DropCityProvider>(builder: (context, DropCityProvider, child) {
      final city = DropCityProvider.selectedCity;
      return  GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => DropLoc(),));
        },
        child: Container(
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
                        Text(city == null? hintText : '${city.name}', style: AppWidget.TextFieldHintText(),)
                      ],
                    ),

                  ],
                ),
              ),


            ],
          ),


        ),
      );
    });


  }

  Widget DateContainers(String iconsType, String TextName, String hintText, BuildContext context) {
    return Consumer<DateProvider>(builder: (context, Dateprovider, child) {
      final selectDate = Dateprovider.selectedDate;

      return  GestureDetector(
        onTap: () async{
          final DateTime? pickedDate = await showDatePicker(context: context, firstDate: DateTime(2000), lastDate: DateTime(2100), initialDate: context.read<DateProvider>().selectedDate);

          if(pickedDate != null){
            context.read<DateProvider>().updateDate(pickedDate);
          }

          datepicked = true;


          setState(() {
          });

        },
        child: Container(
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
                        Text('${selectDate.toLocal()}'.split(' ')[0] , style: AppWidget.TextFieldHintText(),)
                      ],
                    ),

                  ],
                ),
              ),

            ],
          ),

        ),
      );



    }) ;

  }

  Widget TimeContainers(String iconsType, String TextName, String hintText, BuildContext context) {
    return Consumer<TimeProvider>(builder: (context, timeProvider, child) {
      final selectTime = timeProvider.selectedTime;

      return  GestureDetector(
        onTap: () async{
          final TimeOfDay? pickedTime = await showTimePicker(context: context, initialTime: context.read<TimeProvider>().selectedTime);

          if(pickedTime != null) {
            context.read<TimeProvider>().updateTime(pickedTime);
          }
        },
        child: Container(
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
                        Text('${selectTime.format(context)}' , style: AppWidget.TextFieldHintText(),)
                      ],
                    ),

                  ],
                ),
              ),

            ],
          ),

        ),
      );



    }) ;

  }


}
