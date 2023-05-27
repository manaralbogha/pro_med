import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pro_med/controller/cubit/cubit.dart';
import 'package:pro_med/shared/const/const.dart';

import 'controller/cubit/states.dart';
import 'modules/add_clinic_screen/add_clinic_screen.dart';
import 'modules/profile_screen/profile_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return ScreenUtilInit(
            builder: (context, state) {
              return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Flutter Demo',
                  theme: ThemeData(
                    primarySwatch: const MaterialColor(0xffE0E0E0, color),
                  ),
                  initialRoute: '/',
                  routes: {
                    '/': (context) => ProfileScreen(clinics: cubit.clinics),
                    '/AddClinicScreen': (context) => const AddClinicScreen(),
                  });
            },
          );
        },
      ),
    );
  }
}
