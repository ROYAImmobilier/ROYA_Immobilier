import 'package:flutter/material.dart';


import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:roya_immobilie/View/page/auth/Login/login_screen.dart';
import 'package:roya_immobilie/View/page/auth/Signup/components/background.dart';
import 'package:roya_immobilie/View/page/auth/Signup/components/or_divider.dart';
import 'package:roya_immobilie/View/page/auth/Signup/components/social_icon.dart';
import 'package:roya_immobilie/View/page/auth/components/already_have_an_account_acheck.dart';
import 'package:roya_immobilie/View/page/auth/components/rounded_button.dart';
import 'package:roya_immobilie/View/page/auth/components/rounded_input_field.dart';
import 'package:roya_immobilie/View/page/auth/components/rounded_password_field.dart';

import '../../../../../varia_ble/variable.dart';
import '../rounded_password_field_signup.dart';


class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var _key_signup=GlobalKey<FormState>();
  var emaill=TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    late String email='' ;
    late String password='' ;
   late  String password_2='';
    return Form(
      key: _key_signup,
      child: Background(
        child: SingleChildScrollView(
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
              RoundedInputField(

                hintText: "Your Email",
                onChanged: (value) {
                  setState(() {
                    email=value;
                  });
                },
              ),

              RoundedPasswordFieldSignup(
              ),
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
                  onPressed: (){
                    if(_key_signup.currentState!.validate()) {
                      print(password_2);
                    }
                    print(password);
                    print(email);
                  },
                  style: ElevatedButton.styleFrom(
                      primary: kPrimaryColor,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      textStyle: const TextStyle(
                          color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
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
                  onTap: (){
                    Get.to(LoginScreen());
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