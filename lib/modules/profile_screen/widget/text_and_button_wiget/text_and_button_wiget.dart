import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../add_clinic_screen/add_clinic_screen.dart';

class TextAndButtonWidget extends StatelessWidget {
  const TextAndButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        children: [
          SizedBox(
            height: 35.h,
          ),
          Text(
            "My Clinic",
            style: TextStyle(
                fontSize: 16.sp, fontWeight: FontWeight.w700, letterSpacing: 1),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/AddClinicScreen');
            },
            child: Row(
              children: [
                const Icon(
                  Icons.add,
                  color: Color(0xff0094D9),
                ),
                Text(
                  "Add Clinic",
                  style: TextStyle(
                    color: const Color(0xff0094D9),
                    fontSize: 16.sp,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
