import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:platform_converter/controller/home_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isAndroid = Platform.isAndroid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Consumer<HomeProvider>(
            builder: (BuildContext context, HomeProvider value, Widget? child) {
              return Column(
                children: [
                  Text(
                    "Time = ${value.time?.hour ?? "00"}:${value.time?.minute ?? "00"}",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text(
                    "Date ${DateFormat("EEE, MMM d, ''yy").format(value.date ?? DateTime.now())}",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ],
              );
            },
          ),
          SizedBox(
            height: 300,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.time,
              onDateTimeChanged: (value) {
                Provider.of<HomeProvider>(context, listen: false).setDate(value);
                print(value);
              },
            ),
          ),
          CupertinoAlertDialog(
            title: Text("Select Date"),
            content: Text("please Select Date"),
            actions: [
              if (!isAndroid)
                CupertinoButton(
                  child: Text("Ok"),
                  onPressed: () {},
                ),
              if (isAndroid)
                TextButton(
                  onPressed: () {},
                  child: Text("Ok"),
                )
            ],
          ),
          ElevatedButton(
              onPressed: () async {
                DateTime? date = await showDatePicker(
                    context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime(2030));
                if (date != null) {
                  Provider.of<HomeProvider>(context, listen: false).setDate(date);
                }
              },
              child: Text("Date")),
          ElevatedButton(
              onPressed: () async {
                TimeOfDay? time = await showTimePicker(context: context, initialTime: TimeOfDay.now());
                if (time != null) {
                  Provider.of<HomeProvider>(context, listen: false).setTime(time);
                }

                print(time);
              },
              child: Text("Time"))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          DateTime dateTime = DateTime.now();
          TimeOfDay timeOfDay = TimeOfDay.now();
          //4-5-2024
          print("${dateTime.day}/${dateTime.month}/${dateTime.year}");

          print(timeOfDay);
          print(timeOfDay.hour);
          print(timeOfDay.minute);

          print("Platform.isAndroid ${Platform.isAndroid}");
          print("Platform.isIOS ${Platform.isIOS}");
          print("Platform.isMac ${Platform.isMacOS}");
          print("Platform.kIsWeb ${kIsWeb}");
        },
      ),

    );
  }
}
