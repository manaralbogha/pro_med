import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/cubit/cubit.dart';
import '../../controller/cubit/states.dart';
import '../../models/information_model.dart';
import '../../shared/components/app_bar_widget/app_bar_widget.dart';
import '../../shared/components/company_iformation_widget/company_iformation_widget.dart';
import 'widget/id_widget/id_widget.dart';
import 'widget/list_view_widget/list_view_widget.dart';
import 'widget/text_and_button_wiget/text_and_button_wiget.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key, this.clinics});
  List<InformationModel>? clinics;

  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
    final arg =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    if (arg != null) {
      clinics = arg['clinics'];
    }
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: appBarWidget(context, true),
          body: Column(
            children: [
              const IdWidget(),
              const TextAndButtonWidget(),
              ListViewWidget(
                clinics: clinics as List<InformationModel>,
              ),
              const CompanyInformationWidget(),
            ],
          ),
        );
      },
    );
  }
}
