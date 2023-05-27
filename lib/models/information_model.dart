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

  InformationModel(
      {this.clinicName = "Clinic 1",
      this.specialty = "Dental",
      this.country = "Syria",
      this.city = "Damascus",
      this.region = "Midan",
      this.district = "Midan",
      this.street = "Korniesh",
      this.phoneNumber = "0934487928",
      this.lat = 33.5040050747216,
      this.long = 36.287138387560844,
      this.available = const {
        "Saturday": {"from": "1", "to": "2"},
        "Sunday": {"from": "3", "to": "4"},
        "Monday": {"from": "5", "to": "6"},
        "Tuesday": {"from": "7", "to": "8"},
        "Wednesday": {"from": "9", "to": "10"},
        "Thursday": {"from": "11", "to": "12"},
        "Friday": {"from": "13", "to": "14"}
      }});
}

class Time {
  final String from;
  final String to;

  const Time({required this.from, required this.to});
}
