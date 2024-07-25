import 'package:flutter/material.dart';

class CityList extends StatelessWidget {
   CityList({super.key});

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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cities.length,
        itemBuilder: (context, index) {
      return ListTile(
        title: Text(cities[index]),
      );
    });
  }
}
