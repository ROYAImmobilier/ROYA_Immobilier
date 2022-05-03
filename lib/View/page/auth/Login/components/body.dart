import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:roya_immobilie/Model/joke.dart';
import 'package:roya_immobilie/View/page/auth/components/rounded_input_field.dart';
import 'package:roya_immobilie/View/page/auth/components/rounded_password_field.dart';
import 'package:roya_immobilie/View/routing_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../Add_Anonnce/annonce_as_login.dart';

import '../../../../../variable/variable.dart';
import '../../Signup/components/background.dart';
import '../../Signup/signup_screen.dart';

List<Joke> allAnnonceLogin = [];
String username = "";

class Body extends StatefulWidget {
  var property_type;
 // var categorie;
  var status;
  var adress;
  var region_id;
  var city_id;
 // var ville;
  var quartier;
  var bedrooms;
  var bathrooms;
  var kitchens;
  var apartment;
  var area;
  var price;
  var age;
  var floor;
  var floor_type;
  var title;
  var description;
  var phone1;
  var phone2;
  List<String>? media;
  List<dynamic>? abilities;
  var transaction;
  var phone3;

  Body({
    this.property_type,
  //  this.categorie,
    this.status,
    this.adress,
    this.region_id,
    this.city_id,
  //  this.ville,
    this.quartier,
    this.bedrooms,
    this.apartment,
    this.bathrooms,
    this.kitchens,
    this.area,
    this.price,
    this.age,
    this.floor,
    this.floor_type,
    this.title,
    this.description,
    this.phone1,
    this.phone2,
    this.media,
    this.abilities,
    this.transaction, this.phone3,
  });

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // var pass=TextEditingController();
  // var emaill=TextEditingController();
  //bool isLogin=false;
  bool view= false;
  late String email = '';
  late String password = '';
  var _key_validation = GlobalKey<FormState>();
 // Login? _user;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Form(
        key: _key_validation,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text(
                'Login'.tr,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/login.svg",
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                hintText: "Your Email".tr,
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              RoundedPasswordField(

                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              progress == true ? CircularProgressIndicator() : Container(),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: size.width * 0.8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: ElevatedButton(
                    child:  Text(
                      'Login'.tr,
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      int ?x;
                      setState(() {
                        allAnnonceLogin=[];
                      });

                      FocusManager.instance.primaryFocus?.unfocus();
                      if (_key_validation.currentState!.validate()) {
                        print(email + ' ' + password);
                       // isCamindingfrom = true;
                        //
                          progress = true;
                        if (isCamindingfrom) {


                          //  Clinet_Login.Add_Annonce_As_Login(email: email, password: password);
                       x=   await Annonce_As_Login.Add_Annonce_As_Login(
                              region_id: widget.region_id,
                              city_id: widget.city_id,
                              transaction: widget.transaction,
                              property_type: widget.property_type,
                              status: widget.status,
                              address: widget.adress,
                              quartier: widget.quartier,
                              area: widget.area,
                              price: widget.price,
                              age: widget.age,
                              floor_type: widget.floor_type,
                              floor: "",
                              apartment: "",
                              bedrooms: widget.bedrooms.toString(),
                              bathrooms:widget.bathrooms.toString(),
                              kitchens: widget.kitchens.toString(),
                              title: widget.title,
                              description: widget.description,
                              phone1: widget.phone1,
                              phone2: widget.phone2,
                              phone3: widget.phone3,
                              email: email,
                              password: password,
                              abilities:widget.abilities!,
                              media: widget.media);

                          if(x==201){
                            Get.snackbar(
                                "success".tr, "Your ad is added".tr);
                            //isLogin = true;
                            setState(() {
                              progress = false;
                              isCamindingfrom = false;
                            });
                              Get.offAll(RoutingScreen());
                          }
                          else if(x==401){
                            Get.snackbar(
                                "Error".tr, "password or email".tr);
                            setState(() {
                              progress = false;
                            });
                          }
                        } else if (!isCamindingfrom) {
                        x=  await _Login(email: email, password: password);
                        if(x!=200){
                          Get.snackbar("Error", "User not registered");
                          setState(() {
                            progress = false;
                          });

                        }
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        primary: kPrimaryColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 20),
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text(
                    "Don’t have an Account ".tr,
                    style: TextStyle(color: kPrimaryColor),
                  ),
                  GestureDetector(
                    onTap: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      Get.to(SignUpScreen(
                          region_id: widget.region_id,
                          city_id: widget.city_id,
                          transaction: widget.transaction,
                          property_type: widget.property_type,
                          status: widget.status,
                          adress: widget.adress,
                          quartier: widget.quartier,
                          area: widget.area,
                          price: widget.price,
                          age: widget.age,
                          floor_type: widget.floor_type,
                          floor: "4",
                          apartment: "1",
                          bedrooms: widget.bedrooms.toString(),
                          bathrooms:widget.bathrooms.toString(),
                          kitchens: widget.kitchens.toString(),
                          title: widget.title,
                          description: widget.description,
                          phone1: widget.phone1,
                          abilities:widget.abilities,
                          media: widget.media
                      ));
                    },
                    child:  Text(
                      " "+"Sign Up".tr,
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 50,)
            ],
          ),
        ),
      ),
    );
  }

 Future _Login({
    required var email,
    required var password,
  }) async {

    try {
      var response = await http.post(
          Uri.parse('https://dashboard.royaimmo.ma/api/auth/login'),
          body: {
            "email": email,
            "password": password,
          });
      print(response.body);

      var token = json.decode(response.body);
      var token_1 = token['data']['token'];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', token_1 );
      prefs.setString("username", token['data']['name']);

      setState(() {
        username = prefs.getString("username")!;
        token_global = prefs.getString("token");
      });

      print(token_1);
      print("response"+response.statusCode.toString());
      if (response.statusCode == 200) {
        var response_1 = await http.get(
            Uri.parse('https://dashboard.royaimmo.ma/api/annonces'),
            headers: {
              //HttpHeaders.authorizationHeader:token_1.toString(),
              'Authorization': 'Bearer $token_global'
            });
        print(response_1.body);

        if (response_1.statusCode == 200) {
          setState(() {
            progress = false;
          });

          isLogin = true;
          print(isLogin);
          final responseJsoon = json.decode(response_1.body);
          final responseJson = responseJsoon["data"];
          setState(() {
            for (Map annoncelogin in responseJson) {
              allAnnonceLogin.add(Joke.fromJson(annoncelogin.cast()));
            }
          });
          indexPage=true;
          Get.offAll( RoutingScreen());
        } else {
          setState(() {
            progress = false;
          });
        }
        // print(response_1.body);
        //  Get.to(const HomeC());
        return response.statusCode;
      } else {
        setState(() {
          progress = true;
        });

        return response.statusCode;
      }
    } catch (e) {
      print('error ' + e.toString());
    }
  }
}
