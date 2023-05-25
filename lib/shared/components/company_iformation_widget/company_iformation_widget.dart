import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CompanyInformationWidget extends StatelessWidget {
  const CompanyInformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 147.h,
      width: double.infinity,
      padding: EdgeInsets.only(top: 24.h, left: 24.w),
      color: Color.fromRGBO(52, 175, 224, 0.1),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/Image.png',
                  width: 28.w,
                  height: 24.h,
                ),
                SizedBox(
                  width: 10.w,
                ),
                SvgPicture.asset(
                  'assets/icons/icon_1.svg',
                  fit: BoxFit.scaleDown,
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              "About    Privacy Policy    Contact us ",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                letterSpacing: 1,
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            Text(
              "© 2023 Pro Med, Inc. All rights reserved. ",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
