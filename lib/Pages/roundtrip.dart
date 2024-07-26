import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:interview_yatri_cabs/SearchField/pickup.dart';
import 'package:interview_yatri_cabs/colors/Colors.dart';
import 'package:interview_yatri_cabs/components/text.dart';
import 'package:interview_yatri_cabs/service/CityProvider.dart';
import 'package:interview_yatri_cabs/widgets/button.dart';
import 'package:provider/provider.dart';

import '../SearchField/drop.dart';

class RoundTrip extends StatefulWidget {
  const RoundTrip({super.key});

  @override
  State<RoundTrip> createState() => _RoundTripState();
}

class _RoundTripState extends State<RoundTrip> {
  DateTime date = DateTime.now();
  int currentIndex = 0;
  int currentSlider = 0;

  bool isRounderTrip = false;
  bool isOrganizeTrip = true;
  bool isLocalTrip = false;
  bool isAirport = false;
  bool isToTheAirport = false;

  final CarouselController carouselController = CarouselController();


  bool bell = true;
  bool datepicked = false;

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  late PageController controller;
  TextEditingController pickcityName = TextEditingController();
  TextEditingController dropxityName = TextEditingController();
  TextEditingController datectr = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pickcityName.dispose();
    dropxityName.dispose();
    datectr.dispose();
  }

  final List<String> items = [
    'assets/cabAd.jpeg',
    'assets/cabAd.jpeg',
    'assets/cabAd.jpeg',
    'assets/cabAd.jpeg',


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColors,
      body: body(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: greentextColor,
        selectedItemColor: Colors.black,
        unselectedItemColor: textColor,
        currentIndex: currentIndex,
        selectedLabelStyle: AppWidget.Selectedlabel(),
        unselectedLabelStyle: AppWidget.Selectedlabel(),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',

          ),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'My Trip'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Account' , ),
          BottomNavigationBarItem(
              icon: Icon(Icons.more_rounded), label: 'More'),
        ],
      ),
    );
  }

  Widget body() {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;

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
            padding: const EdgeInsets.only(top: 35, right: 10),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  bell = !bell;
                });
              },
              child: Icon(
                Icons.notifications_active,
                color: bell == true ? textColor : Colors.yellow,
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
      // Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: ClipRRect(
      //       borderRadius: BorderRadius.circular(20),
      //       child: Image.asset("assets/cabAd.jpeg", height: MediaQuery.of(context).size.height * 0.2,)),
      // ),
      Stack(
        children: [
          CarouselSlider(
          options: CarouselOptions(
              autoPlay: true,
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.2,
              viewportFraction: 1,
              autoPlayInterval: Duration(seconds: 3),
              onPageChanged: (index, reason) {
                setState(() {
                  currentSlider = index;
                });
              }),
          items: items.map((image) {
            return ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(image));
          }).toList(),
        ),

          Positioned(
            top: MediaQuery.of(context).size.height * 0.17,
            left: MediaQuery.of(context).size.width / 2.3,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: items
                  .asMap()
                  .entries
                  .map((e) {
                return GestureDetector(
                    onTap: () => carouselController.animateToPage(e.key),
                    child: Container(
                      height: 8,
                      width: 8,
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentSlider == e.key ? Colors.white : Colors
                              .white.withOpacity(0.4)
                      ),
                    ));
              }).toList(),
            ),
          ),
        ],
      ),
      TransportationOption(),
      const SizedBox(
        height: 5,
      ),
      (isLocalTrip == false && isAirport == false)
          ? Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
              onTap: () {
                isRounderTrip = !isRounderTrip;
                setState(() {});
              },
              child: Button(
                  txt: "One-way",
                  btnclr: isRounderTrip ? false : true,
                  height2: 28,
                  border: false)),
          GestureDetector(
              onTap: () {
                isRounderTrip = !isRounderTrip;
                setState(() {});
              },
              child: Button(
                txt: "Round Trip",
                btnclr: isRounderTrip ? true : false,
                height2: 28,
                border: false,
              )),
        ],
      )
          : SizedBox(),
      const SizedBox(
        height: 5,
      ),

      PickUpCity(),

      const SizedBox(
        height: 3,
      ),

      Padding(
        padding: const EdgeInsets.all(5.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assets/cabAd2.png",
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.2,
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.95,
              fit: BoxFit.fill,
            )),
      ),
    ]));
  }

  Widget TransportationOption() {
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              isOrganizeTrip = true;
              isLocalTrip = false;
              isAirport = false;
              setState(() {});
              // Navigator.push(context, MaterialPageRoute(builder: (context) =>  const RoundTrip(),));
            },
            child: Stack(
              children: [
                Container(
                  height: screenHeight * 0.1,
                  width: screenWidth * 0.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color:
                      isOrganizeTrip == true ? greentextColor : textColor),
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
                        color:
                        isOrganizeTrip == true ? textColor : Colors.black,
                        alignment: Alignment.center,
                      ),
                      Text(
                        "Outstation Trip",
                        style: isOrganizeTrip == true
                            ? AppWidget.SimpleText1()
                            : AppWidget.SimpleText2(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              isOrganizeTrip = false;
              isAirport = false;
              isLocalTrip = true;
              isRounderTrip = true;
              setState(() {});
            },
            child: Stack(
              children: [
                Container(
                  height: screenHeight * 0.1,
                  width: screenWidth * 0.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: isLocalTrip == true ? greentextColor : textColor),
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
                        color: isLocalTrip == true ? textColor : Colors.black,
                        alignment: Alignment.center,
                      ),
                      Text(
                        "Local Trip",
                        style: isLocalTrip == true
                            ? AppWidget.SimpleText1()
                            : AppWidget.SimpleText2(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              isAirport = true;
              isOrganizeTrip = false;
              isLocalTrip = false;
              isRounderTrip = true;
              setState(() {});

              // Navigator.push(context, MaterialPageRoute(builder: (context) =>  const  Airport(),));
            },
            child: Stack(
              children: [
                Container(
                  height: screenHeight * 0.1,
                  width: screenWidth * 0.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: isAirport == true ? greentextColor : textColor),
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
                        color: isAirport == true ? textColor : Colors.black,
                        alignment: Alignment.center,
                      ),
                      Text(
                        "Airport Transfer",
                        style: isAirport == true
                            ? AppWidget.SimpleText1()
                            : AppWidget.SimpleText2(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget PickUpCity() {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return Consumer<DateProvider>(builder: (context, Dateprovider, child) {
      final selectDate = Dateprovider.selectedDate;
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
              color: textColor,
              borderRadius: BorderRadius.circular(20),
            ),
            height: height * 0.5,
            width: width,
          ),
          Positioned(
              top: 20,
              left: 20,
              child: Column(
                children: [
                  isAirport == true
                      ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            isToTheAirport = !isToTheAirport;
                            setState(() {});
                          },
                          child: Button(
                              txt: "To the Airport",
                              btnclr: isToTheAirport ? false : true,
                              height2: 28,
                              border: true)),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                          onTap: () {
                            isToTheAirport = !isToTheAirport;
                            setState(() {});
                          },
                          child: Button(
                            txt: "From the Airport",
                            btnclr: isToTheAirport ? true : false,
                            height2: 28,
                            border: true,
                          )),
                    ],
                  )
                      : SizedBox(
                    height: 10,
                  ),
                  isAirport == true ? SizedBox(height: 20,): SizedBox(height: 0,),
                  PickUpCityContainers(
                      "assets/locationMap.png",
                      isToTheAirport == true
                          ? "Pick-Up City"
                          : "Pick-Up Airport",
                      "Type City Name",
                      context),
                  (isLocalTrip == true || isAirport == true)
                      ? const SizedBox(
                    height: 0,
                  )
                      : const SizedBox(
                    height: 10,
                  ),
                  (isLocalTrip == true || isAirport == true)
                      ? SizedBox(height: 0)
                      : DropCityContainers("assets/Flag.png", "Drop City",
                      "Type City Name", context),
                  const SizedBox(
                    height: 10,
                  ),
                  isRounderTrip
                      ? DateContainers("assets/world.png", "Pick-up Date",
                      "DD-MM-YYYY", context)
                      : const SizedBox(
                    height: 0,
                  ),
                  isRounderTrip == false
                      ? const SizedBox(
                    height: 0,
                  )
                      : const SizedBox(
                    height: 10,
                  ),
                  TimeContainers("assets/time.png", "Time", "HH:MM", context),
                  const SizedBox(
                    height: 30,
                  ),
                  isRounderTrip == false
                      ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "From Date",
                            style: AppWidget.TextFieldTxtGreen(),
                          ),
                          GestureDetector(
                              onTap: () async {
                                final DateTime? pickedDate =
                                await showDatePicker(
                                    context: context,
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2100),
                                    initialDate: context
                                        .read<DateProvider>()
                                        .selectedDate);

                                if (pickedDate != null) {
                                  context
                                      .read<DateProvider>()
                                      .updateDate(pickedDate);
                                }

                                datepicked = true;

                                setState(() {});
                              },
                              child: datepicked == false
                                  ? const Text("DD-MM-YYYY")
                                  : Text(
                                '${selectDate.toLocal()}'
                                    .split(' ')[0],
                                style: AppWidget.SimpleText2(),
                              )),
                        ],
                      ),
                      const SizedBox(
                        width: 45,
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            "assets/world.png",
                            height: 40,
                            width: 40,
                          )),
                      const SizedBox(
                        width: 45,
                      ),
                      Column(
                        children: [
                          Text(
                            "Till Date",
                            style: AppWidget.TextFieldTxtGreen(),
                          ),
                          Text("DD-MM-YYYY"),
                        ],
                      ),
                    ],
                  )
                      : const SizedBox(
                    height: 0,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Button(
                    txt: "Explore Cabes",
                    btnclr: false,
                    height2: 40,
                    border: false,
                  ),
                ],
              )),
        ]),
      );
    });
  }

  Widget PickUpCityContainers(String iconsType, String TextName,
      String hintText, BuildContext context) {
    return Consumer<CityProvider>(builder: (context, CityProvider, child) {
      final city = CityProvider.selectedCity;
      return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PickUplocation(),
              ));
        },
        child: Container(
          height: MediaQuery
              .of(context)
              .size
              .height * 0.075,
          width: MediaQuery
              .of(context)
              .size
              .width * 0.85,
          decoration: BoxDecoration(
              color: lightGreen, borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      iconsType,
                      height: 30,
                      width: 30,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          TextName,
                          style: AppWidget.TextFieldTxtGreen(),
                        ),
                        Text(
                          city == null ? hintText : '${city.name}',
                          style: AppWidget.TextFieldHintText(),
                        )
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

  Widget DropCityContainers(String iconsType, String TextName, String hintText,
      BuildContext context) {
    return Consumer<DropCityProvider>(
        builder: (context, DropCityProvider, child) {
          final city = DropCityProvider.selectedCity;
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DropLoc(),
                  ));
            },
            child: Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.075,
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.85,
              decoration: BoxDecoration(
                  color: lightGreen, borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          iconsType,
                          height: 30,
                          width: 30,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              TextName,
                              style: AppWidget.TextFieldTxtGreen(),
                            ),
                            Text(
                              city == null ? hintText : '${city.name}',
                              style: AppWidget.TextFieldHintText(),
                            )
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

  Widget DateContainers(String iconsType, String TextName, String hintText,
      BuildContext context) {
    return Consumer<DateProvider>(builder: (context, Dateprovider, child) {
      final selectDate = Dateprovider.selectedDate;

      return GestureDetector(
        onTap: () async {
          final DateTime? pickedDate = await showDatePicker(
              context: context,
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              initialDate: context
                  .read<DateProvider>()
                  .selectedDate);

          if (pickedDate != null) {
            // context.read<DateProvider>().updateDate(pickedDate);
            Provider.of<DateProvider>(context, listen: false)
                .updateDate(pickedDate);
          }

          datepicked = true;

          setState(() {});
        },
        child: Container(
          height: MediaQuery
              .of(context)
              .size
              .height * 0.075,
          width: MediaQuery
              .of(context)
              .size
              .width * 0.85,
          decoration: BoxDecoration(
              color: lightGreen, borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      iconsType,
                      height: 30,
                      width: 30,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          TextName,
                          style: AppWidget.TextFieldTxtGreen(),
                        ),
                        Text(
                          '${selectDate.toLocal()}'.split(' ')[0],
                          style: AppWidget.TextFieldHintText(),
                        )
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

  Widget TimeContainers(String iconsType, String TextName, String hintText,
      BuildContext context) {
    return Consumer<TimeProvider>(builder: (context, timeProvider, child) {
      final selectTime = timeProvider.selectedTime;

      return GestureDetector(
        onTap: () async {
          final TimeOfDay? pickedTime = await showTimePicker(
              context: context,
              initialTime: context
                  .read<TimeProvider>()
                  .selectedTime);

          if (pickedTime != null) {
            context.read<TimeProvider>().updateTime(pickedTime);
          }
        },
        child: Container(
          height: MediaQuery
              .of(context)
              .size
              .height * 0.075,
          width: MediaQuery
              .of(context)
              .size
              .width * 0.85,
          decoration: BoxDecoration(
              color: lightGreen, borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      iconsType,
                      height: 30,
                      width: 30,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          TextName,
                          style: AppWidget.TextFieldTxtGreen(),
                        ),
                        Text(
                          '${selectTime.format(context)}',
                          style: AppWidget.TextFieldHintText(),
                        )
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
}
