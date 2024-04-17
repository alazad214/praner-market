import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Custom_formField extends StatelessWidget {
  const Custom_formField(
      {super.key,
      this.hinttext,
      this.prefixicon,
      this.validation,
      this.obscuretext, this.onchanged});

  final hinttext;
  final IconData? prefixicon;
  final validation;
  final obscuretext;
  final onchanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onchanged,
      validator: validation,
      obscureText: obscuretext ?? false,
      decoration: InputDecoration(
        hintText: hinttext,

        prefixIcon: Icon(prefixicon),
        filled: true,
        fillColor: Colors.white,

        //enable-->
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: BorderSide(color: Colors.blue, width: 2),
        ),
        //focus-->
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.green,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(14.0),
        ),
        //focus-->
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(14.0),
        ),
      ),
    );
  }
}
