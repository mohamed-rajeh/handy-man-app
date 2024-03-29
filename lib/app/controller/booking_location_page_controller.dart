import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ser/app/model/service_model.dart';

class BookingLocationPageController extends GetxController {
  Service? service = Get.arguments is Service ? Get.arguments : null;

  // map to biuld my custom marker
  Set<Marker> markers = {};

  // to get details of locattion like  city..
  late List<Placemark> locations;

  // inital postion "the center of Hodidah City"
  LatLng intPostion = const LatLng(14.793241, 42.959272);

  // map controller
  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

  // Location note controller
  TextEditingController locationNoteController = TextEditingController();

  // the current Location
  CameraPosition? currentLocation;

  //  the current postion
  late Position _currentPostion;

  Position get currentPostion => _currentPostion;

  set currentPostion(Position value) {
    _currentPostion = value;
  }

  // function to change location
  Future<void> goToNewLocation() async {
    final GoogleMapController controller = await mapController.future;

    await controller
        .animateCamera(CameraUpdate.newCameraPosition(currentLocation!));
  }

  // function to get the current location
  Future getCurrentLoaction() async {
    LocationPermission per;
    // check if we have permtion
    per = await Geolocator.checkPermission();
    if (per == LocationPermission.denied) {
      // ask for Permission if we dont have
      per = await Geolocator.requestPermission();
    }

    bool? service = await Geolocator.isLocationServiceEnabled();
    // ask to open location service if is close
    if (!service) Geolocator.openLocationSettings();

    if (service && per != LocationPermission.denied) {
      // get the current postion
      currentPostion = await Geolocator.getCurrentPosition();
    }
    // get the current location
    currentLocation = CameraPosition(
      target: LatLng(currentPostion.latitude, currentPostion.longitude),
      zoom: 15.4746,
    );

    // to move the Camera to current location
    goToNewLocation();
  }

  // to add custom marker
  _addMarker() async {
    markers.add(Marker(
        markerId: const MarkerId("1"),
        icon: await BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, "images/marker.png"),
        position: intPostion));
  }

  changePostion(CameraPosition position) async {
    intPostion = position.target;
    _addMarker();
    update();
  }

  @override
  void onInit() {
    _addMarker();
    super.onInit();
  }
}
