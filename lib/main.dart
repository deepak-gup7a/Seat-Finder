import 'package:flutter/material.dart';
import 'package:seatfinder/screens/seat_finder.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Seat Finder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SeatFinderPage(),
    );
  }
}
