import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IdWidget extends StatelessWidget {
  const IdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(99, 203, 233, 0.1),
      height: 194.h,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 24.h, bottom: 16.h),
              child: CircleAvatar(
                radius: 48.r,
                backgroundImage: const AssetImage(
                  'assets/images/doctor_photo.avif',
                ),
              ),
            ),
            Text(
              "Dr.Ahmed khaled",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
                height: 1.h,
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              "Dentist",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xff828282),
                letterSpacing: 1,
                height: 1.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
