import 'package:flutter/material.dart';
import 'package:roya_immobilie/View/page/auth/components/text_field_container.dart';

import '../../../../varia_ble/variable.dart';


class RoundedPasswordFieldSignup extends StatelessWidget {
 var password=TextEditingController();
 var password_2=TextEditingController();

 RoundedPasswordFieldSignup(this.password, this.password_2);



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [TextFieldContainer(
        child: TextFormField(
          controller: password,
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

          obscureText: true,
          cursorColor: kPrimaryColor,
          decoration: const InputDecoration(
            hintText: "Password",
            icon: Icon(
              Icons.lock,
              color: kPrimaryColor,
            ),
            suffixIcon: Icon(
              Icons.visibility,
              color: kPrimaryColor,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
        TextFieldContainer(
          child: TextFormField(
             controller:password_2 ,
            validator: (val){
              if(val!.isEmpty)
              {
                return 'Please re-enter password';
              }
              print(password.text);
             print(password_2.text);
                if(password.text!=password_2.text){
                  return "Password does not match";
                }
              return null;
            },
            obscureText: true,
            cursorColor: kPrimaryColor,
            decoration: const InputDecoration(
              hintText: "Password",
              icon: Icon(
                Icons.lock,
                color: kPrimaryColor,
              ),
              suffixIcon: Icon(
                Icons.visibility,
                color: kPrimaryColor,
              ),
              border: InputBorder.none,
            ),
          ),
        )
    ]);
  }
}
