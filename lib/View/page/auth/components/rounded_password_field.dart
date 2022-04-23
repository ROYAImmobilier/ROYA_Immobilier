import 'package:flutter/material.dart';
import 'package:roya_immobilie/View/page/auth/components/text_field_container.dart';

import '../../../../variable/variable.dart';




class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool visible=true;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator: (val){
          if(val!.isEmpty){
            return "entre voter password";
          } else
        {
            return null;
          }
        },

        obscureText:visible,
        onChanged: widget.onChanged,
        cursorColor: kPrimaryColor,
        decoration:  InputDecoration(
          hintText: "Password",
          icon: const Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: IconButton(
            color: kPrimaryColor, icon:visible==true?  const Icon(Icons.visibility):const Icon(Icons.visibility_off), onPressed: () {
              setState(() {
                visible=!visible;
              });
          },
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
