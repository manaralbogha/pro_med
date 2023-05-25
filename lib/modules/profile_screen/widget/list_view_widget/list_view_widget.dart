import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../models/information_model.dart';
import 'widget/available_and_rest_widget/available_and_rest_widget.dart';
import 'widget/map_widget/map_widget.dart';
import 'widget/title_widget/title_widget.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key, required this.clinics});
  final List<InformationModel> clinics;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: const Color(0xffF2F2F2),
            ),
            width: 312.w,
            height: 208.h,
            margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const MapWidget(),
                      SizedBox(
                        width: 12.w,
                      ),
                      TitleWidget(clinic: clinics[index]),
                    ],
                  ),
                  AvailableAndRestWidget(clinic: clinics[index]),
                  Text(
                    "Appointment Times",
                    style: TextStyle(
                      color: const Color(0xff0094D9),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    "Or Book by Number: 0934487928",
                    style: TextStyle(
                      color: const Color(0xff0094D9),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: clinics.length,
      ),
    );
  }
}
