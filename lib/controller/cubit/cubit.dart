import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_med/controller/cubit/states.dart';

import '../../models/information_model.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());
  static HomeCubit get(context) => BlocProvider.of(context);

  final formKey = GlobalKey<FormState>();
  final clinicNameController = TextEditingController();
  final regionController = TextEditingController();
  final districtController = TextEditingController();
  final streetController = TextEditingController();
  final phoneNumberController = TextEditingController();

  //List<Map<String, String>> availableTimes = [];
  List<String> day = [
    "Saturday",
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday"
  ];
  String? setFrom, setTo;

  Map<String, Map<String, String>> dayTime = {
    "Saturday": {"from": "", "to": ""},
    "Sunday": {"from": "", "to": ""},
    "Monday": {"from": "", "to": ""},
    "Tuesday": {"from": "", "to": ""},
    "Wednesday": {"from": "", "to": ""},
    "Thursday": {"from": "", "to": ""},
    "Friday": {"from": "", "to": ""}
  };
  List<String> time = [
    "7:00 AM",
    "8:00 AM",
    "9:00 AM",
    "10:00 AM",
    "11:00 AM",
    "12:00 PM",
    "1:00 PM",
    "2:00 PM",
    "3:00 PM",
    "4:00 PM",
    "5:00 PM",
    "6:00 PM",
  ];

  double? lat;
  double? long;

  String? selectedSpecialty;
  String? selectedCountry;
  String? selectedCity;
  List<InformationModel> clinics = [
    InformationModel(),
    InformationModel(),
    InformationModel()
  ];

  void addClinic() {
    clinics.add(
      InformationModel(
        clinicName: clinicNameController.text,
        specialty: selectedSpecialty.toString(),
        country: selectedCountry.toString(),
        city: selectedCity.toString(),
        region: regionController.text,
        district: districtController.text,
        street: streetController.text,
        lat: lat!.toDouble(),
        long: long!.toDouble(),
        phoneNumber: phoneNumberController.text,
        available: dayTime,
      ),
    );
    emit(AddClinicState());
  }
}
