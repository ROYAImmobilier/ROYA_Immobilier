
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Add_Anonnce/annonce_as_login.dart';

class ContactSend extends StatefulWidget {
  int? annonce_id;

  bool idexiste;

  ContactSend({Key? key,  this.annonce_id,this.idexiste=false }) : super(key: key);

  @override
  State<ContactSend> createState() => _ContactSendState();
}

class _ContactSendState extends State<ContactSend> {
  Color colorprimary = Color(0xFFDDECF2).withOpacity(0.35);
  var fullname = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();
  var message = TextEditingController();
  var object;
  var _keyContact = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        leading: IconButton(

          color: Colors.blueAccent, onPressed: () { Get.back(); }, icon: Icon(Icons.arrow_back) ,
        ),
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
      body: Form(
        key: _keyContact,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color(0xFFDDECF2).withOpacity(0.35),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 4,
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/resources/img1.jpg",
                        width: 150,
                        height: 250,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 8.0, left: 8.0, right: 8.0),
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text('FULL NAME'.tr, ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        // color: colorprimary ,
                        child: TextFormField(
                          controller: fullname,
                          cursorColor: Colors.white,
                          validator: (value) {
                            if (value?.length == 0) {
                              return 'FULL NAME'.tr;
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
                                  borderSide: BorderSide(width: 3),
                                  borderRadius: BorderRadius.circular(5))),
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
                            child: Text("Your Email".tr, ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        // color: colorprimary ,
                        child: TextFormField(
                          controller: email,
                          cursorColor: Colors.white,
                          validator: (value) {
                            if (value?.length == 0) {
                              return "Your Email".tr;
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.all(8),
                              //fillColor: Colors.white,
                              // labelText: "",
                              hintText: "Your Email".tr,
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
                            child: Text('Phone 1 :'.tr, ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        //   color: colorprimary ,
                        child: TextFormField(
                          controller: phone,
                          cursorColor: Colors.white,
                          validator: (value) {
                            if (value?.length == 0) {
                              return " phone";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.all(8),
                              //fillColor: Colors.white,
                              // labelText: "",
                              hintText: 'Phone 1 :'.tr,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 3),
                                  borderRadius: BorderRadius.circular(5))),
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
                            child: Text("OBJECT".tr, ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        //  color: colorprimary ,
                        child: Container(
                            height: 35,
                            decoration: BoxDecoration(
                              color: colorprimary,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            child: DropdownButton<String>(
                                icon:
                                    const Icon(Icons.keyboard_arrow_down_sharp),
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
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text("  $value"),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {

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
                            child: Text("MESSAGE".tr,),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        // color: colorprimary ,
                        child: TextFormField(
                          controller: message,
                          cursorColor: Colors.white,
                          validator: (value) {
                            if (value?.length == 0) {
                              return "message";
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
                                  borderSide: BorderSide(width: 3),
                                  borderRadius: BorderRadius.circular(5))),
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
                            onPressed: () async {
                              var code;

                              if (_keyContact.currentState!.validate()) {
                                Get.defaultDialog(
                                    title: "publisher",
                                    textCancel: "Cancel".tr,
                                    textConfirm: "yes".tr,

                                    middleText:
                                        "Are you wante to publisher ?".tr,
                                    onCancel: () {},
                                    onConfirm: () async {


                                      code =

                                      widget.idexiste ==false?

                                      await Annonce_As_Login.PostContact(
                                          annonce_id: widget.annonce_id,
                                          full_name: fullname.text,
                                          email: email.text,
                                          phone: phone.text,
                                          subject: object,
                                          message: message.text):

                                      await Annonce_As_Login.PostContactidnotexist(
                                          full_name: fullname.text,
                                          email: email.text,
                                          phone: phone.text,
                                          subject: object,
                                          message: message.text);



                                      if (code.toString() == "200") {
                                        Get.snackbar("success".tr, "Message envoi".tr);
                                      // fromContact=true;
                                        Navigator.pop(context);
                                        Navigator.pop(context);

                                      } else {
                                        Get.snackbar("Error".tr, "Message not sent".tr);
                                      }


                                    },
                                );

                              }

                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 300,
                              decoration: BoxDecoration(
                                  color: Color(0xffbfa280),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              padding: EdgeInsets.only(
                                  top: 10, left: 25, bottom: 10, right: 25),
                              child: Center(
                                child: Text(
                                  "SEND MESSAGE".tr,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.sp),
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
      ),
    );
  }
}
