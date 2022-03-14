import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return ScreenUtilInit(
      builder: () => Scaffold(
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
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
          ],
          leading: const Icon(
            Icons.check_circle_rounded,
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 30.h,
                  color: const Color(0xffefefef),
                ),
                Container(
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 12.w, right: 12.w, top: 15.h),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Title :',
                                style: TextStyle(fontSize: 13.sp),
                              )),
                          SizedBox(
                            height: 15.h,
                          ),
                          TextFormField(
                            //  controller: title,
                            decoration: const InputDecoration(
                              isDense: true, // Added this
                              contentPadding: EdgeInsets.only(
                                  left: 8, right: 8, bottom: 8, top: 8),
                              // labelText: "",
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.text,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Description :',
                                style: TextStyle(fontSize: 13.sp),
                              )),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            maxLines: 3,
                            //  controller: title,
                            decoration: const InputDecoration(
                              isDense: true, // Added this
                              contentPadding: EdgeInsets.only(
                                  left: 8, right: 8, bottom: 8, top: 8),
                              // labelText: "",
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.text,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Phone 1 :',
                                style: TextStyle(fontSize: 13.sp),
                              )),
                          SizedBox(
                            height: 15.h,
                          ),
                          TextFormField(
                            maxLength: 10,
                            //  controller: title,
                            decoration: const InputDecoration(
                              isDense: true, // Added this
                              contentPadding: EdgeInsets.only(
                                  left: 8, right: 8, bottom: 8, top: 8),
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
                              child: Text(
                                'Phone 2 :',
                                style: TextStyle(fontSize: 13.sp),
                              )),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            maxLength: 10,
                            //  controller
                            //: title,
                            decoration: const InputDecoration(
                              isDense: true, // Added this
                              contentPadding: EdgeInsets.only(
                                  left: 8, right: 8, bottom: 8, top: 8),
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
                              child: Text(
                                'Phone 3 :',
                                style: TextStyle(fontSize: 13.sp),
                              )),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            maxLength: 10,
                            //  controller: title,
                            decoration: const InputDecoration(
                              isDense: true, // Added this
                              contentPadding: EdgeInsets.only(
                                  left: 8, right: 8, bottom: 8, top: 8),
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
                              child: Text(
                                'Upload image(jpg-png-jpeg)',
                                style: TextStyle(fontSize: 13.sp),
                              )),
                          SizedBox(
                            height: 10.h,
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
                                        height: 50.h,
                                        width: 50.w,
                                      ),
                                    )
                                  : Container(
                                      height: 60.h,
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
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MaterialButton(
                        color: const Color(0xffbfa280),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            side: const BorderSide(color: Color(0xE2DDD9))),
                        onPressed: () {},
                        child: Text(
                          "Precedent",
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r)),
                        onPressed: () {},
                        child: Text(
                          "Reservez ",
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.white,
                          ),
                        ),
                        color: const Color(0xffbfa280),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
