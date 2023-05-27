import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../controller/cubit/cubit.dart';
import '../../../../controller/cubit/states.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Container(
          margin: const EdgeInsets.all(24),
          width: 312.w,
          height: 48.h,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff34AFE0),
              foregroundColor: const Color(0xffFFFFFF),
              elevation: 8,
              shadowColor: const Color.fromRGBO(6, 129, 180, 0.25),
              textStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
              ),
            ),
            onPressed: () {
              if (cubit.formKey.currentState!.validate()) {
                if (cubit.selectedSpecialty != null &&
                    cubit.selectedCountry != null &&
                    cubit.selectedCity != null &&
                    cubit.lat != null &&
                    cubit.long != null) {
                  cubit.addClinic();
                  SchedulerBinding.instance.addPostFrameCallback((_) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/',
                        arguments: {
                          'clinics': cubit.clinics,
                        },
                        (Route<dynamic> route) => false);
                  });
                } else {
                  const snackBar = SnackBar(
                    content: Text('Please enter all information',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20)),
                    backgroundColor: Colors.red,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              }

              print(cubit.clinics);
            },
            child: const Text("Save"),
          ),
        );
      },
    );
  }
}
