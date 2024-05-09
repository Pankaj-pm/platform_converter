// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/controller/main_provider.dart';
import 'package:provider/provider.dart';

class HomeNew extends StatefulWidget {
  const HomeNew({super.key});

  @override
  State<HomeNew> createState() => _HomeNewState();
}

class _HomeNewState extends State<HomeNew> {
  @override
  Widget build(BuildContext context) {
    var isAndroid = Provider.of<MainProvider>(context, listen: false).isAndroid;

    if (isAndroid) {
      return Scaffold(
        body: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Hello Android"),
            Consumer<MainProvider>(
              builder: (BuildContext context, MainProvider mainProvider, Widget? child) {
                return Switch(
                  value: mainProvider.isAndroid,
                  onChanged: (value) {
                    mainProvider.changePlatform(value);
                  },
                );
              },
            ),
            CupertinoActivityIndicator(),
            Slider.adaptive(value: 0.5, onChanged: (value) {

            },),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "contact_page");
                },
                child: Text("Contact Page"))
          ],
        )),
      );
    } else {
      return CupertinoPageScaffold(
        child: CustomScrollView(
          slivers: [
            CupertinoSliverNavigationBar(
              largeTitle: Text("Ios"),
              leading: Icon(Icons.ac_unit),
              stretch: false,
              middle: Text("Android"),
              alwaysShowMiddle: false,
              trailing: Consumer<MainProvider>(
                builder: (BuildContext context, MainProvider mainProvider, Widget? child) {
                  return CupertinoSwitch(
                    value: mainProvider.isAndroid,
                    onChanged: (value) {
                      mainProvider.changePlatform(value);
                    },
                  );
                },
              ),
            ),
            SliverFillRemaining(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  CupertinoListSection(
                    header: Text("Single selection".toUpperCase()),
                    footer: Text("Single Item".toUpperCase()),
                    children: [
                      CupertinoListTile(
                        title: Text("Off"),
                        trailing: Icon(CupertinoIcons.check_mark),
                      ),
                      CupertinoListTile(
                        title: Text("WIFI"),
                        trailing: Icon(CupertinoIcons.check_mark),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        // child: Column(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        // Text("Hello ios"),
        // Consumer<MainProvider>(
        //   builder: (BuildContext context, MainProvider mainProvider, Widget? child) {
        //     return CupertinoSwitch(
        //       value: mainProvider.isAndroid,
        //       onChanged: (value) {
        //         mainProvider.changePlatform(value);
        //       },
        //     );
        //   },
        // ),
        // CupertinoActivityIndicator(),
        // CupertinoButton.filled(
        //   child: Text("Ok"),
        //   onPressed: () {},
        // )
        //   ],
        // ),
      );
    }
  }
}
