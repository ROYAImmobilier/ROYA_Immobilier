import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:roya_immobilie/View/page/auth/components/rounded_input_field.dart';
import 'package:roya_immobilie/View/page/auth/components/rounded_password_field.dart';
import '../../../../../Controller/login.dart';
import '../../../../../varia_ble/variable.dart';
import '../../../home_c.dart';
import '../../Signup/components/background.dart';
import '../../Signup/signup_screen.dart';
import 'package:http/http.dart' as http;
class Body extends StatefulWidget {
  const Body({
     Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
 // var pass=TextEditingController();
 // var emaill=TextEditingController();
  bool isLogin=false;
  late String email ='' ;
  late String password ='';
  var _key_validation=GlobalKey<FormState>();
  Login? _user;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Form(
          key: _key_validation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/login.svg",
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                hintText: "Your Email",
                onChanged: (value) {
                  setState(() {
                    email = value ;
                  });
                },
              ),
              RoundedPasswordField(
                onChanged: (value) {
                  setState(() {
                    password = value ;
                  });

                },
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: size.width * 0.8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: ElevatedButton(
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async{

                    if(_key_validation.currentState!.validate())
                    print(email +' '+password);
                    final Login? user = await  _Login(email: email, password: password);
                    setState(() {
                      _user = user;
                     //isLogin= user!.success;
                    });







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
                 "Don’t have an Account ",
                style: TextStyle(color: kPrimaryColor),
              ),
              GestureDetector(
                onTap: (){
                  Get.to(SignUpScreen());
                },
                child: const Text(
                   "Sign In",
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          )
            ],
          ),
        ),
      ),
    );
  }
  _Login({
    required String? email,
    required String? password,
  }) async {
    try {
      var response = await http
          .post(Uri.parse('https://dashboard.royaimmo.ma/api/auth/login'), body: {
        "email": email,
        "password": password,

      });
      print(response.body);
      if(response.statusCode==200){
        Get.to(const HomeC());
                }
      else {
        final snackBar = SnackBar(
          content: Row(children: const [
            Icon(
              Icons.error,
              color: Colors.white,
            ),
            Text('n\'pas regester  ')
          ]),
        );
        ScaffoldMessenger.of(context)
            .showSnackBar(snackBar);
      }
    } catch (e) {
      print('error ' + e.toString());
    }
  }

}
