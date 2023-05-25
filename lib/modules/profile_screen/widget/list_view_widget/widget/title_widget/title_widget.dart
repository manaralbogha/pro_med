import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../models/information_model.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key, required this.clinic});
  final InformationModel clinic;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          clinic.clinicName,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.w,
            color: const Color(0xff333333),
          ),
        ),
        Text(
          "${clinic.city} ${clinic.country}",
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.w,
            color: const Color(0xff828282),
          ),
        )
      ],
    );
  }
}
