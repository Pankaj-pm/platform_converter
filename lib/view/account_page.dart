import 'package:flutter/material.dart';
import 'package:platform_converter/view/home_new.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 200,
            title: Text("Tttt"),
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Title"),
              collapseMode: CollapseMode.none,
              background: PageView(

                children: categories_imgList.map((e) {
                  return Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      image: DecorationImage(image: NetworkImage(e), fit: BoxFit.cover),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          SliverList.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    title: Text("Main Index $index"),
                  ),
                  GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        color: Colors.black12,
                        child: Text("$index"),
                      );
                    },
                  )
                ],
              );
            },
          ),
          // SliverAppBar(
          //   pinned: true,
          //   flexibleSpace: FlexibleSpaceBar(
          //     title: Text("Title New"),
          //   ),
          // ),
          SliverGrid.count(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.blue,
              ),
              Container(
                color: Colors.yellow,
              ),
              Container(
                color: Colors.grey,
              ),
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.blue,
              ),
              Container(
                color: Colors.yellow,
              ),
              Container(
                color: Colors.grey,
              ),
            ],
          ),
          SliverGrid.extent(
            maxCrossAxisExtent: 100,
            children: [
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.blue,
              ),
              Container(
                color: Colors.yellow,
              ),
              Container(
                color: Colors.grey,
              ),
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.blue,
              ),
              Container(
                color: Colors.yellow,
              ),
              Container(
                color: Colors.grey,
              ),
            ],
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(child: Text("$index"));
            }, childCount: 3),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          ),
          SliverList.builder(
            itemCount: 6,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("New Index $index"),
              );
            },
          )
        ],
      ),
    );
  }
}
