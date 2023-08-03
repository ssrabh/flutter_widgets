import 'package:flutter/material.dart';
import 'package:flutter_widgets/presentation/screens/bottomappbar/page1.dart';
import 'package:flutter_widgets/presentation/screens/bottomappbar/page2.dart';
import 'package:flutter_widgets/presentation/screens/bottomappbar/page3.dart';

class MyBottomAppBar extends StatefulWidget {
  const MyBottomAppBar({super.key});

  @override
  State<MyBottomAppBar> createState() => _MyBottomAppBarState();
}

class _MyBottomAppBarState extends State<MyBottomAppBar> {
  int currentIndex = 0;
  List<Widget> pages = const [
    Page1(),
    Page2(),
    Page3(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueGrey,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        selectedFontSize: 20,
        unselectedFontSize: 16,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt), label: "Images"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Page 2"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Page 3"),
        ],
      ),
    );
  }
}
