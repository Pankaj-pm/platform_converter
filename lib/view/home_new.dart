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
    var isAndroid = Provider.of<MainProvider>(context,listen: false).isAndroid;

    if(isAndroid){
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
              ],
            )),
      );
    }else{
      return CupertinoPageScaffold(
        child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Hello ios"),
                Consumer<MainProvider>(
                  builder: (BuildContext context, MainProvider mainProvider, Widget? child) {
                    return CupertinoSwitch(
                      value: mainProvider.isAndroid,
                      onChanged: (value) {
                        mainProvider.changePlatform(value);
                      },
                    );
                  },
                ),
                CupertinoActivityIndicator(),
                CupertinoButton.filled(child: Text("Ok"), onPressed: () {

                },)
              ],
            )),
      );
    }

  }
}
