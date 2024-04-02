import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final TextEditingController? controller;
  final bool? obsecuretext;
  final Widget? suffixIcon, prefixIcon;
  final TextStyle? style;
  const CustomField({super.key, this.controller, this.obsecuretext, this.suffixIcon, this.prefixIcon, this.style});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecuretext!,
      controller: controller,
      cursorColor: Colors.black,
      style: style,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: Colors.black, width: 1.5), gapPadding: 10),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: Colors.black, width: 1.5), gapPadding: 10),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      ),
      
    );
  }
}
