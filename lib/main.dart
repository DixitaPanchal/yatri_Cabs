
import 'package:flutter/material.dart';
import 'package:interview_yatri_cabs/Pages/airport.dart';
import 'package:interview_yatri_cabs/Pages/localtrip.dart';
import 'package:interview_yatri_cabs/Pages/roundtrip.dart';
import 'package:interview_yatri_cabs/SearchField/pickup.dart';
import 'package:interview_yatri_cabs/components/togglePage.dart';
import 'package:interview_yatri_cabs/service/CityProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => CityProvider()),
      ChangeNotifierProvider(create: (context) => DropCityProvider()),
      ChangeNotifierProvider(create: (context) => DateProvider()),
      ChangeNotifierProvider(create: (context) => TimeProvider()),


    ],
        child: MyApp(),),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yatri Cabs',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
     // theme: ThemeData.dark(),

      debugShowCheckedModeBanner: false,
      home: RoundTrip(),
    );
  }
}

