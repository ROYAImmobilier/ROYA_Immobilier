import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ContactSend extends StatefulWidget {
  const ContactSend({Key? key}) : super(key: key);

  @override
  State<ContactSend> createState() => _ContactSendState();
}

class _ContactSendState extends State<ContactSend> {
 Color colorprimary = Color(0xFFDDECF2).withOpacity(0.35) ;
  var fullname = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();
  var message = TextEditingController();
  var object;
  String? _object;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back , color: Colors.blueAccent,),
        elevation: 0.0,
        backgroundColor: const Color(0xFFDDECF2).withOpacity(0.35),
        title: Center(
          child: SvgPicture.asset(
            'assets/icon/logo-roya.svg',
            width: 40,
            height: 40,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
          color: Color(0xFFDDECF2).withOpacity(0.35),
        child: Padding(
          padding: const EdgeInsets.only(left: 20 , right: 20),
          child: Card(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Image.asset("assets/resources/img1.jpg",width: 150,height: 150,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, left: 8.0,right: 8.0),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text("FULL NAME" ,  textAlign: TextAlign.left),
                        )

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: colorprimary ,
                      child: TextFormField(
                        controller: fullname,
                        cursorColor: Colors.white,
                        validator: (value) {
                          if (value?.length == 0) {
                            return " Quartier";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(8),
                            //fillColor: Colors.white,
                            // labelText: "",
                            hintText: 'FULL NAME'.tr,
                            border: OutlineInputBorder(
                                borderSide: BorderSide(width: 3.w),
                                borderRadius: BorderRadius.circular(5.r))),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text("EMAIL" ,  textAlign: TextAlign.left),
                        )

                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: colorprimary ,
                      child: TextFormField(
                        controller: email,
                        cursorColor: Colors.white,
                        validator: (value) {
                          if (value?.length == 0) {
                            return " Quartier";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(8),
                            //fillColor: Colors.white,
                            // labelText: "",
                            hintText: 'EMAIL'.tr,
                            border: OutlineInputBorder(
                                borderSide: BorderSide(width: 3.w),
                                borderRadius: BorderRadius.circular(5.r))),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text("PHONE" ,  textAlign: TextAlign.left),
                        )

                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: colorprimary ,
                      child: TextFormField(
                        controller: phone,
                        cursorColor: Colors.white,
                        validator: (value) {
                          if (value?.length == 0) {
                            return " Quartier";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(8),
                            //fillColor: Colors.white,
                            // labelText: "",
                            hintText: 'PHONE'.tr,
                            border: OutlineInputBorder(
                                borderSide: BorderSide(width: 3.w),
                                borderRadius: BorderRadius.circular(5.r))),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text("OBJECT" ,  textAlign: TextAlign.left),
                        )

                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: colorprimary ,
                      child: Container(
                          height: 35.h,
                          decoration: BoxDecoration(
                            color:  colorprimary,
                            borderRadius:
                            BorderRadius.all(Radius.circular(5.r)),
                            border: Border.all(
                              color: Colors.grey,
                            ),
                          ),
                          child: DropdownButton<String>(
                              icon: const Icon(
                                  Icons.keyboard_arrow_down_sharp),
                              iconSize: 30,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                              elevation: 16,
                              isExpanded: true,
                              hint: Text('  ' + 'Select OBJECT'.tr),
                              underline: Container(
                                height: 2.h,
                                // color: Colors.deepPurpleAccent,
                              ),
                              //  value: dropdownValue,
                              value: object,
                              items: <String>[
                                'Consulting'.tr,
                                    'partnership'.tr,
                                    'marketing'.tr,
                                    'note'.tr,
                                    'other'.tr
                              ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text("  $value"),
                                    );
                                  }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _object =newValue;
                                     // CondationLangage.status(newValue!);
                                  object = newValue;
                                });
                              })),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text("MESSAGE" ,  textAlign: TextAlign.left),
                        )

                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: colorprimary ,
                      child: TextFormField(
                        controller: message,
                        cursorColor: Colors.white,
                        validator: (value) {
                          if (value?.length == 0) {
                            return " Quartier";
                          } else {
                            return null;
                          }
                        },
                        maxLines: 10,
                        decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(8),
                            //fillColor: Colors.white,
                            // labelText: "",
                            hintText: 'MESSAGE'.tr,
                            border: OutlineInputBorder(
                                borderSide: BorderSide(width: 3.w),
                                borderRadius: BorderRadius.circular(5.r))),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                       width: MediaQuery.of(context).size.width,
                      alignment: Alignment.topRight,
                      child: Center(
                        child: TextButton(
                          onPressed: () {
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 300,
                            decoration:  BoxDecoration(
                                color: Color(0xffbfa280),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10))),
                            padding: EdgeInsets.only(
                                top: 10,
                                left: 25,
                                bottom: 10,
                                right: 25),
                            child: Center(
                              child: Text(
                                "SEND MESSAGE",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}