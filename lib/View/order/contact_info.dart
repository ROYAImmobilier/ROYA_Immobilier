import 'dart:convert';
import 'dart:io';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import '../../Add_Anonnce/annonce_as_login.dart';
import '../../Add_Anonnce/modifier_annonce.dart';
import '../../Model/ability.dart';
import '../../varia_ble/variable.dart';
import '../page/auth/Login/login_screen.dart';
import 'order_details.dart';


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
  List<String> _listimagebase64=[] ;
  List<String> _listimagebase64_com=[] ;


  choseImage() async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile == null) return;
      final imageTemporary = File(pickedFile.path);
      setState(() {
        _file = imageTemporary;
        _listimage.add(_file!);
        _listimagebase64.add("data:image/jpeg;base64,${base64Encode(_file!.readAsBytesSync())}");
      //  print(getData_put["media"][0]["blob"]);
        if(isLogin){
          for(int i=0;i<getData_put["media"].length;i++){
            _listimagebase64_com.add("data:image/jpeg;base64,${getData_put["media"][i]["blob"]}");
          }for(int i=0;i<_listimagebase64.length;i++){
            _listimagebase64_com.add(_listimagebase64[i]);
          }

        }
       // media[0]["blob"]=_listimagebase64!;
    print( media);
      });
    } catch (e) {
      print(e);
    }

  }



@override
  void initState() {

    widget._id_region=getRegionid(widget.region_1!);
    widget._id_city=getCityid(widget.city!);
    print("region "+widget._id_region.toString());
    print("city "+widget._id_city.toString());
   setState(() {
     if(verify_update){
       _titel.text=getData_put["title"].toString();
       _description.text=getData_put["description"].toString();
       if(getData_put["phone1"]!=null){
         _phone1.text=getData_put["phone1"].toString();
       }
       if(getData_put["phone2"]!=null){
         _phone1.text=getData_put["phone2"].toString();
       }
       if(getData_put["phone3"]!=null){
         _phone1.text=getData_put["phone3"].toString();
       }
     //  print(getData_put["covar"]);
     }
   });
    super.initState();
  }
 int getRegionid(String name){
    late int id;
    for (int i=0;i<region!.length;i++){
          if(name==region![i].regionName){
           id= region![i].id;
          }

    }
    return id;
 }
  int getCityid(String name){
    late int id;
    for (int i=0;i<listCity.length;i++){
      if(name==listCity[i].cityName){
        id= listCity[i].id;
      }

    }
    return id;
  }

  @override
  Widget build(BuildContext context) {
  //  var image= getData_put["media"][0]["blob"]=_listimagebase64[0];
   // print( image);
  //  print("base64");
   // print(_listimagebase64);
    // print(widget.ablity.toString());
    return ScreenUtilInit(
      builder: () => Scaffold(
        appBar: AppBar(
          title: SvgPicture.asset('assets/icon/logo-roya.svg',
            //color: Colors.white,
            width: 40,
            height: 40,),
          automaticallyImplyLeading: false,
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
                              keyboardType: TextInputType.phone,
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
                              keyboardType: TextInputType.phone,
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
                              keyboardType: TextInputType.phone,
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
                                      itemCount:verify_update==false? _listimage.length:getData_put["media"].length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, i) {
                                        print(verify);
                                     //  print("tes"+getData_put["media"].length.toString());
                                        return SizedBox(
                                          height: 75,
                                          child: Row(children: [

                                            verify_update==false? Image.file(
                                              _listimage[i],
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.cover,
                                            ):Image.memory((const Base64Decoder().convert(getData_put["media"][i]["blob"].toString())

                                                ),
                                             fit: BoxFit.cover,
                                              width: 100,
                                              height: 100,
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
                            FocusManager.instance.primaryFocus?.unfocus();
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
                            print("ferf "+widget.flooring.toString());
                            print(widget.bedroms);
                            print(widget.bathrooms);
                            print(widget.kichens);
                            print(_titel.text);
                            print(_description.text);
                            print(widget.ablity.toString());
                           print(_listimagebase64);

                            print(_phone1.text);
                          //  print(getData_put["media"]);
                          //  print(_phone3.text);
                            if (_key_Contact.currentState!.validate()) {
                              // Get.to(LoginScreen());

                              setState(()  {
                              // verify=false;
                                isCamindingfrom = true;

                                //
                                // //  Get.to(LoginScreen());
                                if(!verify_update) {
                                  print("8761");
                                  isLogin == false
                                    ? Get.to(LoginScreen(
                                        region_id: widget._id_region.toString(),
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
                                        title: _titel.text,
                                        description: _description.text,
                                        phone1: _phone1.text,
                                        abilities: widget.ablity,
                                        media: _listimagebase64))
                                    : Annonce_As_Login
                                        .Add_Annonce_As_Aredy_Login(
                                    region_id: widget._id_region.toString(),
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
                                        bathrooms: widget.bathrooms.toString(),
                                        kitchens: widget.kichens.toString(),
                                        title: _titel.text,
                                        description: _description.text,
                                        phone1: _phone1.text,
                                        abilities: widget.ablity,
                                        media: _listimagebase64,
                                        floor_type: widget.flooring,
                                        floor: "4",
                                      );
                                }else{
                                  print("876");
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
                                  print(widget.ablity.toString());
                                  print(_listimagebase64);
                                      //verify=false;

                                 var x= Modifier_Annonce.Modifier(
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
                                    title: _titel.text.toString(),
                                    description: _description.text.toString(),
                                    phone1: _phone1.text.toString(),
                                    abilities: widget.ablity,
                                    media:_listimagebase64_com,
                                    floor_type: widget.flooring.toString(),
                                    floor: "4",
                                  );
                                 if(x=="500"){
                                   Get.snackbar("update", "success");
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
