// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: DateApp(),
    );
  }
}

class DateApp extends StatefulWidget {
  const DateApp({super.key});

  @override
  State<DateApp> createState() => _DateAppState();
}

class _DateAppState extends State<DateApp> {
  String day = "";
  String dayName = "";
  String month = "";
  String year = "";
  int hour = 0;
  String minute = "";
  String second = "";
  String Am_Pm = "";

  changeEvrySec() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        dayName = DateTime.now().weekday.toString();
        day = DateTime.now().day.toString();
        month = DateTime.now().month.toString();
        year = DateTime.now().year.toString();
        hour = DateTime.now().hour;
        minute = DateTime.now().minute.toString();
        second = DateTime.now().second.toString();
        switch (dayName) {
          case "1":
            dayName = "Monday";
            break;
          case "2":
            dayName = "Tuesday";
            break;
          case "3":
            dayName = "Wednesday";
            break;
          case "4":
            dayName = "Thursday";
            break;
          case "5":
            dayName = "Friday";
            break;
          case "6":
            dayName = "Saturday";
            break;
          case "7":
            dayName = "Sunday";
            break;
        }
        switch (month) {
          case "1":
            month = "January";
            break;
          case "2":
            month = "February";
            break;
          case "3":
            month = "March";
            break;
          case "4":
            month = "April";
            break;
          case "5":
            month = "May";
            break;
          case "6":
            month = "June";
            break;
          case "7":
            month = "July";
            break;
          case "8":
            month = "August";
            break;
          case "9":
            month = "September";
            break;
          case "10":
            month = "October";
            break;
          case "11":
            month = "November";
            break;
          case "12":
            month = "December";
            break;
        }
        if (hour > 12) {
          hour = hour - 12;
          Am_Pm = "PM";
        } else {
          Am_Pm = "AM";
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    changeEvrySec();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Time & Date App",
          style: TextStyle(
            color: Colors.white70,
            fontSize: 30,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Today's Date is $dayName",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "$month $day , $year",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white70,
              ),
              child: Text(
                "${hour.toString().padLeft(2, "0")} : ${minute.padLeft(2, "0")} : ${second.padLeft(2, "0")} $Am_Pm",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
