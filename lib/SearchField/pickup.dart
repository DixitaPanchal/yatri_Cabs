import 'package:flutter/material.dart';
import 'package:interview_yatri_cabs/Pages/roundtrip.dart';
import 'package:interview_yatri_cabs/colors/Colors.dart';
import 'package:interview_yatri_cabs/components/text.dart';
import 'package:interview_yatri_cabs/model/citymodel.dart';
import 'package:interview_yatri_cabs/service/CityProvider.dart';
import 'package:interview_yatri_cabs/widgets/list.dart';
import 'package:provider/provider.dart';

class PickUplocation extends StatefulWidget {
  const PickUplocation({super.key});

  @override
  State<PickUplocation> createState() => _PickUplocationState();
}

class _PickUplocationState extends State<PickUplocation> {
  TextEditingController _controller = TextEditingController();
  final List<String> cities = [
    "Jaipur, Rajasthan",
    "Mumbai, Maharashtra",
    "Bengaluru, Karnataka",
    "Kolkata, West Bengal",
    "Kochi, Kerala",
    "Mirzapur, Uttar Pradesh",
    "Lucknow, Uttar Pradesh",
    "Chennai, Tamil Nadu",
    "New Delhi, Delhi",
    "Ahmedabad, Gujarat"
  ];

  late List<String> filterCity;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filterCity = cities;
    _controller.addListener(() {
      filterCities();
    });
  }

  void filterCities() {
    final query = _controller.text.toLowerCase();
    setState(() {
      filterCity = cities.where((city) {
        return city.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColors,
      appBar: AppBar(
        backgroundColor: backgroundColors,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RoundTrip(),
                ));
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 30,
            color: greentextColor,
          ),
        ),
        title: Text("Search Pick Up City", style: AppWidget.SeachCity()),
      ),
      body: mainbody(),
    );
  }

  Widget mainbody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: lightGreen,
                  hintText: "Search here..",
                  hintStyle: AppWidget.SimpleTextGreen(),
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    size: 30,
                    color: greentextColor,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.white24,
                        width: 1,
                      )),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 61, 220, 140),
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _controller.clear();
                      setState(() {});
                    },
                    icon: Icon(
                      Icons.cancel_outlined,
                      size: 25,
                      color: greentextColor,
                    ),
                  )),
            ),
          ),
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: filterCity.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.location_pin, color: textColor),
                  title: Text(filterCity[index], style: AppWidget.SimpleTextWhite(),),
                    onTap: (){
                      context.read<CityProvider>().selectCity(cityModel(name: filterCity[index]));
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RoundTrip(),));
                    },
                );
              })
        ],
      ),
    );
  }
}
