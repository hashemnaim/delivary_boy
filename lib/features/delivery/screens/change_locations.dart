import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:delivery_boy/backend/server.dart';
import 'package:delivery_boy/components/widgets/custom_button.dart';
import 'package:delivery_boy/values/color.dart';
import 'package:delivery_boy/values/common.dart';

class ChangeLocationScreen extends StatefulWidget {
  bool isOsra;
  ChangeLocationScreen(this.isOsra);
  @override
  _ChangeLocationScreenState createState() => _ChangeLocationScreenState();
}

class _ChangeLocationScreenState extends State<ChangeLocationScreen> {
  final LatLng _center = LatLng(31.509557, 34.421466);

  Set<Marker> myMarker = {};
  BitmapDescriptor currentIcon;

  GoogleMapController controller;
  String locationName;
  // String searchAddress;
  double lat = 0;

  double long = 0;
  // getCustomIcon() async {
  //   BitmapDescriptor bitmapDescriptor = await BitmapDescriptor.fromAssetImage(
  //       ImageConfiguration.empty, markerPng);
  //   currentIcon = bitmapDescriptor;
  //   setState(() {});
  // }

  getPlaceName(LatLng position) async {
    try {
      List<Address> addresses = await Geocoder.local
          .findAddressesFromCoordinates(
              Coordinates(position.latitude, position.longitude));
      Address first = addresses[0];
      locationName = first.addressLine;
      setState(() {});
    } catch (e) {}
  }

  getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      LatLng myLocation = LatLng(position.latitude, position.longitude);
      myMarker.add(
        Marker(
          markerId: MarkerId("MyLocation"),
          position: myLocation,
          icon: currentIcon,
        ),
      );
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: myLocation, zoom: 15),
        ),
      );
      lat = position.latitude;
      long = position.longitude;
      getPlaceName(myLocation);

      setState(() {});
    } catch (e) {}
  }

  searchandNavigate(String searchAddress) async {
    try {
      List<Location> result = await locationFromAddress(searchAddress);

      controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(result[0].latitude, result[0].longitude),
          zoom: 10.0)));
      myMarker.clear();
      myMarker.add(
        Marker(
          markerId:
              MarkerId("Gps${LatLng(result[0].latitude, result[0].longitude)}"),
          position: LatLng(result[0].latitude, result[0].longitude),
          icon: currentIcon,
        ),
      );
      lat = result[0].latitude;
      long = result[0].longitude;
      getPlaceName(LatLng(lat, long));

      setState(() {});
    } catch (e) {}
  }

  @override
  void initState() {
    // getCustomIcon();
    getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: orangeColor,
        appBar: AppBar(
          backgroundColor: orangeColor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "تغيير الموقع",
            textAlign: TextAlign.right,
            style: getStyle(whiteColor, FontWeight.w700, 20),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: ScreenUtil().setHeight(20),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.00),
                  topRight: Radius.circular(20.00),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(0),
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                  ),
                  child: Stack(
                    children: [
                      SizedBox(
                        height: ScreenUtil().setHeight(20),
                      ),
                      GoogleMap(
                        onMapCreated: (GoogleMapController controller) {
                          getCurrentLocation();
                          this.controller = controller;
                          setState(() {});
                        },
                        initialCameraPosition: CameraPosition(
                          target: _center,
                          zoom: 30.0,
                        ),
                        markers: myMarker,
                        onTap: (argument) {
                          myMarker.clear();
                          myMarker.add(
                            Marker(
                              markerId: MarkerId("Gps$argument"),
                              position: argument,
                              icon: currentIcon,
                            ),
                          );
                          lat = argument.latitude;
                          long = argument.longitude;
                          getPlaceName(LatLng(lat, long));

                          setState(() {});
                        },
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: ScreenUtil().setHeight(20),
                              ),
                              Text(
                                "قم بإدخال الموقع يدويا ",
                                textAlign: TextAlign.right,
                                style:
                                    getStyle(blackColor, FontWeight.normal, 20),
                              ),
                              SizedBox(
                                height: ScreenUtil().setHeight(15),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: ScreenUtil().setWidth(20)),
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Container(
                                    height: ScreenUtil().setHeight(48),
                                    width: ScreenUtil().setWidth(335),
                                    decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: getBoarderRadius(18),
                                      border: Border.all(
                                        width: 0.50,
                                        color: blackOpacityColor,
                                      ),
                                    ),
                                    child: ClipRRect(
                                      clipBehavior: Clip.antiAlias,
                                      borderRadius: getBoarderRadius(20),
                                      child: TextFormField(
                                        onChanged: (value) {},
                                        onFieldSubmitted: (value) {
                                          try {
                                            searchandNavigate(value);
                                          } catch (e) {}
                                        },
                                        decoration: InputDecoration(
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          contentPadding: EdgeInsets.only(
                                              top: 5, left: 10, right: 10),
                                          // hintText: 'بحث عن أطباق',
                                          hintStyle: getStyle(
                                              grayColor, FontWeight.normal, 14),
                                          fillColor: whiteColor,
                                          filled: true,
                                          border: OutlineInputBorder(
                                            borderRadius: getBoarderRadius(20),
                                            borderSide: BorderSide(width: 0),
                                          ),
                                          prefixIcon: Icon(
                                            FontAwesomeIcons.mapMarkerAlt,
                                            color: orangeColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(90),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: ScreenUtil().setHeight(30)),
                            child: CustomButton(
                              title: 'حفظ',
                              onTap: () async {
                                FocusScope.of(context).unfocus();

                                await Server.server.updatelocation(
                                  this.lat.toString(),
                                  this.long.toString(),
                                  this.locationName == null
                                      ? ''
                                      : locationName,
                                  widget.isOsra,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
