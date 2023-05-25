import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildTextFormFiled extends StatelessWidget {
  final String? labelText;
  final TextEditingController? controller;
  final Widget? iconPri;
  final Widget? iconSuf;
  final String? Function(String?)? validator;
  final TextInputType textType;
  final bool obscureText;

  const BuildTextFormFiled({
    super.key,
    required this.labelText,
    required this.controller,
    this.iconPri,
    this.iconSuf,
    this.validator,
    required this.textType,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(8.r),
      child: TextFormField(
        obscureText: obscureText,
        keyboardType: textType,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: iconPri,
          suffix: iconSuf,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffE0E0E0),
            ),
          ),
          border: OutlineInputBorder(
            // borderSide: BorderSide(color: Color(0xffE0E0E0)),
            borderRadius: BorderRadius.circular(8.0.r),
          ),
          // enabledBorder: UnderlineInputBorder(
          //   borderSide: BorderSide(color: Colors.grey),
          //   borderRadius: BorderRadius.circular(10.0),
          // ),
        ),
      ),
    );
  }
}
