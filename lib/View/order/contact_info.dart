import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import '../../Add_Anonnce/annonce_as_login.dart';
import '../../Model/ability.dart';
import '../../varia_ble/variable.dart';
import '../page/auth/Login/components/body.dart';
import '../page/auth/Login/login_screen.dart';
import 'order_distination.dart';
import 'order_distination.dart';
import 'order_distination.dart';

class ContactInfo extends StatefulWidget {
  String? Property_details;
  String? categorie;
  String? statut;
  String? adress;
  String? region_1;
  // String? ville;
  String? quartier;
  int? bedroms;
  int? bathrooms;
  int? kichens;
  var ablity;

  String? area;
  String? price;

  String? age;
  String? flooring;

  ContactInfo({
    this.Property_details,
    this.categorie,
    this.statut,
    this.adress,
    this.region_1,
    //this.ville,
    this.quartier,
    this.bedroms,
    this.bathrooms,
    this.kichens,
    this.ablity,
    this.city,
    this.age,
    this.price,
    this.flooring,
    this.area,
  });

  String? value;
  String? city;
  @override
  State<ContactInfo> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  List<Ability> allAbility = [];
  var _key_Contact = GlobalKey<FormState>();
  var _titel = TextEditingController();
  var _description = TextEditingController();
  var _phone1 = TextEditingController();
  var _phone2 = TextEditingController();
  var _phone3 = TextEditingController();
  // String ?base64string;
  List<File> _image = [];
  //final picker = ImagePicker();

  final ImagePicker imgpicker = ImagePicker();
  String imagepath = "";

  //late Future<File> file;
  String status = '';
  String? base64Image;
  File? tmpFile;
  String error = 'Error';
  File? _file;
  List<File> _listimage = [];
  List<String> _listimagebase64 = [];
//   Future chooseImage() async {
//
//       final myfile = await ImagePicker().pickImage(source: ImageSource.gallery)   ;
// setState(() {
//   _file=File(myfile!.path) ;
//   upload();
// });
//   }

  choseImage() async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile == null) return;
      final imageTemporary = File(pickedFile.path);
      setState(() {
        _file = imageTemporary;
        _listimage.add(_file!);
        _listimagebase64.add(base64Encode(_file!.readAsBytesSync()));
      });
    } catch (e) {
      print(e);
    }

    // _image.add(File(pickedFile?.path));
    // _listimage.add(File(pickedFile!.path));
    // _listimagebase64.add(base64Encode(_file!.readAsBytesSync()));

    //if (pickedFile!.path == null) retrieveLostData();
  }

  Future<void> retrieveLostData() async {
    final LostData response = await ImagePicker().getLostData();
    if (response.isEmpty) {}
    if (response.exception != null) {
      setState(() {
        _listimage.add(File(response.file!.path));
        _listimagebase64.add(base64Encode(_file!.readAsBytesSync()));
      });
    } else {
      print(response.file);
    }
  }

