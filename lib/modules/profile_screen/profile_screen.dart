import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/cubit/cubit.dart';
import '../../controller/cubit/states.dart';
import '../../shared/components/app_bar_widget/app_bar_widget.dart';
import '../../shared/components/company_iformation_widget/company_iformation_widget.dart';
import 'widget/id_widget/id_widget.dart';
import 'widget/list_view_widget/list_view_widget.dart';
import 'widget/text_and_button_wiget/text_and_button_wiget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
            appBar: appBarWidget(context, true),
            body: Column(
              children: [
                const IdWidget(),
                const TextAndButtonWidget(),
                ListViewWidget(
                  clinics: cubit.clinics,
                ),
                const CompanyInformationWidget(),
              ],
            ),
          );
        },
      ),
    );
  }
}
