import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../Add_Anonnce/annonce_as_login.dart';
import '../../Add_Anonnce/modifier_annonce.dart';
import '../../Model/ability.dart';
import '../../variable/variable.dart';
import '../page/auth/Login/login_screen.dart';
import '../routing_screen.dart';

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
  late int _id_region;
  late int _id_city;
  bool addimage = false;

  List<dynamic>? ablity;

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
  List<Ability> allAbility = [];
  var _key_Contact = GlobalKey<FormState>();
  var _titel = TextEditingController();
  var _description = TextEditingController();
  var _phone1 = TextEditingController();
  var _phone2 = TextEditingController();
  var _phone3 = TextEditingController();


  final ImagePicker imgpicker = ImagePicker();
  String imagepath = "";

  String status = '';
  String? base64Image;
  File? tmpFile;
  String error = 'Error'.tr;
  File? _file;
  List<File> _listimage = [];
  List<String> _listimagebase64 = [];
  List<String> _listimagebase64_com = [];

  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];

  String? value;
  String? city;
  @override
  State<ContactInfo> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {

  void choseImage() async {
    var imageTemporary;
    final List<XFile>? selectedImages = await widget.imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      widget.imageFileList!.addAll(selectedImages);
    }
    for (int i = 0; i < widget.imageFileList!.length; i++) {
      imageTemporary = File(widget.imageFileList![i].path);
      widget._file = imageTemporary;
      widget._listimage.add(widget._file!);
      widget._listimagebase64.add("${base64Encode(widget._file!.readAsBytesSync())}");
    }
    setState(() {});
    if (verify_update)
      setState(() {
        for (int i = 0; i < widget._listimagebase64.length; i++) {
          widget._listimagebase64_com.add(widget._listimagebase64[i]);
        }
      });
  }

  @override
  void initState() {
    widget._id_region = getRegionid(widget.region_1!);
    if( widget.city.toString().isNotEmpty)
    widget._id_city = getCityid(widget.city!);

    setState(() {
      if (verify_update) {
        widget._titel.text = getData_put["title"].toString();
        widget._description.text = getData_put["description"].toString();
        if (getData_put["phone1"] != null) {
          widget._phone1.text = getData_put["phone1"].toString();
        }
        if (getData_put["phone2"] != null) {
          widget._phone2.text = getData_put["phone2"].toString();
        }
        if (getData_put["phone3"] != null) {
          widget._phone3.text = getData_put["phone3"].toString();
        }
        for (int i = 0; i < getData_put["media"].length; i++) {
          widget._listimagebase64_com.add("${getData_put["media"][i]["blob"]}");
        }
      }
    });

    super.initState();
  }

  int getRegionid(String name) {
    late int id;
    for (int i = 0; i < region!.length; i++) {
      if (name == region![i].regionName) {
        id = region![i].id;
      }
    }
    return id;
  }

  int getCityid(String name) {
    late int id;
    for (int i = 0; i < listCity.length; i++) {
      if (name == listCity[i].cityName) {
        id = listCity[i].id;
      }
    }
    return id;
  }

  @override
  Widget build(BuildContext context) {
    progress_modife = false;
    //  var image= getData_put["media"][0]["blob"]=_listimagebase64[0];
    // print( image);
    //  print("base64");
    // print(_listimagebase64);
    // print(widget.ablity.toString());
    return ScreenUtilInit(
      builder: () => Scaffold(
        appBar: AppBar(
          title: SvgPicture.asset(
            'assets/icon/logo-roya.svg',
            //color: Colors.white,
            width: 40,
            height: 40,
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Form(
          key: widget._key_Contact,
          child: Stack(

              children: [
            Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: ListView(children: [
                Column(
                 // mainAxisAlignment: MainAxisAlignment.start,

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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  //alignment: Alignment.topLeft,
                                  child: Text(
                                    'Title'.tr,
                                    style: TextStyle(fontSize: 13.sp),
                                  )),
                              SizedBox(
                                height: 15.h,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value?.length == 0) {
                                    return " Entre L \' Titel".tr;
                                  } else {
                                    return null;
                                  }
                                },
                                controller: widget._titel,
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
                                 // alignment: Alignment.topLeft,
                                  child: Text(
                                    'Description :'.tr,
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
                                controller: widget._description,
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
                                //  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Phone 1 :'.tr,
                                    style: TextStyle(fontSize: 13.sp),
                                  )),
                              SizedBox(
                                height: 15.h,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value?.length == 0) {
                                    return " Entre L \' Phone".tr;
                                  } else {
                                    return null;
                                  }
                                },
                                maxLength: 10,
                                controller: widget._phone1,
                                decoration: const InputDecoration(
                                  isDense: true, // Added this
                                  contentPadding: EdgeInsets.only(
                                      left: 8, right: 8, bottom: 8, top: 8),
                                  // labelText: "",
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.phone,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                //  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Phone 2 :'.tr,
                                    style: TextStyle(fontSize: 13.sp),
                                  )),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                maxLength: 10,
                                controller: widget._phone2,
                                //: title,
                                decoration: const InputDecoration(
                                  isDense: true, // Added this
                                  contentPadding: EdgeInsets.only(
                                      left: 8, right: 8, bottom: 8, top: 8),
                                  // labelText: "",
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.phone,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                  //alignment: Alignment.topLeft,
                                  child: Text(
                                    'Phone 3 :'.tr,
                                    style: TextStyle(fontSize: 13.sp),
                                  )),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                maxLength: 10,
                                controller: widget._phone3,
                                decoration: const InputDecoration(
                                  isDense: true, // Added this
                                  contentPadding: EdgeInsets.only(
                                      left: 8, right: 8, bottom: 8, top: 8),
                                  // labelText: "",
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.phone,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                 // alignment: Alignment.topLeft,
                                  child: Text(
                                    'Upload image(jpg-png-jpeg)'.tr,
                                    style: TextStyle(fontSize: 13.sp),
                                  )),
                              SizedBox(
                                height: 10.h,
                              ),
                              SizedBox(
                                height: 100.h,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(children: [
                                    Card(
                                        color: Colors.cyan,
                                        child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                choseImage();
                                              });
                                            },
                                            icon: const Icon(
                                              Icons.add_photo_alternate_rounded,
                                              color: Colors.black,
                                            ))),
                                    ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: verify_update == false
                                            ? widget._listimage.length
                                            : widget._listimagebase64_com.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, i) {
                                          print(verify_update);

                                          return GestureDetector(
                                            onLongPress: () {
                                              setState(() {
                                                verify_update == false
                                                    ? widget._listimage.removeAt(i)
                                                    : widget._listimagebase64_com
                                                        .removeAt(i);
                                              });
                                            },
                                            child: SizedBox(
                                              height: 250,
                                              child: Row(children: [
                                                verify_update == false
                                                    ? Image.file(
                                                        widget._listimage[i],
                                                        width: 100,
                                                        height: 250,
                                                        fit: BoxFit.cover,
                                                      )
                                                    : Image.memory(
                                                        (const Base64Decoder()
                                                            .convert(
                                                                widget._listimagebase64_com[
                                                                        i]
                                                                    .toString())),
                                                        fit: BoxFit.cover,
                                                        width: 100,
                                                        height: 100,
                                                      ),
                                                // verify_update==true && widget.addimage==true?Image.file(
                                                //   _listimage[i],
                                                //   width: 100,
                                                //   height: 100,
                                                //   fit: BoxFit.cover,
                                                // ):SizedBox(width: 5,),
                                                const SizedBox(
                                                  width: 5,
                                                )
                                              ]),
                                            ),
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
                            onPressed: progress_modife ==true?null:() {
                              Get.back();
                            },
                            child: Text(
                              "Precedent".tr,
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r)),
                            onPressed:   progress_modife ==true? null:() async{
                              FocusManager.instance.primaryFocus?.unfocus();

                              if (widget._key_Contact.currentState!.validate()) {
                                // Get.to(LoginScreen());

                                // verify=false;
                                isCamindingfrom = true;

                                //
                                // //  Get.to(LoginScreen());
                                if (!verify_update) {
                                  setState(() {
                                    progress_modife = true;
                                  });
                                  var x;

                                  isLogin == false
                                      ? Get.to(LoginScreen(
                                          region_id:
                                              widget._id_region.toString(),
                                          city_id: widget._id_city.toString(),
                                          transaction: widget.Property_details,
                                          property_type: widget.categorie,
                                          status: widget.statut,
                                          adress: widget.adress,
                                          quartier: widget.quartier,
                                          area: widget.area,
                                          price: widget.price,
                                          age: widget.age,
                                          floor_type: widget.flooring,
                                          floor: "4",
                                          apartment: "1",
                                          bedrooms: widget.bedroms,
                                          bathrooms: widget.bathrooms,
                                          kitchens: widget.kichens,
                                          title: widget._titel.text,
                                          description: widget._description.text,
                                          phone1: widget._phone1.text,
                                          phone2: widget._phone2.text,
                                          phone3: widget._phone3.text,
                                          abilities: widget.ablity,
                                          media: widget._listimagebase64))
                                      : x = await Annonce_As_Login
                                          .Add_Annonce_As_Aredy_Login(
                                          region_id:
                                              widget._id_region.toString(),
                                          city_id: widget._id_city.toString(),
                                          transaction: widget.Property_details,
                                          property_type: widget.categorie,
                                          status: widget.statut,
                                          adress: widget.adress,
                                          quartier: widget.quartier,
                                          area: widget.area,
                                          price: widget.price,
                                          age: widget.age,
                                          apartment: "1",
                                          bedrooms: widget.bedroms.toString(),
                                          bathrooms:
                                              widget.bathrooms.toString(),
                                          kitchens: widget.kichens.toString(),
                                    title: widget._titel.text,
                                    description: widget._description.text,
                                    phone1: widget._phone1.text,
                                    phone2: widget._phone2.text,
                                    phone3: widget._phone3.text,
                                          abilities: widget.ablity!,
                                          media: widget._listimagebase64,
                                          floor_type: widget.flooring,
                                          floor: "4",
                                        );
                                  print(token_global);
                                   print("wetwrw"+x.toString());
                                  if (x == 201) {
                                    Get.snackbar(
                                        "success".tr, "Your ad is added".tr);
                                   // verify_update = false;
                                    progress_modife = false;
                                    Get.to( RoutingScreen());
                                  }

                                } else {
                                  // print("876");
                                  // print(widget.Property_details);
                                  // print(widget.categorie);
                                  // print(widget.statut);
                                  // print(widget.adress);
                                  // print(widget.region_1);
                                  // print(widget.city);
                                  // print(widget.quartier);
                                  // print(widget.area);
                                  // print(widget.price);
                                  // print(widget.age);
                                  // print(widget.flooring);
                                  // print(widget.bedroms);
                                  // print(widget.bathrooms);
                                  // print(widget.kichens);
                                  // print(_titel.text);
                                  // print(_description.text);
                                  // print(widget.ablity.toString());
                                  // print(_listimagebase64);
                                  // //verify=false;
                                  setState(() {
                                    progress_modife = true;
                                  });
                                  var x = await Modifier_Annonce.Modifier(
                                    region_id: widget._id_region.toString(),
                                    city_id: widget._id_city.toString(),
                                    transaction: widget.Property_details,
                                    property_type: widget.categorie.toString(),
                                    status: widget.statut.toString(),
                                    adress: widget.adress.toString(),
                                    quartier: widget.quartier.toString(),
                                    area: widget.area.toString(),
                                    price: widget.price.toString(),
                                    age: widget.age.toString(),
                                    apartment: "1",
                                    bedrooms: widget.bedroms.toString(),
                                    bathrooms: widget.bathrooms.toString(),
                                    kitchens: widget.kichens.toString(),
                                    title: widget._titel.text,
                                    description: widget._description.text,
                                    phone1: widget._phone1.text,
                                    phone2: widget._phone2.text,
                                    phone3: widget._phone3.text,
                                    abilities: widget.ablity!,
                                    media: widget._listimagebase64_com,
                                    floor_type: widget.flooring.toString(),
                                    floor: "4",
                                  );

                                  if (x == 500 || x == 200) {
                                    Get.snackbar( "success".tr,"update".tr);

                                    setState(() {
                                      verify_update = false;
                                      progress_modife = false;
                                    });

                                   Get.offAll(RoutingScreen());
                                  }
                                }
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

                              }
                            },
                            child: Text(
                              "Reservez ".tr,
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
            progress_modife == true
                ? Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.grey,
                      strokeWidth: 8,
                    ),
                  )
                : Container(),
          ]),
        ),
      ),
    );
  }


}
