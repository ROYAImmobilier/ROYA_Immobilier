import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roya_immobilie/View/page/auth/components/text_field_container.dart';

import '../../../../variable/variable.dart';




class RoundedPasswordFieldSignup extends StatefulWidget {
 var password=TextEditingController();
 var password_2=TextEditingController();

 RoundedPasswordFieldSignup(this.password, this.password_2);

  @override
  State<RoundedPasswordFieldSignup> createState() => _RoundedPasswordFieldSignupState();
}

class _RoundedPasswordFieldSignupState extends State<RoundedPasswordFieldSignup> {
  bool isvesible=true;
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [TextFieldContainer(
        child: TextFormField(
          controller: widget.password,
          validator: (val){
            if(val!.isEmpty){
              return "entre voter password".tr;
            } else if(val.length<=5) {
              return "Password".tr;
            }
            else
          {
              return null;
            }
          },

          obscureText: isvesible,
          cursorColor: kPrimaryColor,
          decoration:  InputDecoration(
            hintText: "Password".tr,
            icon: Icon(
              Icons.lock,
              color: kPrimaryColor,
            ),
            suffixIcon:  IconButton(
                color: kPrimaryColor, icon:isvesible==true?  const Icon(Icons.visibility):const Icon(Icons.visibility_off), onPressed: () {
              setState(() {
                isvesible=!isvesible;
              });}),
            border: InputBorder.none,
          ),
        ),
      ),
        TextFieldContainer(
          child: TextFormField(
             controller:widget.password_2 ,
            validator: (val){
              if(val!.isEmpty)
              {
                return 'Please re-enter password'.tr;
              }

                if(widget.password.text!=widget.password_2.text){
                  return "Password does not match".tr;
                }
              return null;
            },
            obscureText: isvesible,
            cursorColor: kPrimaryColor,
            decoration:  InputDecoration(
              hintText: "Password".tr,
              icon: Icon(
                Icons.lock,
                color: kPrimaryColor,
              ),
              suffixIcon: IconButton(
    color: kPrimaryColor, icon:isvesible==true?  const Icon(Icons.visibility):const Icon(Icons.visibility_off), onPressed: () {
    setState(() {
      isvesible=!isvesible;
    });}),
              border: InputBorder.none,
            ),
          ),
        )
    ]);
  }
}
