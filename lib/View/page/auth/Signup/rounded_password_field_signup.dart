import 'package:flutter/material.dart';
import 'package:roya_immobilie/View/page/auth/components/text_field_container.dart';

import '../../../../varia_ble/variable.dart';


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
              return "entre voter password";
            } else if(val.length<=5) {
              return "password";
            }
            else
          {
              return null;
            }
          },

          obscureText: isvesible,
          cursorColor: kPrimaryColor,
          decoration:  InputDecoration(
            hintText: "Password",
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
                return 'Please re-enter password';
              }
              print(widget.password.text);
             print(widget.password_2.text);
                if(widget.password.text!=widget.password_2.text){
                  return "Password does not match";
                }
              return null;
            },
            obscureText: isvesible,
            cursorColor: kPrimaryColor,
            decoration:  InputDecoration(
              hintText: "Password",
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
