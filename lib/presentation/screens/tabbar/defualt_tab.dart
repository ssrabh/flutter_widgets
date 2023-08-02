import 'package:flutter/material.dart';
import 'package:flutter_widgets/presentation/screens/tabbar/custom_tab.dart';

class MyTab extends StatefulWidget {
  const MyTab({super.key});

  @override
  State<MyTab> createState() => _MyTabState();
}

class _MyTabState extends State<MyTab> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          title: const Text("Way One"),
          bottom: const TabBar(tabs: [
            Tab(
              text: "tab 1",
            ),
            Tab(
              text: "tab 2",
            ),
          ]),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyTabTwo()));
                },
                child: const Text("Next")),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        body: const TabBarView(
          children: [
            Center(child: Text("Tab Page 1")),
            Center(child: Text("Tab page 2")),
          ],
        ),
      ),
    );
  }
}
