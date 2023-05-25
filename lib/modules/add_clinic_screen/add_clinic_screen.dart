import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pro_med/modules/add_clinic_screen/widget/table_available_and_rest_widget/table_available_and_rest_widget.dart';
import 'package:pro_med/shared/components/app_bar_widget/app_bar_widget.dart';

import '../../controller/cubit/cubit.dart';
import '../../controller/cubit/states.dart';
import '../../models/information_model.dart';
import '../../shared/components/company_iformation_widget/company_iformation_widget.dart';
import '../../shared/components/text_form_filed_widget.dart';
import '../google_map/google_map.dart';
import '../profile_screen/profile_screen.dart';
import 'widget/button_widget/button_widget.dart';
import 'widget/custome_drop_down_list.dart';

class AddClinicScreen extends StatelessWidget {
  const AddClinicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
            appBar: appBarWidget(context, false),
            body: SingleChildScrollView(
              child: Form(
                key: cubit.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset("assets/icons/icon_2.svg"),
                              SizedBox(
                                width: 13.w,
                              ),
                              Text(
                                "Clinics",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  decoration: TextDecoration.underline,
                                  color: const Color(0xff333333),
                                  letterSpacing: 1,
                                ),
                              ),
                              SizedBox(
                                width: 13.w,
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 15,
                                color: Color(0xffBDBDBD),
                              ),
                              SizedBox(
                                width: 13.w,
                              ),
                              Text(
                                "Clinic 1",
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xff333333),
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            "Basic Info",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff333333),
                              letterSpacing: 1,
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          BuildTextFormFiled(
                            labelText: "Clinic Name",
                            controller: cubit.clinicNameController,
                            textType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your  Clinic Name';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          CustomDropDownList(
                            hintText: "Specialty",
                            items: ["1", "2", "3"],
                            selectedOption: cubit.selectedSpecialty,
                            type: "Specialty",
                            // onChanged: (newValue) {
                            //   cubit.itemSelected(newValue, "specialty");
                            //   cubit.availableTimes.add({"mod": "10"});
                            // },
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          CustomDropDownList(
                            hintText: "Country",
                            items: ["1", "2", "3"],
                            selectedOption: cubit.selectedCountry,
                            type: "Country",
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          CustomDropDownList(
                            hintText: "City",
                            items: ["1", "2", "3"],
                            selectedOption: cubit.selectedCity,
                            type: "City",
                            // onChanged: (newValue) {
                            //   cubit.itemSelected(newValue, "city");
                            // },
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          BuildTextFormFiled(
                            labelText: "Region",
                            controller: cubit.regionController,
                            textType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your  Region';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          BuildTextFormFiled(
                            labelText: "District",
                            controller: cubit.districtController,
                            textType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your  District';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          BuildTextFormFiled(
                            labelText: "Street",
                            controller: cubit.streetController,
                            textType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your  Street';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const googleMap(
                                      select: true,
                                    );
                                  },
                                ),
                              ).then((dynamic value) {
                                cubit.lat = value['lat'];
                                cubit.long = value['long'];
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage(
                                      'assets/images/map.webp',
                                    ),
                                    fit: BoxFit.fill),
                                borderRadius: BorderRadius.circular(8.r),
                                color: const Color(0xffBDBDBD),
                              ),
                              height: 200.h,
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          BuildTextFormFiled(
                            labelText: "Phone Number",
                            controller: cubit.phoneNumberController,
                            textType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your  Phone Number';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Text(
                            "Available Hours",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                        ],
                      ),
                    ),
                    const TableAvailableAndRestWidget(),
                    const ButtonWidget(),
                    const CompanyInformationWidget()
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