// Future upload() async{
//         if(_file==null)
//           return;
//       base64Image=base64Encode(_file!.readAsBytesSync());
//         imagepath=_file!.path.split("/").last;
//
//     //upload(fileName);
//   }

  // openImage() async {
  //   try {
  //     var pickedFile = await picker.getImage(source: ImageSource.gallery);
  //     //you can use ImageCourse.camera for Camera capture
  //     if (pickedFile != null) {
  //       imagepath = pickedFile.path;
  //       print(imagepath);
  //       //output /data/user/0/com.example.testapp/cache/image_picker7973898508152261600.jpg
  //
  //       File imagefile = File(imagepath); //convert Path to File
  //       Uint8List imagebytes = await imagefile.readAsBytes(); //convert to bytes
  //        base64string =
  //           base64.encode(imagebytes); //convert bytes to base64 string
  //       print("test");
  //       //a=base64string;
  //       print(base64string);
  //       /* Output:
  //             /9j/4Q0nRXhpZgAATU0AKgAAAAgAFAIgAAQAAAABAAAAAAEAAAQAAAABAAAJ3
  //             wIhAAQAAAABAAAAAAEBAAQAAAABAAAJ5gIiAAQAAAABAAAAAAIjAAQAAAABAAA
  //             AAAIkAAQAAAABAAAAAAIlAAIAAAAgAAAA/gEoAA ... long string output
  //             */
  //
  //       Uint8List decodedbytes = base64.decode(base64string!);
  //       //decode base64 stirng to bytes
  //
  //       setState(() {});
  //     } else {
  //       print("No image is selected.");
  //     }
  //   } catch (e) {
  //     print("error while picking file.");
  //   }
  // }

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
  //     print(response.file);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    print("base64");
    print(_listimagebase64);
    // print(widget.ablity.toString());
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
            child: ListView(children: [
              Column(
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
                            SizedBox(
                              height: 100.h,
                              child: SingleChildScrollView(
                                scrollDirection:  Axis.horizontal,
                                child: Row(children: [
                                  Card(
                                      color: Colors.cyan,
                                      child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              choseImage();
                                              print(
                                                  "adzgdsjhfgshdfvbsd,gfbdgng");
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.add_photo_alternate_rounded,
                                            color: Colors.black,
                                          ))),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: _listimage.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, i) {
                                        return SizedBox(
                                          height: 75,
                                          child: Row(children: [
                                            Image.file(
                                              _listimage[i],
                                              width: 70,
                                              height: 70,
                                              fit: BoxFit.cover,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            )
                                          ]),
                                        );
                                      }),
                                ]),
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
                            print(widget.city);
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
                                isCamindingfrom = true;
                                //  Get.to(LoginScreen());
                                isLogin == false
                                    ? Get.to(LoginScreen(
                                        region_id: widget.region_1,
                                        city_id: widget.city,
                                        transaction: "Rent",
                                        property_type: widget.Property_details,
                                        status: widget.statut,
                                        adress: widget.adress,
                                        quartier: widget.quartier,
                                        area: widget.area,
                                        price: widget.price,
                                        age: widget.age,
                                        floor_type: "appartoment",
                                        floor: "4",
                                        apartment: "1",
                                        bedrooms: widget.bedroms,
                                        bathrooms: widget.bathrooms,
                                        kitchens: widget.kichens,
                                        title: _titel.text,
                                        description: _description.text,
                                        phone1: _phone1.text,
                                        abilities: widget.ablity,
                                        media: ''))
                                    : Annonce_As_Login
                                        .Add_Annonce_As_Aredy_Login(
                                        region_id: widget.region_1,
                                        city_id: widget.city,
                                        transaction: "Rent",
                                        property_type: widget.Property_details,
                                        status: widget.statut,
                                        adress: widget.adress,
                                        quartier: widget.quartier,
                                        area: widget.area,
                                        price: widget.price,
                                        age: widget.age,
                                        apartment: "1",
                                        bedrooms: widget.bedroms.toString(),
                                        bathrooms: widget.bathrooms.toString(),
                                        kitchens: widget.kichens.toString(),
                                        title: _titel.text,
                                        description: _description.text,
                                        phone1: _phone1.text,
                                        abilities: "1,2,4",
                                        media: '',
                                        floor_type: "appartoment",
                                        floor: "4",
                                      );
                                // postdata(
                                //     address: widget.adress,
                                //     floor_type: "appartoment",
                                //     title: _titel.text,
                                //     media:base64Image,
                                //     bathrooms: "2",
                                //     transaction: "Rent",
                                //     status: widget.statut,
                                //     confirmation_password: "12345678",
                                //     kitchens: "4",
                                //     area: "120",
                                //     abilities:'1',
                                //     floor: "3",
                                //     region_id: '1',
                                //     city_id: "3",
                                //     email: "abde5@gmail.com",
                                //     phone1: _phone1.text,
                                //     phone3: _phone3.text,
                                //     bedrooms: '2',
                                //     apartment: "4",
                                //     description: _description.text,
                                //     name: "ahmed",
                                //     phone2: _phone2.text,
                                //     property_type: widget.Property_details,
                                //     age: widget.age,
                                //     price:"15000",
                                //     quartier: widget.quartier,
                                //     password: "12345678"
                                //
                                // );
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

  postdata(
      {required String? region_id,
      required String? city_id,
      required String? transaction,
      required String? property_type,
      required String? status,
      required String? address,
      required String? quartier,
      required String? area,
      required String? price,
      required String? age,
      required String? floor_type,
      required String? floor,
      required String? apartment,
      required String? bedrooms,
      required String? bathrooms,
      required String? kitchens,
      required String? title,
      required String? description,
      required String? phone1,
      required String? phone2,
      required String? name,
      required String? email,
      required String? password,
      required String? confirmation_password,
      required abilities,
      required media,
      String? phone3}) async {
    try {
      var response = await http.post(
          Uri.parse(
              'https://dashboard.royaimmo.ma/api/annonce/storeWithRegister'),
          body: {
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
            "phone3": phone3,
            "name": name,
            "email": email,
            "password": password,
            "confirmation_password": confirmation_password,
            "abilities[id]": abilities,
            "media[image base64]": media,
          });
      print(response.body);
      if (response.statusCode == 200) {
        print("test" + response.body);
      }
    } catch (e) {
      print('error ' + e.toString());
    }
  }
}
