
import 'package:flutter/material.dart';
import 'package:roya_immobilie/View/page/auth/components/text_field_container.dart';

import '../../../../varia_ble/variable.dart';


class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;

  final ValueChanged<String> onChanged;
   RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
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
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
