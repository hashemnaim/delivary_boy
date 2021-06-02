import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:delivery_boy/values/color.dart';

const double CAMERA_ZOOM = 13;
const double CAMERA_TILT = 0;
const double CAMERA_BEARING = 30;

class MyOrderMapScreen extends StatefulWidget {
  final double destinationLat;
  final double destinationLong;
  final double sorceLat;
  final double sorceLong;
  const MyOrderMapScreen(
      this.destinationLat, this.destinationLong, this.sorceLat, this.sorceLong);
  @override
  _MyOrderMapScreenState createState() => _MyOrderMapScreenState();
}

class _MyOrderMapScreenState extends State<MyOrderMapScreen> {
  // ApiGet apiGet = Get.find();
  BitmapDescriptor currentIcon1;

  GoogleMapController mapController;

  Set<Marker> markers = {};

  PolylinePoints polylinePoints;
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  double lat = 0;
  double long = 0;

  // Method for retrieving the current location
  getCurrentLocation() async {
    // try {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    LatLng myLocation = LatLng(position.latitude, position.longitude);

    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: myLocation, zoom: 15),
      ),
    );

    setState(() {});

    _createPolylines(
      Position(latitude: widget.sorceLat, longitude: widget.sorceLong),
      Position(
          latitude: widget.destinationLat, longitude: widget.destinationLong),
    );

    // );
    // } catch (e) {}
  }

  // Create the polylines for showing the route between two places
  _createPolylines(Position start, Position destination) async {
    polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      // 'AIzaSyCshVxu_yA5988W5ImSXUEQ3Mdq7BBz2eg', // Google Maps API Key
      'AIzaSyCshVxu_yA5988W5ImSXUEQ3Mdq7BBz2eg',
      PointLatLng(start.latitude, start.longitude),
      PointLatLng(destination.latitude, destination.longitude),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    PolylineId id = PolylineId('poly');
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.red,
      points: polylineCoordinates,
      width: 3,
    );

    polylines[id] = polyline;
    // Start Location Marker
    setState(() {});
 
    Marker startMarker = Marker(
      markerId: MarkerId('fffff'),
      position: LatLng(
        start.latitude,
        start.longitude,
      ),
      infoWindow: InfoWindow(
        title: 'موقع الأسرة',
      ),
      icon: BitmapDescriptor.defaultMarker,
    );

    // Destination Location Marker
    Marker destinationMarker = Marker(
      markerId: MarkerId('ffssfs'),
      position: LatLng(
        destination.latitude,
        destination.longitude,
      ),
      infoWindow: InfoWindow(
        title: 'موقع الزبون',
      ),
      icon: BitmapDescriptor.defaultMarker,
    );

    // Adding the markers to the list
    markers.add(startMarker);
    markers.add(destinationMarker);
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition initialLocation = CameraPosition(
        zoom: CAMERA_ZOOM,
        bearing: CAMERA_BEARING,
        tilt: CAMERA_TILT,
        target: LatLng(0, 0));
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(0),
        ),
        decoration: BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Stack(
          children: [
            GoogleMap(
              markers: markers != null ? Set<Marker>.from(markers) : null,
              initialCameraPosition: initialLocation,
              mapType: MapType.normal,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: false,
              polylines: Set<Polyline>.of(polylines.values),
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
            ),
            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child: Container(
            //     margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(20)),
            //     padding: EdgeInsets.all(ScreenUtil().setHeight(15)),
            //     height: ScreenUtil().setHeight(211),
            //     width: ScreenUtil().setWidth(350),
            //     decoration: BoxDecoration(
            //       color: Colors.orange,
            //       boxShadow: [
            //         BoxShadow(
            //           offset: Offset(0.00, 3.00),
            //           color: Colors.black.withOpacity(0.16),
            //           blurRadius: 6,
            //         ),
            //       ],
            //       borderRadius: getBoarderRadius(10.00),
            //     ),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.end,
            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       children: [
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Row(
            //               children: [
            //                 Text(
            //                   apiGet.orderuserDetailsMap
            //                       .value['purchase'][0]['end_request']
            //                       .toString()
            //                       .split(' ')[1],
            //                   style: getStyle(
            //                       whiteColor, FontWeight.w500, 16.sp),
            //                 ),
            //                 SizedBox(
            //                   width: ScreenUtil().setWidth(9),
            //                 ),
            //                 // SvgPicture.asset(alertPng),
            //               ],
            //             ),
            //             // Row(
            //             //   children: [
            //             //     Text(
            //             //       apiGet
            //             //                   .orderuserDetailsMap
            //             //                   .value['purchase'][0]['osra'][0]
            //             //                       ['address']
            //             //                   .toString()
            //             //                   .length >
            //             //               10
            //             //           ? '${apiGet.orderuserDetailsMap.value['purchase'][0]['osra'][0]['address'].toString().substring(0, 17)}...'
            //             //           : apiGet
            //             //               .orderuserDetailsMap
            //             //               .value['purchase'][0]['osra'][0]
            //             //                   ['address']
            //             //               .toString(),
            //             //       style: getStyle(
            //             //           whiteColor, FontWeight.w500, 16.sp),
            //             //     ),
            //             //     SizedBox(
            //             //       width: ScreenUtil().setWidth(9),
            //             //     ),
            //             //     Icon(
            //             //       FontAwesomeIcons.mapMarkerAlt,
            //             //       color: whiteColor,
            //             //       size: 30,
            //             //     ),
            //             //   ],
            //             // ),

            //           ],
            //         ),
            //         Padding(
            //           padding: EdgeInsets.symmetric(horizontal: 10.w),
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Text(
            //                 "وقت الانتهاء",
            //                 style: getStyle(
            //                     Color(0xffaf2f49), FontWeight.w700, 16.sp),
            //               ),
            //               Text(
            //                 "عنوان الاسرة ",
            //                 style: getStyle(
            //                     Color(0xffaf2f49), FontWeight.w700, 16.sp),
            //               ),
            //             ],
            //           ),
            //         ),
            //         Container(),
            //         Container(),
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceAround,
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Container(),
            //             Container(),
            //             Container(),
            //             Container(),
            //             Container(),
            //             Container(),
            //             Column(
            //               mainAxisAlignment: MainAxisAlignment.start,
            //               children: [
            //                 Text(
            //                   apiGet.orderuserDetailsMap.value['purchase'][0]
            //                       ['osra'][0]['name'],
            //                   style: getStyle(
            //                       whiteColor, FontWeight.w500, 16.sp),
            //                 ),
            //                 SizedBox(
            //                   height: 7.h,
            //                 ),
            //                 // Text(
            //                 //   apiGet.orderuserDetailsMap.value['purchase'][0]
            //                 //       ['osra'][0]['name'],
            //                 //   style: getStyle(Color(0xffaf2f49),
            //                 //       FontWeight.normal, 16.sp),
            //                 // )
            //               ],
            //             ),
            //             CachedNetworkImageShare(
            //                 apiGet.orderuserDetailsMap.value['purchase'][0]
            //                     ['osra'][0]['image'],
            //                 51,
            //                 54,
            //                 10),
            //           ],
            //         )
            //       ],
            //     ),
            //   ),
            // ),

            Directionality(
              textDirection: TextDirection.rtl,
              child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: ScreenUtil().setHeight(100),
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    automaticallyImplyLeading: true,
                    iconTheme: IconThemeData(color: orangeColor),
                    leading: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(FontAwesomeIcons.solidTimesCircle),
                    ),
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
