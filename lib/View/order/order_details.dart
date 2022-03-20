import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'contact_info.dart';

class Add_Annonce_2 extends StatefulWidget {
  String? Property_details;
  String? categorie;
  String? statut;
  String? adress;
  String? region;
  String? ville;
  String? quartier;

  Add_Annonce_2(
      {required this.Property_details,
        required this.categorie,
        required this.statut,
        required this.adress,
        required this.region,
        required this.ville,
        required this.quartier});

  @override
  State<Add_Annonce_2> createState() => _Add_AnnonceState();
}

class _Add_AnnonceState extends State<Add_Annonce_2> {
  int quntity1 = 0;
  int quntity2 = 0;
  int kichens = 0;

  var dropdownValue = "dh";
  var dropdownAge = '29';
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: Text(
              ' Stepper ',
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
          ),
          body: ListView(children: [
            Container(
              height: 30.h,
              color: const Color(0xffefefef),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(
                  left: 15.w, right: 15.w, bottom: 15.h, top: 15.h),
              // margin: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      child: RichText(
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: "Area ",
                              style: TextStyle(
                                  fontSize: 13.sp, color: Colors.black)),
                          TextSpan(
                              text: "(m²)",
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold)),
                        ]),
                      )),
                  SizedBox(
                    height: 15.h,
                  ),
                  TextFormField(
                    //controller: ,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      //fillColor: Colors.white,
                      // labelText: "",
                        isDense: true, // Added this
                        contentPadding: EdgeInsets.only(
                            left: 8.w, right: 8.w, bottom: 8.h, top: 8.h),
                        hintText: '120',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 3.w),
                            borderRadius: BorderRadius.circular(5.r))),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(alignment: Alignment.topLeft, child: Text('Price')),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 35.h,
                        width: (MediaQuery.of(context).size.width * 0.6).w,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            BorderRadius.all(Radius.circular(5.r))),
                        child: TextFormField(
                          //controller: ,
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            //    isDense: true, // Added this
                              contentPadding: EdgeInsets.only(
                                  left: 8.w, right: 8.w, bottom: 8.h, top: 8.h),
                              //fillColor: Colors.white,
                              // labelText: "",
                              hintText: '25000',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 3.w),
                                  borderRadius: BorderRadius.circular(5))),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Container(
                        height: 35.h,
                        width: (MediaQuery.of(context).size.width * 0.15).w,
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
                            height: 2.h,
                            // color: Colors.deepPurpleAccent,
                          ),
                          value: dropdownValue,
                          items: <String>['dh', '\$', 'ouro', 'dinar']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text("  $value"),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Age',
                        style: TextStyle(fontSize: 14.sp),
                      )),
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
                      value: dropdownAge,

                      items: <String>['29', '28', '19', '14']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text("  $value"),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {},
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      child:
                      Text('Flooring', style: TextStyle(fontSize: 14.sp))),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 35,
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
                      value: dropdownValue,
                      items: <String>['dh', '\$', 'ouro', 'dinar']
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
                    height: 25.h,
                  ),
                  Wrap(
                    children: [
                      Column(
                        children: [
                          Text("Bedroms:", style: TextStyle(fontSize: 14.sp)),
                          Container(
                            width: 140,
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  child: Container(
                                      child: Icon(
                                        Icons.data_saver_on,
                                        size: 20.sp,
                                        color: Color(0xffbfa280),
                                      )),
                                  onTap: () {
                                    setState(() {
                                      quntity2++;
                                    });
                                  },
                                ),
                                Text(quntity2.toString(),
                                    style: TextStyle(fontSize: 14.sp)),
                                GestureDetector(
                                  child: Container(
                                    child: Icon(
                                      Icons.remove_circle_outline,
                                      size: 20.sp,
                                      color: Color(0xffbfa280),
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      if (quntity2 >= 0) {
                                        quntity2--;
                                      }
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text("Bedroms:", style: TextStyle(fontSize: 14.sp)),
                          Container(
                            width: 140,
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  child: Container(
                                      child: Icon(
                                        Icons.data_saver_on,
                                        size: 20.sp,
                                        color: Color(0xffbfa280),
                                      )),
                                  onTap: () {
                                    setState(() {
                                      quntity1++;
                                    });
                                  },
                                ),
                                Text(quntity1.toString(),
                                    style: TextStyle(fontSize: 14.sp)),
                                GestureDetector(
                                  child: Container(
                                    child: Icon(
                                      Icons.remove_circle_outline,
                                      size: 20.sp,
                                      color: Color(0xffbfa280),
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      if (quntity1 >= 0) {
                                        quntity1--;
                                      }
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text("Kitchens:", style: TextStyle(fontSize: 14.sp)),
                          Container(
                            width: 140,
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  child: Container(
                                      child: Icon(
                                        Icons.data_saver_on,
                                        size: 20.sp,
                                        color: Color(0xffbfa280),
                                      )),
                                  onTap: () {
                                    setState(() {
                                      kichens++;
                                    });
                                  },
                                ),
                                Text(quntity1.toString()),
                                GestureDetector(
                                  child: Container(
                                    child: Icon(
                                      Icons.remove_circle_outline,
                                      size: 20.sp,
                                      color: Color(0xffbfa280),
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      if (kichens >= 0) {
                                        kichens--;
                                      }
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          )
                        ],
                      )
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.r),
                      ),
                      color: Color.fromARGB(255, 213, 215, 219),
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 8.0.w, top: 8.h, right: 8.w, bottom: 8.h),
                      child: MaterialButton(
                        onPressed: () {},
                        color: Color.fromARGB(255, 175, 178, 206),
                        child: Text('Main Abilites',
                            style: TextStyle(fontSize: 14.sp)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Color.fromARGB(255, 213, 215, 219),
                    ),
                    width: double.infinity,
                    // color: Color.fromARGB(255, 213, 215, 219),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 8.0.w, top: 8.h, right: 8.w, bottom: 8.h),
                      child: MaterialButton(
                        onPressed: () {},
                        color: Color.fromARGB(255, 175, 178, 206),
                        child: Text('Main Abilites',
                            style: TextStyle(fontSize: 14.sp)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.r),
                      ),
                      color: Color.fromARGB(255, 213, 215, 219),
                    ),
                    width: double.infinity,
                    //color: Color.fromARGB(255, 213, 215, 219),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: MaterialButton(
                        onPressed: () {},
                        color: Color.fromARGB(255, 175, 178, 206),
                        child: Text('Main Abilites',
                            style: TextStyle(fontSize: 14.sp)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Color(0xffbfa280),
                                borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                            padding: EdgeInsets.only(
                                top: 10, left: 25, bottom: 10, right: 25),
                            child: Text(
                              "Précédent",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14.sp),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return ContactInfo();
                                }));
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Color(0xffbfa280),
                                borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                            padding: EdgeInsets.only(
                                top: 10.h,
                                left: 25.w,
                                bottom: 10.h,
                                right: 25.w),
                            child: Text(
                              "Suivant",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14.sp),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ])),
    );
  }
}