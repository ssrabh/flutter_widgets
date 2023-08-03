import 'package:flutter/material.dart';
import 'package:flutter_widgets/presentation/screens/bottomappbar/default_bottomapp.dart';
import 'package:flutter_widgets/presentation/screens/tabbar/defualt_tab.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyTab(),
      home: const MyBottomAppBar(),
    );
  }
}
