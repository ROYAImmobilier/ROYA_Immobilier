import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:roya_immobilie/Model/ability.dart';
import 'package:http/http.dart' as http;
import 'package:roya_immobilie/main.dart';
import 'contact_info.dart';
import 'order_distination.dart';

class Add_Annonce_2 extends StatefulWidget {
  String? Property_details;
  String? categorie;
  String? statut;
  String? adress;
  String? region;
  String? ville;
  String? quartier;

  Add_Annonce_2(
      { this.Property_details,
         this.categorie,
         this.statut,
         this.adress,
         this.region,
         this.ville,
         this.quartier});

  @override
  State<Add_Annonce_2> createState() => _Add_AnnonceState();
}

class _Add_AnnonceState extends State<Add_Annonce_2> {



  List<Ability> lmain = [];
  List<Ability> linner = [];
  List<Ability> ladditional = [];
  List<int>idability=[];

bool showmain=false;
bool showinner = false;
bool showaddtional = false;



  @override
  void initState() {

    setState(() {
      for(int i = 0;i<ability.length;i++){
        if(ability[i].type=="main"){
          lmain.add(ability[i]);
        }else if(ability[i].type=="inner"){
          linner.add(ability[i]);
        }else{
          ladditional.add(ability[i]);
        }
      }
    });
    super.initState();
  }
  int _bedroms = 0;
  int _bathrooms = 0;
  int kichens = 0;
var area=TextEditingController();
var price=TextEditingController();
String ? _price_type;
String ? _age;
String ? _flooring;

