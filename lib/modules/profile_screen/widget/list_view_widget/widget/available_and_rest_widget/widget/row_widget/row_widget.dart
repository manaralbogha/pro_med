import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 230.w,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
            maxLines: 1,
            overflow: TextOverflow.fade,
          ),
        ),
        InkWell(
          onTap: () {},
          child: const Icon(
            Icons.more_horiz,
            color: Color(0xff34AFE0),
          ),
        )
      ],
    );
  }
}
