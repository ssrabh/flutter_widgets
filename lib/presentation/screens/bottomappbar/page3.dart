import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  List imgUrls = [
    "https://cdn.pixabay.com/photo/2023/06/23/08/51/lord-krishna-8083043_640.png",
    "https://i.pinimg.com/originals/4e/33/6e/4e336e5b98ac95f48c8e183621f34eb3.jpg",
    "https://www.godpng.com/uploads/png/yashoda-and-shri-krishna-png.png",
    "https://i2.wp.com/godofindia.com/wp-content/uploads/2017/05/lord-krishna-36.jpg",
    "https://media.istockphoto.com/id/1054775834/photo/lord-krishna-with-radha.jpg?b=1&s=170667a&w=0&k=20&c=Hp4W1tjF6pr3J8owZ4SoTRgtsOCHHnqSO2vjnEru1mg="
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Images In List View"),
          Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: imgUrls.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Image.network(
                        "${imgUrls[index]}",
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    );
                  })),
          const Divider(),
          const Text("Images In Grid View View"),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 4, mainAxisSpacing: 4),
                itemCount: imgUrls.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Image.network(
                      imgUrls[index],
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  );
                }),
          ),
        ],
      )),
    );
  }
}
