import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:path/path.dart' as Path;
import 'package:image_picker/image_picker.dart';

import '../page/auth/Login/components/body.dart';
import '../page/auth/Login/login_screen.dart';

class ContactInfo extends StatefulWidget {
  String? Property_details;
  String? categorie;
  String? statut;
  String? adress;
  String? region_1;
  String? ville;
  String? quartier;
  int bedroms;
  int bathrooms;
  int kichens;

  String? area;
  String? price;

  String? age;
  String? flooring;


  ContactInfo({
    required this.Property_details,
    required this.categorie,
    required this.statut,
    required this.adress,
    required this.region_1,
    required this.ville,
    required this.quartier,
    required this.bedroms,
    required this.bathrooms,
    required this.kichens,
    required this.value,
    required this.city,
    required this.age,
    required this.price, required this.flooring, required this.area,
  });

  String? value;
  String? city;
  @override
  State<ContactInfo> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  var _key_Contact = GlobalKey<FormState>();
  var _titel = TextEditingController();
  var _description = TextEditingController();
  var _phone1 = TextEditingController();
  var _phone2 = TextEditingController();
  var _phone3 = TextEditingController();
  String ?base64string;
  List<File> _image = [];
  final picker = ImagePicker();

  final ImagePicker imgpicker = ImagePicker();
  String imagepath = "";

  openImage() async {
    try {
      var pickedFile = await picker.getImage(source: ImageSource.gallery);
      //you can use ImageCourse.camera for Camera capture
      if (pickedFile != null) {
        imagepath = pickedFile.path;
        print(imagepath);
        //output /data/user/0/com.example.testapp/cache/image_picker7973898508152261600.jpg

        File imagefile = File(imagepath); //convert Path to File
        Uint8List imagebytes = await imagefile.readAsBytes(); //convert to bytes
         base64string =
            base64.encode(imagebytes); //convert bytes to base64 string
        print("test");
        //a=base64string;
        print(base64string);
        /* Output:
              /9j/4Q0nRXhpZgAATU0AKgAAAAgAFAIgAAQAAAABAAAAAAEAAAQAAAABAAAJ3
              wIhAAQAAAABAAAAAAEBAAQAAAABAAAJ5gIiAAQAAAABAAAAAAIjAAQAAAABAAA
              AAAIkAAQAAAABAAAAAAIlAAIAAAAgAAAA/gEoAA ... long string output
              */

        Uint8List decodedbytes = base64.decode(base64string!);
        //decode base64 stirng to bytes

        setState(() {});
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking file.");
    }
  }

  // choseImage() async {
  //   final pickedFile = await picker.getImage(source: ImageSource.gallery);
  //   setState(() {
  //     // _image.add(File(pickedFile?.path));
  //     _image.add(File(pickedFile!.path));
  //   });
  //   if (pickedFile!.path == null) retrieveLostData();
  // }
  //
  // Future<void> retrieveLostData() async {
  //   final LostData response = await picker.getLostData();
  //   if (response.isEmpty) {}
  //   if (response.exception != null) {
  //     setState(() {
  //       _image.add(File(response.file!.path));
  //     });
  //   } else {
  //     print(response.file);
  //   }
  // }

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
        body: Form(
          key: _key_Contact,
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: ListView(
              children: [Column(
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
                              validator: (value) {
                                if (value?.length == 0) {
                                  return " Entre L \' Titel";
                                } else {
                                  return null;
                                }
                              },
                              controller: _titel,
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
                              validator: (value) {
                                if (value?.length == 0) {
                                  return " Entre L \' Description";
                                } else {
                                  return null;
                                }
                              },
                              maxLines: 3,
                              controller: _description,
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
                              validator: (value) {
                                if (value?.length == 0) {
                                  return " Entre L \' Phone";
                                } else {
                                  return null;
                                }
                              },
                              maxLength: 10,
                              controller: _phone1,
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
                              controller: _phone2,
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
                              controller: _phone3,
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
                                  openImage();
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
                          onPressed: () {
                            Get.back();
                          },
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
                          onPressed: () {
                            print(widget.Property_details);
                            print(widget.categorie);
                            print(widget.statut);
                            print(widget.adress);
                            print(widget.region_1);
                            print(widget.ville);
                            print(widget.quartier);
                             print(widget.area);
                            print(widget.price);
                            print(widget.age);
                            print(widget.flooring);
                            print(widget.bedroms);
                            print(widget.bathrooms);
                            print(widget.kichens);
                            print(_titel.text);
                            print(_description.text);
                            print(_phone1.text);
                            print(_phone2.text);
                            print(_phone3.text);
                            if (_key_Contact.currentState!.validate()) {
                              // Get.to(LoginScreen());

                              setState(() {
                                // postdata(address: widget.adress,
                                //     floor_type: "", title: _titel.text, media: base64string, bathrooms: widget.bathrooms.toString(), transaction: "", status: widget.statut,
                                //      kitchens: widget.kichens.toString(), area: widget.area, abilities:" 2",
                                //     floor: widget.flooring, region_id: "1", city_id: "3", email: "abde@gmail.com", phone1: _phone1.text,
                                //     bedrooms: widget.bedroms.toString(), apartment: widget.categorie, description: _description.text,
                                //      phone2: _phone2.text, property_type: widget.Property_details,
                                //     age: widget.age, price: widget.price.toString(), quartier: widget.quartier, password: "12345678", name: "abde"
                                //
                                // );
                                postdata_1(email: "abde@gmail.com", password: "12345678");

                              });
                            }
                          },
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
            ]),
          ),
        ),
      ),
    );
  }

  postdata({required region_id,required city_id,required transaction,
    required property_type,required status,required address,required quartier,
    required area,required price,required age,required floor_type,required floor,
    required apartment,required bedrooms,required bathrooms,
    required kitchens,required title,required description,
    required phone1,required phone2,
    required name,
    required email,required password,
    //required confirmation_password,
    required abilities,required media}) async {
    try {
      var response = await http
          .post(Uri.parse('https://dashboard.royaimmo.ma/api/annonce/storeWithRegister'), body: {
        "region_id": region_id,
        "city_id": city_id,
        "transaction": transaction,
        "property_type": property_type,
        "transaction": transaction,
        "property_type": property_type,
        "status": status,
        "address": address,
        "quartier": quartier,
        "area": area,
        "price": price,
        "age": age,
        "floor_type": floor_type,
        "floor": floor,
        "apartment": apartment,
        "bedrooms": bedrooms,
        "bathrooms": bathrooms,
        "kitchens": kitchens,
        "title": title,
        "description": description,
        "phone1": phone1,
        "phone2": phone2,
        "name": name,
        "email": email,
        "password": password,
     //   "confirmation_password": confirmation_password,
        "abilities[id]": abilities,
        "media[image base64]": media,
      });
      print(response.body);
      if(response.statusCode==201){
        print("test" +response.body);
      }
    } catch (e) {
      print('error ' + e.toString());
    }
  }
}

postdata_1({
  required email,required password,
  //required confirmation_password,
 }) async {
  try {
    var response = await http
        .post(Uri.parse('https://dashboard.royaimmo.ma/api/auth/login'), body: {

      "email": email,
      "password": password,
      //   "confirmation_password": confirmation_password,

    });
    print(response.body);
    if(response.statusCode==201){
      print("test" +response.body);
    }
  } catch (e) {
    print('error ' + e.toString());
  }
}
