import 'package:google_maps_flutter/google_maps_flutter.dart';

class InformationModel {
  final String clinicName;
  final String specialty;
  final String country;
  final String city;
  final String region;
  final String district;
  final String street;
  final String phoneNumber;
  final double lat;
  final double long;
  final Map<String, Map<String, String>>? available;
  // final Map<String, Map<String, String>>? rest;

  InformationModel({
    this.clinicName = "Clinic 1",
    this.specialty = "Dental",
    this.country = "Syria",
    this.city = "Damascus",
    this.region = "Midan",
    this.district = "Midan",
    this.street = "Korniesh",
    this.phoneNumber = "0934487928",
    this.lat = 33.45465656,
    this.long = 32.464564664,
    this.available,
    // = const [
    //   {"sunday": Time(from: "9:00", to: "5:00")},
    //   {"monday": Time(from: "9:00", to: "5:00")},
    //   {"tuesday": Time(from: "9:00", to: "5:00")},
    //   {"wednesday": Time(from: "9:00", to: "5:00")},
    //   {"thursday": Time(from: "9:00", to: "5:00")},
    //   {"saturday": Time(from: "9:00", to: "5:00")},
    // ],
    // this.rest,
    // = const [
    //   {"sunday": Time(from: "9:00", to: "5:00")},
    //   {"monday": Time(from: "9:00", to: "5:00")},
    //   {"tuesday": Time(from: "9:00", to: "5:00")},
    //   {"wednesday": Time(from: "9:00", to: "5:00")},
    //   {"thursday": Time(from: "9:00", to: "5:00")},
    //   {"saturday": Time(from: "9:00", to: "5:00")},
    // ],
  });
}

class Time {
  final String from;
  final String to;

  const Time({required this.from, required this.to});
}
