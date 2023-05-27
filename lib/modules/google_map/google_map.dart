// ignore_for_file: camel_case_types, prefer_const_declarations, prefer_final_fields, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class googleMap extends StatefulWidget {
  googleMap({super.key, required this.select, this.lat, this.lon});
  final bool select;
  var lat;
  var lon;

  @override
  State<googleMap> createState() => _googleMapState();
}

class _googleMapState extends State<googleMap> {
  Position? cl;

  CameraPosition? _kGooglePlex;
  Set<Marker>? _markers;

  Future getPosition() async {
    bool services;
    LocationPermission permeation;

    services = await Geolocator.isLocationServiceEnabled();
    print(services);
    if (services == false) {
      // do any thing if you wont;
    }

    permeation = await Geolocator.checkPermission();
    if (permeation == LocationPermission.denied) {
      permeation = await Geolocator.requestPermission();
    }
    print(permeation);
  }

  Future<void> getLatAndLong() async {
    cl = await Geolocator.getCurrentPosition().then((value) => value);
    widget.lat = cl!.latitude;
    widget.lon = cl!.longitude;
    location['lat'] = widget.lat;
    location['long'] = widget.lon;
    _kGooglePlex = CameraPosition(
      target: LatLng(widget.lat, widget.lon),
      zoom: 16.4746,
    );
    _markers = {
      Marker(
        markerId: MarkerId('1'),
        position: LatLng(cl!.latitude, cl!.longitude),
      )
    };
    setState(() {});
  }

  @override
  void initState() {
    if (widget.select == true) {
      getPosition();
      getLatAndLong();
    }
    super.initState();
  }

  Map<String, dynamic> location = {};
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    if (widget.select == false) {
      _kGooglePlex = CameraPosition(
        target: LatLng(widget.lat, widget.lon),
        zoom: 16.4746,
      );
      _markers = {
        Marker(
          markerId: MarkerId('1'),
          position: LatLng(widget.lat, widget.lon),
        )
      };
      setState(() {});
    }
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          _kGooglePlex == null
              ? Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Expanded(
                  child: GoogleMap(
                    onTap: (val) {
                      if (widget.select == true) {
                        widget.lat = val.latitude;
                        location['lat'] = widget.lat;

                        widget.lon = val.longitude;
                        location['long'] = widget.lon;
                        setState(() {
                          _markers!.clear();
                          _markers!.add(Marker(
                              markerId: MarkerId('1'),
                              position: LatLng(widget.lat!, widget.lon!),
                              onTap: () {},
                              draggable: true));
                        });
                      }
                    },
                    mapType: MapType.normal,
                    markers: _markers as Set<Marker>,
                    initialCameraPosition: _kGooglePlex as CameraPosition,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                ),
          if (widget.select == true)
            Container(
              padding: EdgeInsets.all(6),
              width: double.infinity,
              child: ElevatedButton(
                //  style: ButtonStyle(alignment: Alignment.),
                child: Text(
                  'Save Location',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onPressed: () async {
                  Navigator.pop(context, location);
                },
              ),
            ),
        ],
      ),
    );
  }
}
