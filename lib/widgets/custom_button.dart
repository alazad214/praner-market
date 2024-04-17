import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Custom_Button extends StatelessWidget {
  const Custom_Button({super.key, required this.text, this.color, this.ontap});
  final String text;
  final Color? color;
  final ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: color ?? Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.blueAccent)),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
