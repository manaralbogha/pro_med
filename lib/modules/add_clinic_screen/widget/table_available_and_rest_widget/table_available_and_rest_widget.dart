import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../controller/cubit/cubit.dart';
import '../../../../controller/cubit/states.dart';
import '../custome_drop_down_list.dart';

class TableAvailableAndRestWidget extends StatelessWidget {
  const TableAvailableAndRestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFFFFF),
              border: Border.all(
                color: Color(0xffBDBDBD),
                width: 1.w,
              ),
              borderRadius: BorderRadius.circular(8.r),
            ),
            margin: EdgeInsets.only(left: 28.w, right: 28.w),
            height: 550.h,
            width: 996.w,
            padding: EdgeInsets.only(
              left: 24.w,
              top: 24.h,
            ),
            child: Row(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Days",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff828282),
                            ),
                          ),
                          SizedBox(
                            width: 138.w,
                          ),
                          Text(
                            "From",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff828282),
                            ),
                          ),
                          SizedBox(
                            width: 158.w,
                          ),
                          Text(
                            "to",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff828282),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          cubit.day.length,
                          (index) => Container(
                            margin: EdgeInsets.only(bottom: 16.h),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 96.w,
                                  child: Text(
                                    cubit.day[index],
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                SizedBox(
                                  width: 72.w,
                                ),
                                CustomDropDownList(
                                  hintText: "-",
                                  items: cubit.time,
                                  selectedOption: cubit.setFrom,
                                  typeTime: "from",
                                  index: index,
                                  // cubit
                                  //     .dayTime[cubit.day[index]],
                                  width: 120.w,
                                ),
                                SizedBox(
                                  width: 72.w,
                                ),
                                CustomDropDownList(
                                  hintText: "-",
                                  items: cubit.time,
                                  selectedOption: cubit.setTo,
                                  index: index,
                                  typeTime: "to",
                                  // cubit
                                  //   .dayTime[cubit.day[index]],
                                  width: 120.w,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 72.h,
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        "Rest Time",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff828282),
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          cubit.day.length,
                          (index) => Container(
                            margin: EdgeInsets.only(bottom: 16.h),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 72.w,
                                ),
                                CustomDropDownList(
                                  hintText: "From",
                                  items: cubit.time,
                                  selectedOption: cubit.setFrom,
                                  typeTime: "from",
                                  index: index,
                                  // cubit
                                  //     .dayTime[cubit.day[index]],
                                  width: 120.w,
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                CustomDropDownList(
                                  hintText: "to",
                                  items: cubit.time,
                                  selectedOption: cubit.setTo,
                                  index: index,
                                  typeTime: "to",
                                  // cubit
                                  //   .dayTime[cubit.day[index]],
                                  width: 120.w,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
