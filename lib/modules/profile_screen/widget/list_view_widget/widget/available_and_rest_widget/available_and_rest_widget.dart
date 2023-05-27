import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../models/information_model.dart';
import 'widget/row_widget/row_widget.dart';

class AvailableAndRestWidget extends StatelessWidget {
  const AvailableAndRestWidget({super.key, required this.clinic});
  final InformationModel clinic;

  @override
  Widget build(BuildContext context) {
    String? available1 = '';
    clinic.available!.forEach((key, value) {
      // if (clinic.available![key]!["form"] != null) {
      available1 = "$available1 $key $value , ";
      //}

      return;
    });

    return Container(
      margin: EdgeInsets.only(
        top: 12.h,
        bottom: 16.h,
      ),
      padding: EdgeInsets.only(
        left: 16.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(
          color: const Color(0xffBDBDBD),
          width: 1.w,
        ),
      ),
      height: 64.h,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RowWidget(
            text: available1.toString(),
          ),
          Divider(
            color: const Color(0xffE0E0E0),
            thickness: 1.h,
          ),
          const RowWidget(text: "rest"),
        ],
      ),
    );
  }
}
