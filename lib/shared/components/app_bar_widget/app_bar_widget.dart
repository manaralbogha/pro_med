import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

PreferredSizeWidget appBarWidget(context, bool firstBag) {
  return AppBar(
    leading: Container(
      width: 7.1.w,
      height: 15.84.h,
      margin: const EdgeInsets.only(top: 4.08, left: 8.45),
      child: firstBag != true
          ? InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios_rounded,
                color: Color(0xff0094D9),
              ),
            )
          : const Icon(
              Icons.arrow_back_ios_rounded,
              color: Color(0xff0094D9),
            ),
    ),
    actions: [
      Container(
        margin: const EdgeInsets.only(
          right: 24,
          top: 24,
          bottom: 16,
        ),
        child: Center(
          child: Image.asset(
            'assets/images/image_1.png',
            width: 28.w,
            height: 24.h,
          ),
        ),
      ),
    ],
  );
}
