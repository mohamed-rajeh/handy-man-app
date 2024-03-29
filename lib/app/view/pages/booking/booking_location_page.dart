// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:geocoding/geocoding.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ser/app/controller/booking_location_page_controller.dart';
import 'package:ser/app/model/order_model.dart';
import 'package:ser/app/view/pages/booking/booking_details_page.dart';
import 'package:ser/components/constant/them.dart';
import 'package:ser/components/shared/my_button.dart';
import 'package:ser/components/shared/my_text_field.dart';

import '../../../../components/shared/my_lable.dart';

//  AIzaSyBC3BEFOM5QFp1NJhfXXSGVCQHEQkaiy0o
class BookingPage extends StatefulWidget {
  static const String id = "/bookin_location";
  const BookingPage({super.key});
//  the intial postion

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final BookingLocationPageController _pageController =
      Get.put(BookingLocationPageController());

// !

  @override
  void initState() {
    // _pageController.getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text("location".tr),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 12,
              child: Container(
                padding: EdgeInsets.all(6),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: MyThem.secondaryColor),
                    borderRadius: BorderRadius.circular(20)),
                child: GoogleMap(
                  markers: _pageController.markers,
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                    target: _pageController.intPostion,
                    zoom: 15.4746,
                  ),
                  onCameraMove: (currentPostion) {
                    _pageController.changePostion(currentPostion);

                    setState(() {});
                  },
                  onMapCreated: (GoogleMapController controller) {
                    _pageController.mapController.complete(controller);
                  },
                ),
              ),
            ),
            Center(
                child: _pageController.currentLocation != null
                    ? null
                    : LinearProgressIndicator(
                        color: MyThem.accentColor,
                      )),
            SizedBox(height: 30),
            MyLabel(text: "Note", minTextSize: 20),
            SizedBox(height: 16),
            MyTextField(
              controller: _pageController.locationNoteController,
              maxLine: 10,
              hint: "hintLocationNote".tr,
            ),
            Spacer(),
            MyButton(
                onTap: () async {
                  //  to get the ciyt and street
                  _pageController.locations = await placemarkFromCoordinates(
                      _pageController.intPostion.latitude,
                      _pageController.intPostion.longitude);
                  Get.offNamed(BookingDetailsPage.id, arguments: {
                    "order": Order(
                        service: _pageController.service,
                        lat: _pageController.intPostion.latitude,
                        long: _pageController.intPostion.longitude,
                        locationNote:
                            _pageController.locationNoteController.text),
                    "location": _pageController.locations[0]
                  });
                },
                lable: "contenuu",
                color: MyThem.secondaryColor),
          ],
        ),
      ),
    );
  }
}
