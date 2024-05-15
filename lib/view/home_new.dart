// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/controller/home_provider.dart';
import 'package:platform_converter/controller/main_provider.dart';
import 'package:platform_converter/view/account_page.dart';
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
        // appBar: AppBar(),
        body: PageView(
          controller: Provider.of<HomeProvider>(context, listen: false).pageController,
          onPageChanged: (value) {
            Provider.of<HomeProvider>(context, listen: false).changePage(value);

            print("onPageChanged $value");
          },
          children: [
            Center(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Hello Android"),
                CupertinoContextMenu(
                  actions: [
                    CupertinoContextMenuAction(child: Text("Option 1")),
                    CupertinoContextMenuAction(
                      child: Text(
                        "Option 2",
                      ),
                      isDestructiveAction: true,
                      trailingIcon: Icons.settings,
                    ),
                  ],
                  child: Container(
                    height: 50,
                    width: 50,
                    child: Image.network(
                        "https://t3.ftcdn.net/jpg/06/58/66/44/240_F_658664405_wpyvdrOTz7bkXMu0Et6yghSGXSbetOJr.jpg"),
                  ),
                ),
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
                Slider.adaptive(
                  value: 0.5,
                  onChanged: (value) {},
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "contact_page");
                    },
                    child: Text("Contact Page")),
                ElevatedButton(
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        cancelText: "No",
                        initialEntryMode: DatePickerEntryMode.calendarOnly,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2050),
                      );
                    },
                    child: Text("showDatePicker")),
                MyButton(),
                Container(
                    height: 200,
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.monthYear,
                      onDateTimeChanged: (value) {

                      },
                    )),
              ],
            )),
            SettingPage(),
            AccountPage(),
            Container(
              color: Colors.yellow,
            )
          ],
        ),
        bottomNavigationBar: Consumer<HomeProvider>(
          builder: (BuildContext context, HomeProvider homeProvider, Widget? child) {
            return BottomNavigationBar(
              currentIndex: homeProvider.bi,
              type: BottomNavigationBarType.fixed,
              onTap: (value) {
                homeProvider.changePage(value);
                homeProvider.pageController.animateToPage(
                  value,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.linear,
                );
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
                BottomNavigationBarItem(icon: Icon(Icons.add_shopping_cart), label: "Cart"),
              ],
            );
          },
        ),
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

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

List<String> categories_imgList = [
  "https://t3.ftcdn.net/jpg/06/80/59/22/240_F_680592284_vrPfc4XoN5qNQrglRTUq6jSRYMSITe1j.jpg",
  "https://t3.ftcdn.net/jpg/06/58/66/44/240_F_658664405_wpyvdrOTz7bkXMu0Et6yghSGXSbetOJr.jpg",
  "https://t4.ftcdn.net/jpg/06/07/63/93/240_F_607639390_etp901wefYfw9ZM7t4boQFyLGVjqL00F.jpg",
  "https://t3.ftcdn.net/jpg/06/02/88/04/240_F_602880464_XAEd9P4Gop32xUHYp4SaxzX1k2s7Zgkt.jpg",
  "https://t4.ftcdn.net/jpg/07/58/62/91/240_F_758629118_97bYr1ErNqK20LLEkNbVjeAWC2mdN2GC.jpg",
  "https://t4.ftcdn.net/jpg/04/96/57/09/240_F_496570938_wLDb0QuqWJ4MbURBuJzAyLrSoE2bNe8q.jpg",
  "https://t3.ftcdn.net/jpg/07/54/78/28/240_F_754782818_2qi2ggCm8tkpXOy3eJCZDxN9Z5ZCidP2.jpg",
];

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 250,
        margin: EdgeInsets.only(top: 50, right: 10, left: 10),
        child: Stack(
          children: [
            PageView(
              controller: Provider.of<HomeProvider>(context, listen: false).pageController1,
              onPageChanged: (value) {
                Provider.of<HomeProvider>(context, listen: false).changeSliderIndex(value);
              },
              children: categories_imgList.map((e) {
                return Container(
                  margin: EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(image: NetworkImage(e), fit: BoxFit.cover),
                  ),
                );
              }).toList(),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Consumer<HomeProvider>(
                builder: (BuildContext context, HomeProvider homeProvider, Widget? child) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(categories_imgList.length, (index) {
                      bool isSelected = index == homeProvider.sliderIndex;
                      return Icon(
                        isSelected ? Icons.circle : Icons.circle_outlined,
                        color: isSelected ? Colors.blue : Colors.grey,
                        size: isSelected ? 18 : 13,
                      );
                    }),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              showBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    color: Colors.blue,
                    child: Text("Hello"),
                    height: 200,
                    width: double.infinity,
                  );
                },
              );
            },
            child: Text("showBottomSheet new")),
        ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                isDismissible: false,
                enableDrag: false,
                builder: (context) {
                  return Container(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                    decoration: BoxDecoration(
                        color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(50))),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("Title"),
                              Spacer(),
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(Icons.close))
                            ],
                          ),
                          TextFormField(
                            decoration: InputDecoration(hintText: "Name"),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(decoration: InputDecoration(hintText: "last name")),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(decoration: InputDecoration(hintText: "email")),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(decoration: InputDecoration(hintText: "pass")),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(decoration: InputDecoration(hintText: "mobile no")),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(decoration: InputDecoration(hintText: "Address")),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(decoration: InputDecoration(hintText: "mobile no")),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(decoration: InputDecoration(hintText: "Address")),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(onPressed: () {}, child: Text("Save"))
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Text("showModalBottomSheet")),
      ],
    );
  }
}


