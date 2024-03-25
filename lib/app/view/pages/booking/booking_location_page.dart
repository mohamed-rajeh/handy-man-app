// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ser/components/constant/them.dart';
import 'package:ser/components/shared/my_button.dart';
import 'package:ser/components/shared/my_text_field.dart';

import '../../../../components/shared/my_lable.dart';
import '../../../model/service_model.dart';

//  AIzaSyBC3BEFOM5QFp1NJhfXXSGVCQHEQkaiy0o
class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(14.793241, 42.959272),
    zoom: 15.4746,
  );

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  CameraPosition? _kLocation;
  late Position position;
  Set<Marker> markers = {};
  Future getLocation() async {
    LocationPermission per;
    per = await Geolocator.checkPermission();
    if (per == LocationPermission.denied) {
      per = await Geolocator.requestPermission();
    }
    bool? service = await Geolocator.isLocationServiceEnabled();
    if (!service) Geolocator.openLocationSettings();

    if (service && per != LocationPermission.denied) {
      position = await Geolocator.getCurrentPosition();
    }
    _kLocation = CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 15.4746,
    );
    _goToTheLake();
    markers.add(Marker(
        markerId: MarkerId("1"),
        icon: await BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, "images/marker.png"),
        position: LatLng(position.latitude, position.longitude)));
    setState(() {});
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLocation!));
  }

  @override
  void initState() {
    getLocation();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Service? service = Get.arguments;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text("location".tr),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 16 / 12,
                  child: Container(
                    padding: EdgeInsets.all(6),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        border:
                            Border.all(width: 2, color: MyThem.secondaryColor),
                        borderRadius: BorderRadius.circular(20)),
                    child: GoogleMap(
                      markers: markers,
                      myLocationButtonEnabled: true,
                      myLocationEnabled: true,
                      mapType: MapType.normal,
                      initialCameraPosition: BookingPage._kGooglePlex,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                    ),
                  ),
                ),
                Center(
                    child: _kLocation != null
                        ? null
                        : LinearProgressIndicator(
                            color: MyThem.accentColor,
                          )),
                SizedBox(height: 30),
                MyLabel(text: "Note", minTextSize: 20),
                SizedBox(height: 16),
                MyTextField(
                  maxLine: 10,
                  hint: "hintLocationNote".tr,
                ),
                Spacer(),
                MyButton(
                    onTap: () {
                      getLocation();
                    },
                    lable: "contenuu",
                    color: MyThem.secondaryColor),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//  Get.toNamed("/booking_details", arguments: service),
