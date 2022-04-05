import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:roya_immobilie/View/page/auth/Login/login_screen.dart';
import 'package:roya_immobilie/View/page/auth/Signup/components/background.dart';
import 'package:roya_immobilie/View/page/auth/Signup/components/or_divider.dart';
import 'package:roya_immobilie/View/page/auth/Signup/components/social_icon.dart';
import 'package:roya_immobilie/View/page/auth/components/rounded_input_field.dart';
import '../../../../../Add_Anonnce/clinet_register.dart';
import '../../../../../varia_ble/variable.dart';
import '../../components/text_field_container.dart';
import '../rounded_password_field_signup.dart';

class Body extends StatefulWidget {
  var property_type;
  var categorie;
  var status;
  var adress;
  var region_id;
  var city_id;
  var ville;
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
  var media;
  var abilities;
  var transaction;

  Body({
    this.property_type,
    this.categorie,
    this.status,
    this.adress,
    this.region_id,
    this.city_id,
    // this.ville,
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
    this.transaction,
  });
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var _key_signup = GlobalKey<FormState>();
  var emaill = TextEditingController();
  var _name = TextEditingController();
  var password=TextEditingController();
  var password_2=TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

   // late String email = '';
  //  late String name = '';

    return Form(
      key: _key_signup,
      child: Background(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "SIGNUP",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/signup.svg",
                height: size.height * 0.35,
              ),

              TextFieldContainer(
                child: TextFormField(
                  controller: _name,
                  validator: ( val){
                    if(val!.isEmpty)
                    {
                      return 'Please a Enter';
                    }
                    return null;
                  },
                  //onChanged: onChanged,
                  cursorColor: kPrimaryColor,
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: kPrimaryColor,
                    ),
                    hintText: "Your Name",
                    border: InputBorder.none,
                  ),
                ),
              ),
              // RoundedInputField(
              //   hintText: "Your Name",
              //   onChanged: (value) {
              //     setState(() {
              //       name = value;
              //     });
              //   },
              // ),
              TextFieldContainer(
                child: TextFormField(
                  validator: ( val){
                    if(val!.isEmpty)
                    {
                      return 'Please a Enter';
                    }
                    if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(val)){
                      return 'Please a valid Email';
                    }
                    return null;
                  },
                 controller:emaill ,
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.email,
                      color: kPrimaryColor,
                    ),
                    hintText: "Your Name",
                    border: InputBorder.none,

                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),

              RoundedPasswordFieldSignup(password,password_2),
              // RoundedPasswordFieldSignup_2(
              //   password: password,
              //   onChanged: (value) {
              //     setState(() {
              //       password_2=value;
              //     });
              //   },
              // ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: size.width * 0.8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: ElevatedButton(
                    child: const Text(
                      'Sing UP',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {

                      print(widget.adress);
                    //  print(widget.categorie);
                      print(widget.status);
                      print( widget.bathrooms);
                      print(widget.kitchens);
                      print(widget.title);
                      print( widget.floor_type);
                      print(widget.floor);
                      print( widget.area);
                      print(_name.text);
                      print(widget.description);
                      print(widget.phone1);
                      print( widget.quartier);
                      print(widget.age);
                      print( widget.property_type);
                      print (widget.region_id);
                      print( widget.city_id);
                      print(widget.phone2);


                      if (_key_signup.currentState!.validate()) {
                        Annonce_As_SingUp.Add_Annonce_SingUp(
                            address: widget.adress,
                            status: widget.status,
                            transaction:  "Rent",
                            bathrooms: widget.bathrooms,
                            kitchens: widget.kitchens,
                            title: widget.title,
                            floor_type: widget.floor_type,
                            media: '',
                            floor: widget.floor,
                            abilities: '',
                            area: widget.area,
                            name:_name.text ,
                            description: widget.description,
                            apartment: "2",
                            bedrooms: widget.bedrooms,
                            phone1: widget.phone1,
                           // phone2: widget.phone2,
                            quartier: widget.quartier,
                            password: password.text,
                            age: widget.age,
                            price: widget.price,
                            property_type: widget.property_type,
                            password_confimation: password_2.text,
                            region_id: widget.region_id,
                            email: emaill.text,
                            city_id: widget.city_id);


                      }
                      print(password_2.text);
                      print(password.text);
                      print(emaill.text);
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
                children: <Widget>[
                  const Text(
                    "Already have an Account ? ",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(LoginScreen(
                          adress: widget.adress,
                          status: widget.status,
                          transaction: '',
                          bathrooms: widget.bathrooms,
                          kitchens: widget.kitchens,
                          title: widget.title,
                          floor_type: widget.floor_type,
                          media: null,
                          floor: widget.floor,
                          abilities: null,
                          area: widget.area,
                          description: widget.description,
                          apartment: '',
                          bedrooms: widget.bedrooms,
                          phone1: widget.phone1,
                          // phone2: widget.phone2,
                          quartier: widget.quartier,
                          age: widget.age,
                          price: widget.price,
                          property_type: widget.property_type,
                          region_id: widget.region_id,
                          city_id: widget.city_id
                      ));
                    },
                    child: const Text(
                      "Login In",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              OrDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocalIcon(
                    iconSrc: "assets/icons/facebook.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/twitter.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/google-plus.svg",
                    press: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
