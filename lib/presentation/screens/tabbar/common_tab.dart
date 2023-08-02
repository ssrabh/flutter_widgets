import 'package:flutter/material.dart';
import 'package:flutter_widgets/presentation/screens/tabbar/common_tab2.dart';

class CommonTab extends StatelessWidget {
  const CommonTab(
      {super.key, required this.tabtitle, required this.tabtitleBody});
  final List<String> tabtitle;
  final List<Widget> tabtitleBody;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabtitle.length,
      child: Column(
        children: [
          Container(
            height: 60,
            child: TabBar(
                tabs: tabtitle
                    .map((title) => Tab(
                          text: title,
                        ))
                    .toList()),
          ),
          Expanded(child: TabBarView(children: tabtitleBody))
        ],
      ),
    );
  }
}

class UseCommonTab extends StatefulWidget {
  const UseCommonTab({super.key});

  @override
  State<UseCommonTab> createState() => _UseCommonTabState();
}

class _UseCommonTabState extends State<UseCommonTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: CommonTab(tabtitle: [
          "Tab 1",
          "Tab 2"
        ], tabtitleBody: [
          Center(
            child: Text("Tab Page 1"),
          ),
          Center(
            child: Text("Tab Page 2"),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Text("Next"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const UseCommonTab2(),
              ),
            );
          }),
    );
  }
}
