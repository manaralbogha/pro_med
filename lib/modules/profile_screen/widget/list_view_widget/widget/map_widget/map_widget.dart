import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../google_map/google_map.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const googleMap(
                select: false,
              );
            },
          ),
        );
      },
      child: Container(
        width: 48.w,
        height: 48.h,
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage(
                'assets/images/map.webp',
              ),
              fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(4.r),
          color: Color(0xffBDBDBD),
        ),
        // child: googleMap(),
      ),
    );
  }
}
