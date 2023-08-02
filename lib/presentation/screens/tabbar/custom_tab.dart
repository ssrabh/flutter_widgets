import 'package:flutter/material.dart';
import 'package:flutter_widgets/core/themes/texttheme.dart';
import 'package:flutter_widgets/presentation/screens/tabbar/common_tab.dart';

class MyTabTwo extends StatefulWidget {
  const MyTabTwo({super.key});

  @override
  State<MyTabTwo> createState() => _MyTabTwoState();
}

class _MyTabTwoState extends State<MyTabTwo> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 100,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Way two",
                          textAlign: TextAlign.center,
                          style: MyTextStyle.h1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Back")),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const UseCommonTab()),
                              );
                            },
                            child: const Text("Next")),
                      ),
                    ],
                  ),
                  TabBar(controller: tabController, tabs: const [
                    Tab(
                      text: "Tab 1",
                    ),
                    Tab(
                      text: "Tab 2",
                    )
                  ])
                ],
              ),
            ),
            Expanded(
                child: TabBarView(controller: tabController, children: const [
              Center(child: Text("Tab page 1")),
              Center(child: Text("Tab page 2"))
            ])),
          ],
        ),
      ),
    );
  }
}