  var _key_details=GlobalKey<FormState>();
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
          body: Form(
            key: _key_details,
            child: SingleChildScrollView(
              child: Column(children: [
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
                        validator: (val){
                          if (val!.isEmpty) {
                            return "Entre L \' Area";
                          } else {
                            return null;
                          }

                        },
                        controller:area ,
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
                           // height: 35.h,
                            width: (MediaQuery.of(context).size.width * 0.6).w,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                BorderRadius.all(Radius.circular(5.r))),
                            child: TextFormField(
                              validator: (val){
                                if (val!.isEmpty){
                                  return "Entre L \' price";
                                } else {
                                  return null;
                                }
                              },
                              controller:price,
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
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),



















                          Container(
                          //  height: 35.h,
                            width: (MediaQuery.of(context).size.width * 0.10).w,
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
                              value: _price_type,
                              items: <String>['dh', '\$', 'ouro', 'dinar']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text("  $value"),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _price_type=newValue;

                                });

                              },
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
                          value: _age,

                          items: <String>['Less than 1 year', '28', '19', '14']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text("  $value"),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            _age=newValue;
                          },
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
                          value: _flooring,
                          items: <String>['Less than 1 year', '\$', 'ouro', 'dinar']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text("  $value"),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            _flooring=newValue;
                          },
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
                                          _bathrooms++;
                                        });
                                      },
                                    ),
                                    Text(_bathrooms.toString(),
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
                                          if (_bathrooms > 0) {
                                            _bathrooms--;
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
                              Text("Bathrooms:", style: TextStyle(fontSize: 14.sp)),
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
                                          _bedroms++;
                                          if(_bedroms>=10){
                                            _bedroms=0;
                                          }
                                        });
                                      },
                                    ),
                                    Text(_bedroms.toString(),
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
                                          if (_bedroms > 0) {
                                            _bedroms--;
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
                                          if(kichens>=10){
                                            kichens=0;
                                          }
                                        });
                                      },
                                    ),
                                    Text(kichens.toString()),
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
                            onPressed: () {
                           setState(() {
                             showmain=!showmain;
                           });
                            },
                            color: Color.fromARGB(255, 175, 178, 206),
                            child: Text('Main Abilites',
                                style: TextStyle(fontSize: 14.sp)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      !showmain?Container():appability(lmain),
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
                            onPressed: () {
                              setState(() {
                                showinner = !showinner;
                              });
                            },
                            color: Color.fromARGB(255, 175, 178, 206),
                            child: Text('Innir Abilites',
                                style: TextStyle(fontSize: 14.sp)),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      !showinner?Container():appability(linner),
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
                            onPressed: () {
                              setState(() {
                                showaddtional=!showaddtional;
                              });
                            },
                            color: Color.fromARGB(255, 175, 178, 206),
                            child: Text('Addition Abilites',
                                style: TextStyle(fontSize: 14.sp)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                     !showaddtional?Container():appability(ladditional),

















                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                           // width: 150,
                            alignment: Alignment.topRight,
                            child: TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Container(
                                width: 120,
                                decoration: const BoxDecoration(
                                    color: Color(0xffbfa280),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                                padding: EdgeInsets.only(
                                    top: 10, left: 25, bottom: 10, right: 25),
                                child: Center(
                                  child: Text(
                                    "Précédent",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14.sp),
                                  ),
                                ),
                              ),
                            ),
                          ), Container(
                           // width: 150,
                            alignment: Alignment.topLeft,
                            child: TextButton(

                              onPressed: () {
                                print(widget.Property_details);
                                print(widget.categorie);
                                print(widget.statut);
                                print(widget.adress);
                                print(widget.region);
                                print(widget.ville);
                                print(widget.quartier);
                                print(area.text);
                                print(price.text);
                                print(_price_type);
                                print(_age);
                                print(_flooring);
    if(_key_details.currentState!.validate()&&_age!=null ) {
              Get.to( ContactInfo(city: widget.ville, categorie: widget.categorie, quartier: widget.quartier, value: '',
                bedroms: _bedroms, region_1:widget.region, statut: widget.statut, bathrooms: _bathrooms,
                Property_details: widget.Property_details, kichens: kichens, adress:widget.adress, ville: widget.ville, age: _age, price: price.text,flooring:_flooring,area:area.text));
          }},
                              child: Container(
                                width: 120,
                                decoration: const BoxDecoration(
                                    color: Color(0xffbfa280),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                                padding: EdgeInsets.only(
                                    top: 10, left: 25, bottom: 10, right: 25),
                                child: Center(
                                  child: Text(
                                    "Suivant",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14.sp),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // Container(
                          //   decoration: const BoxDecoration(
                          //               color: Color(0xffbfa280),
                          //               borderRadius:
                          //               BorderRadius.all(Radius.circular(10))),
                          //           padding:  EdgeInsets.only(
                          //               top: 10, left: 25, bottom: 10, right: 25),
                          //   alignment: Alignment.topRight,
                          //   child: TextButton(
                          //     onPressed: () {
                          //       if(_key_details.currentState!.validate()&&_age!=null ) {
                          //         Get.to( ContactInfo(city: widget.ville, categorie: widget.categorie, quartier: widget.quartier, value: '', bedroms: _bedroms, region_1:widget.region, statut: widget.statut, bathrooms: _bathrooms, Property_details: widget.Property_details, kichens: kichens, adress:widget.adress, ville: widget.ville,));
                          //       }},
                          //     child:  Text("Suivant",
                          //         style: TextStyle(
                          //             color: Colors.white, fontSize: 14.sp)),
                          //   ),
                          // ),

                          //
                          // Container(
                          //   alignment: Alignment.topRight,
                          //   child: TextButton(
                          //     onPressed: () {
                          //       Navigator.push(context,
                          //           MaterialPageRoute(builder: (context) {
                          //             return Add_Annonce();
                          //           }));
                          //     },
                          //     child: Container(
                          //       decoration: const BoxDecoration(
                          //           color: Color(0xffbfa280),
                          //           borderRadius:
                          //           BorderRadius.all(Radius.circular(10))),
                          //       padding: EdgeInsets.only(
                          //           top: 10.h,
                          //           left: 25.w,
                          //           bottom: 10.h,
                          //           right: 25.w),
                          //       child: TextButton(
                          //         onPressed: () {
                          //           if(_key_details.currentState!.validate()&&_age!=null ) {
                          //             Get.to( ContactInfo(city: widget.ville, categorie: widget.categorie, quartier: widget.quartier, value: '', bedroms: _bedroms, region_1:widget.region, statut: widget.statut, bathrooms: _bathrooms, Property_details: widget.Property_details, kichens: kichens, adress:widget.adress, ville: widget.ville,));
                          //           }},
                          //             child:  Text("Suivant",
                          //       style: TextStyle(
                          //           color: Colors.white, fontSize: 14.sp)),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          )),
    );
  }


  Widget appability(data)=>Container(
    width: MediaQuery.of(context).size.width*.7 ,
    height: MediaQuery.of(context).size.height *.15,
    child: Card(
      child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 30,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: data.length,
          itemBuilder: (BuildContext ctx, index) {
            return  GestureDetector(
                onTap: (){
                  setState(() {
                    colorAbility(data[index].id);
                    for(int i=0;i<idability.length;i++){
                      if(data[index].id==idability[i]) {
                        setState(() {
                          idability.remove(idability[i]);
                        });
                        return;
                      }
                    }
                    idability.add(data[index].id);
                    print(colorAbility(data[index].id));


                  });
                },
                child:colorAbility(data[index].id)? Icon(Icons.circle_notifications ,

                  color : Colors.blue,

                ):Icon(Icons.circle_notifications ,

                  color : Colors.black,

                ));// Icon(Icons.circle_notifications , size: 25,);
          }),
    ),
  );


  bool colorAbility(int id){
    for(int i=0 ; i<idability.length;i++){
      if(id == idability[i]){
        return true ;
      }
    }
    return false ;
  }


}



