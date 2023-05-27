import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../models/information_model.dart';
import '../../../../../google_map/google_map.dart';

class MapWidget extends StatelessWidget {
  MapWidget({super.key, this.clinic});
  InformationModel? clinic;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return googleMap(
                select: false,
                lat: clinic!.lat,
                lon: clinic!.long,
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
