import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
// file extension
  String? ext;

  // pick any file via using file_picker
  String? filePath;

  Future<void> pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        setState(() {
          filePath = result.files.single.path;
          ext = filePath!.split('.').last.toLowerCase();
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    var hyt = MediaQuery.of(context).size.height;
    var wth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(8),
              height: hyt / 2,
              width: wth,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all()),
              child: ElevatedButton(
                  onPressed: () {
                    pickFile();
                  },
                  child: const Text("Select")),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text("Description :"),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: ext != null
                        ? Text("Selected file extension is : $ext")
                        : const Text("Select File First")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
