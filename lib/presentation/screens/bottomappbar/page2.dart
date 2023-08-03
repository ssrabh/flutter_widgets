import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  bool ss = true;
  XFile? pickFile;

  Future<void> pickedImg(ImageSource source) async {
    try {
      XFile? pickedImg = await ImagePicker().pickImage(source: source);
      if (pickedImg != null) {
        setState(() {
          pickFile = pickedImg;
          ss = false;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(border: Border.all(color: Colors.red)),
            child: ss
                ? Image.asset(
                    "assets/imgs/noimage.png",
                    fit: BoxFit.cover,
                  )
                : Image.file(File(pickFile!.path)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  pickedImg(ImageSource.camera);
                },
                icon: const Icon(Icons.camera_alt),
              ),
              IconButton(
                onPressed: () {
                  pickedImg(ImageSource.gallery);
                },
                icon: const Icon(Icons.photo_library),
              ),
            ],
          )
        ],
      )),
    );
  }
}
