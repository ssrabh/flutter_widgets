import 'package:flutter/material.dart';
import 'package:flutter_widgets/presentation/screens/tabbar/defualt_tab.dart';

class CommonTab2 extends StatefulWidget {
  const CommonTab2({
    super.key,
    required this.tabtitle,
    required this.tabtitlebody,
  });

  final List<String> tabtitle;
  final List<Widget> tabtitlebody;

  @override
  State<CommonTab2> createState() => _CommonTab2State();
}

class _CommonTab2State extends State<CommonTab2> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: widget.tabtitle.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: TabBar(
              controller: tabController,
              tabs: widget.tabtitle
                  .map((title) => Tab(
                        text: title,
                      ))
                  .toList()),
        ),
        Expanded(
            child: TabBarView(
                controller: tabController, children: widget.tabtitlebody)),
      ],
    );
  }
}

class UseCommonTab2 extends StatefulWidget {
  const UseCommonTab2({Key? key}) : super(key: key);

  @override
  State<UseCommonTab2> createState() => _UseCommonTab2State();
}

class _UseCommonTab2State extends State<UseCommonTab2>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: CommonTab2(
          tabtitle: ["Tab 1", "Tab 2"],
          tabtitlebody: [
            Center(
              child: Text("Tab Page 1"),
            ),
            Center(
              child: Text("Tab Page 2"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text("Home"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MyTab(),
            ),
          );
        },
      ),
    );
  }
}
