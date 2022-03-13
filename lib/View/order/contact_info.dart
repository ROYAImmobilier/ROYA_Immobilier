import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart' as Path;
import 'package:image_picker/image_picker.dart';

class ContactInfo extends StatefulWidget {
  @override
  State<ContactInfo> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  List<File> _image = [];
  final picker = ImagePicker();

  choseImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      // _image.add(File(pickedFile?.path));
      _image.add(File(pickedFile!.path));
    });
    if (pickedFile!.path == null) retrieveLostData();
  }

  Future<void> retrieveLostData() async {
    final LostData response = await picker.getLostData();
    if (response.isEmpty) {}
    if (response.exception != null) {
      setState(() {
        _image.add(File(response.file!.path));
      });
    } else {
      print(response.file);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu_outlined,
                  color: Colors.black,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
        ],
        leading: const Icon(
          Icons.check_circle_rounded,
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                          alignment: Alignment.topLeft, child: Text('Title :')),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        //  controller: title,
                        decoration: const InputDecoration(
                          // labelText: "",
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                          alignment: Alignment.topLeft,
                          child: Text('Description :')),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        maxLines: 3,
                        //  controller: title,
                        decoration: const InputDecoration(
                          // labelText: "",
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                          alignment: Alignment.topLeft,
                          child: Text('Phone 1 :')),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        maxLength: 10,
                        //  controller: title,
                        decoration: const InputDecoration(
                          // labelText: "",
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                          alignment: Alignment.topLeft,
                          child: Text('Phone 2 :')),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        maxLength: 10,
                        //  controller
                        //: title,
                        decoration: const InputDecoration(
                          // labelText: "",
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                          alignment: Alignment.topLeft,
                          child: Text('Phone 3 :')),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        maxLength: 10,
                        //  controller: title,
                        decoration: const InputDecoration(
                          // labelText: "",
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                          alignment: Alignment.topLeft,
                          child: Text('Upload image(jpg-png-jpeg')),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          //selected img
                          setState(() {
                            choseImage();
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: _image.length == 0
                              ? Container(
                                  alignment: Alignment.topLeft,
                                  child: Image.asset(
                                    'assets/images/select.png',
                                    height: 50,
                                    width: 50,
                                  ),
                                )
                              : Container(
                                  height: 60,
                                  // width: 60,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: FileImage(_image[0]))),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    color: Color(0xffbfa280),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(12),
                        side: BorderSide(color: Color(0xE2DDD9))),
                    onPressed: () {},
                    child: Text(
                      "Precedent",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(12)),
                    onPressed: () {},
                    child: Text(
                      "Reservez ",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    color: Color(0xffbfa280),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
