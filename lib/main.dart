import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/controller/home_provider.dart';
import 'package:platform_converter/controller/main_provider.dart';
import 'package:platform_converter/view/home_new.dart';
import 'package:platform_converter/view/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => MainProvider()),
      ],
      builder: (context, child) {
        return Consumer<MainProvider>(
          builder: (BuildContext context, MainProvider value, Widget? child) {
            if (value.isAndroid) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                initialRoute: "home_page",
                routes: {
                  "home_page": (context) => HomeNew(),
                },
              );
            } else {
              return CupertinoApp(
                debugShowCheckedModeBanner: false,
                initialRoute: "/",
                routes: {
                  "/": (context) => HomeNew(),
                },
              );
            }
          },
        );
      },
    );
  }
}
