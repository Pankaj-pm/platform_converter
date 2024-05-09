// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/controller/home_provider.dart';
import 'package:provider/provider.dart';

import '../controller/main_provider.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (BuildContext context, MainProvider value, Widget? child) {
        if (value.isAndroid) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                Consumer<MainProvider>(
                  builder: (BuildContext context, MainProvider mainProvider, Widget? child) {
                    return Switch(
                      value: mainProvider.isAndroid,
                      activeColor: Colors.white,
                      onChanged: (value) {
                        mainProvider.changePlatform(value);
                      },
                    );
                  },
                )
              ],
            ),
            body: Text("ff"),
          );
        } else {
          return CupertinoPageScaffold(
              child: CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              items: [
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.person)),
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings)),
              ],
            ),
            tabBuilder: (context, index) {
              return SafeArea(
                child: CupertinoTabView(
                  builder: (context) {
                    return Column(
                      children: [
                        Consumer<HomeProvider>(
                          builder: (BuildContext context, HomeProvider homeProvider, Widget? child) {
                            return Column(
                              children: [
                                CupertinoSegmentedControl(
                                  groupValue: homeProvider.sindex,
                                  children: {
                                    1: Text("One"),
                                    2: Text("Two"),
                                  },
                                  onValueChanged: (value) {
                                    homeProvider.sindex = value;
                                    homeProvider.notifyListeners();
                                    print("value $value");
                                  },
                                ),
                                CupertinoSlidingSegmentedControl(
                                  groupValue: homeProvider.sindex,
                                  children: {
                                    1: Text("One"),
                                    2: Text("Two"),
                                  },
                                  onValueChanged: (value) {
                                    homeProvider.sindex = value ?? 1;
                                    homeProvider.notifyListeners();
                                  },
                                ),

                              ],
                            );
                          },
                        ),
                        Consumer<HomeProvider>(
                          builder: (BuildContext context, HomeProvider homeProvider, Widget? child) {
                            return CupertinoSlider(
                              value: homeProvider.sliderData,
                              onChanged: (value) {
                                homeProvider.changeSlider(value);
                              },
                            );
                          },
                        ),
                        Text("Hello $index"),
                      ],
                    );
                  },
                ),
              );
            },
          ));
        }
      },
    );
  }
}
