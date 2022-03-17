import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:roya_immobilie/Model/repositery.dart';

import '../../Model/city.dart';
import '../../Model/cityrepo.dart';
import '../../varia_ble/variable.dart';
import '../page/Home/widget/drawerpage.dart';
import 'order_details.dart';

class Add_Annonce extends StatefulWidget {
  var data;
  int long;

  Add_Annonce({required this.data, required this.long});

  @override
  State<Add_Annonce> createState() => _Add_AnnonceState();
}

class _Add_AnnonceState extends State<Add_Annonce> {
  var adresse;
  var quartier;
  @override
  Widget build(BuildContext context) {
    late List<City> _users;
    late bool _loading;
    @override
    void initState() {
      super.initState();
      _loading = true;
      Services.getUsers().then((users) {
        setState(() {
          _users = users!;
          _loading = false;
        });
      });
    }

    return ScreenUtilInit(
      builder: () => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: const Text(
              "hh",
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
          ),
          body: ListView(children: [
            Container(
              height: 30,
              color: const Color(0xffefefef),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(
                  top: 15.h, bottom: 15.h, left: 15.w, right: 15.w),
              // margin: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Directionality(
                      textDirection: locale == 'fr'
                          ? TextDirection.ltr
                          : TextDirection.rtl,
                      child: Text(
                        "Property details".tr,
                        style: TextStyle(
                            fontSize: 14.sp, color: Color(0xffbfa280)),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 3,
                        groupValue: 0,
                        onChanged: (value) {},
                      ),
                      Text('Vente'.tr,
                          style: TextStyle(
                            fontSize: 14.sp,
                          )),
                      SizedBox(
                        width: 10.w,
                      ),
                      Radio(
                        value: 3,
                        groupValue: 0,
                        onChanged: (value) {},
                      ),
                      Text('À location'.tr,
                          style: TextStyle(
                            fontSize: 14.sp,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text('Catégorie'.tr,
                          style: TextStyle(
                            fontSize: 14.sp,
                          ))),
                  SizedBox(
                    height: 15.h,
                  ),
                  TextFormField(
                    //controller: ,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                        isDense: true, // Added this
                        contentPadding: EdgeInsets.only(
                            top: 8.h, bottom: 8.h, right: 8.w, left: 8.w),
                        //fillColor: Colors.white,
                        // labelText: "",
                        hintText: 'select property'.tr,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 3),
                            borderRadius: BorderRadius.circular(5.r))),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text('Statut'.tr,
                          style: TextStyle(
                            fontSize: 14.sp,
                          ))),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                      height: 35.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5.r)),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: DropdownButton<String>(
                        icon: const Icon(Icons.keyboard_arrow_down_sharp),
                        // iconSize: 30,
                        // style: const TextStyle(
                        //   color: Colors.black54,
                        //   fontSize: 16,
                        // ),
                        elevation: 16,
                        isExpanded: true,
                        hint: Text('Select State'),
                        underline: Container(
                          height: 2.h,
                          // color: Colors.deepPurpleAccent,
                        ),
                        //  value: dropdownValue,

                        items: <String>['One', 'Two', 'Free', 'Four']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text("  $value"),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {},
                      )),
                  SizedBox(
                    height: 25.h,
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text('Location'.tr,
                          style: TextStyle(
                              color: Color(0xffbfa280), fontSize: 14.sp))),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text('Adresse'.tr,
                          style: TextStyle(
                            fontSize: 14.sp,
                          ))),
                  SizedBox(
                    height: 15.h,
                  ),
                  TextFormField(
                    controller: adresse,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                        isDense: true, // Added this
                        contentPadding: EdgeInsets.all(8),
                        //fillColor: Colors.white,
                        // labelText: "",
                        hintText: 'Adresse'.tr,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 3.w),
                            borderRadius: BorderRadius.circular(5))),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text('Region'.tr,
                          style: TextStyle(
                            fontSize: 14.sp,
                          ))),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    height: 35.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: DropdownButton<String>(
                      icon: const Icon(Icons.keyboard_arrow_down_sharp),
                      elevation: 16,
                      isExpanded: true,
                      // style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2.h,
                        // color: Colors.deepPurpleAccent,
                      ),
                      value: "One",
                      items: <String>['One', 'Two', 'Free', 'Four']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text("  $value"),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {},
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text('Ville'.tr,
                          style: TextStyle(
                            fontSize: 14.sp,
                          ))),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    height: 35.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5.r)),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: DropdownButton<String>(
                      icon: const Icon(Icons.keyboard_arrow_down_sharp),
                      elevation: 16,
                      isExpanded: true,
                      // style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        // color: Colors.deepPurpleAccent,
                      ),
                      value: "One",
                      items: <String>['One', 'Two', 'Free', 'Four']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text("  $value"),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {},
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text('Quartier'.tr,
                          style: TextStyle(
                            fontSize: 14.sp,
                          ))),
                  SizedBox(
                    height: 15.h,
                  ),
                  TextFormField(
                    controller: quartier,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                        isDense: true, // Added this
                        contentPadding: EdgeInsets.all(8),
                        //fillColor: Colors.white,
                        // labelText: "",
                        hintText: 'Adresse'.tr,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 3.w),
                            borderRadius: BorderRadius.circular(5.r))),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Add_Annonce_2()),
                        );
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Color(0xffbfa280),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        padding: EdgeInsets.only(
                            top: 10.h, left: 25.w, bottom: 10.h, right: 25.w),
                        child: Text("Suivant".tr,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ])),
    );
  }
}
