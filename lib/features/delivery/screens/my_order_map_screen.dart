import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:delivery_boy/backend/api_get.dart';
import 'package:delivery_boy/backend/server.dart';
import 'package:delivery_boy/components/widgets/custom_button.dart';
import 'package:delivery_boy/features/delivery/screens/profile_delivery_screen.dart';
import 'package:delivery_boy/values/color.dart';
import 'package:delivery_boy/values/common.dart';

const double CAMERA_ZOOM = 13;
const double CAMERA_TILT = 0;
const double CAMERA_BEARING = 30;

class MyOrderMapScreen extends StatefulWidget {
  @override
  _MyOrderMapScreenState createState() => _MyOrderMapScreenState();
}

class _MyOrderMapScreenState extends State<MyOrderMapScreen> {
  BitmapDescriptor currentIcon1;
  getCustomIcon() async {
    BitmapDescriptor bitmapDescriptor = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, 'assets/svgs/current_location.png');
    currentIcon1 = bitmapDescriptor;
    setState(() {});
  }

  ApiGet apiGet = Get.find();
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
    
    this.lat = position.latitude;
    this.long = position.longitude;
    setState(() {});
// apiGet.orderDeliveryDetailsMap['order']['original']['request']['osra'][0][0]
    _createPolylines(
      Position(latitude: position.latitude, longitude: position.longitude),
      Position(
          latitude:
              double.parse(apiGet.orderDeliveryDetailsMap['osra']['latitude']),
          longitude: double.parse(
              apiGet.orderDeliveryDetailsMap['osra']['longitude'])),
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
        title: 'موقعي',
      ),
      icon: BitmapDescriptor.defaultMarker,
      // icon: currentIcon1,
    );

    // Destination Location Marker
    Marker destinationMarker = Marker(
      markerId: MarkerId('ffssfs'),
      position: LatLng(
        destination.latitude,
        destination.longitude,
      ),
      infoWindow: InfoWindow(
        title: 'موقع الأسرة',
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
    getCustomIcon();
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition initialLocation = CameraPosition(
        zoom: CAMERA_ZOOM,
        bearing: CAMERA_BEARING,
        tilt: CAMERA_TILT,
        target: LatLng(0, 0));
    return Scaffold(
      backgroundColor: orangeColor,
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
            GetBuilder<ApiGet>(
                id: 'listtt',
                builder: (controller) {
                  
                  return apiGet.orderDeliveryDetailsMap.length == 0
                      ? loading()
                      : Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin: EdgeInsets.only(
                                bottom: ScreenUtil().setHeight(20)),
                            padding: EdgeInsets.all(ScreenUtil().setHeight(15)),
                            height: ScreenUtil().setHeight(382),
                            width: ScreenUtil().setWidth(350),
                            decoration: BoxDecoration(
                              color: whiteColor,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0.00, 3.00),
                                  color: blackColor.withOpacity(0.16),
                                  blurRadius: 6,
                                ),
                              ],
                              borderRadius: getBoarderRadius(10.00),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "الإجمالي",
                                          textAlign: TextAlign.right,
                                          style: getStyle(blackColor,
                                              FontWeight.normal, 16),
                                        ),
                                        SizedBox(
                                          height: ScreenUtil().setHeight(5),
                                        ),
                                        Text(
                                          '${(double.parse(apiGet.orderDeliveryDetailsMap['total']) + double.parse(apiGet.orderDeliveryDetailsMap['cost_delivery'])).toStringAsFixed(2)}',
                                          // + double.parse(apiGet.orderDeliveryDetailsMap['purchase'][0]['cost_delivery'])}',
                                          textAlign: TextAlign.right,
                                          style: getStyle(orangeColor,
                                              FontWeight.normal, 16),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "التوصيل",
                                          textAlign: TextAlign.right,
                                          style: getStyle(blackColor,
                                              FontWeight.normal, 16),
                                        ),
                                        SizedBox(
                                          height: ScreenUtil().setHeight(5),
                                        ),
                                        Text(
                                          double.parse(apiGet.orderDeliveryDetailsMap[
                                                  'cost_delivery'])
                                              .toStringAsFixed(2),
                                          textAlign: TextAlign.right,
                                          style: getStyle(orangeColor,
                                              FontWeight.normal, 16),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "سعر المنتج ",
                                          textAlign: TextAlign.right,
                                          style: getStyle(blackColor,
                                              FontWeight.normal, 16),
                                        ),
                                        SizedBox(
                                          height: ScreenUtil().setHeight(5),
                                        ),
                                        Text(
                                          apiGet
                                              .orderDeliveryDetailsMap['total'],
                                          textAlign: TextAlign.right,
                                          style: getStyle(orangeColor,
                                              FontWeight.normal, 16),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                "موقع الزبون ",
                                                textAlign: TextAlign.right,
                                                style: getStyle(blackColor,
                                                    FontWeight.normal, 16),
                                              ),
                                              SizedBox(
                                                height:
                                                    ScreenUtil().setHeight(5),
                                              ),
                                              apiGet
                                                          .orderDeliveryDetailsMap[
                                                              'user']
                                                              ['address_user']
                                                          .length >
                                                      10
                                                  ? Text(
                                                      '${apiGet.orderDeliveryDetailsMap['user']['address_user'].toString().substring(0, 15)}...' ??
                                                          'لا يوجد موقع',
                                                      textAlign:
                                                          TextAlign.right,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: getStyle(
                                                          blackColor,
                                                          FontWeight.w300,
                                                          16),
                                                    )
                                                  : Text(
                                                      apiGet.orderDeliveryDetailsMap[
                                                                  'user'][
                                                              'address_user'] ??
                                                          'لا يوجد موقع',
                                                      textAlign:
                                                          TextAlign.right,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: getStyle(
                                                          blackColor,
                                                          FontWeight.w300,
                                                          16),
                                                    ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: ScreenUtil().setWidth(9),
                                          ),
                                          Icon(
                                            FontAwesomeIcons.mapMarkerAlt,
                                            color: orangeColor,
                                            size: 30,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                "موقع الأسرة ",
                                                textAlign: TextAlign.right,
                                                style: getStyle(blackColor,
                                                    FontWeight.normal, 16),
                                              ),
                                              SizedBox(
                                                height:
                                                    ScreenUtil().setHeight(5),
                                              ),
                                              apiGet
                                                          .orderDeliveryDetailsMap[
                                                              'osra']['address']
                                                          .length >
                                                      10
                                                  ? Text(
                                                      '${apiGet.orderDeliveryDetailsMap['osra']['address'].toString().substring(0, 15)}...' ??
                                                          'لا يوجد موقع',
                                                      textAlign:
                                                          TextAlign.right,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: getStyle(
                                                          blackColor,
                                                          FontWeight.w300,
                                                          16),
                                                    )
                                                  : Text(
                                                      apiGet.orderDeliveryDetailsMap[
                                                                  'osra']
                                                              ['address'] ??
                                                          'لا يوجد موقع',
                                                      textAlign:
                                                          TextAlign.right,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: getStyle(
                                                          blackColor,
                                                          FontWeight.w300,
                                                          16),
                                                    ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: ScreenUtil().setWidth(9),
                                          ),
                                          Icon(
                                            FontAwesomeIcons.mapMarkerAlt,
                                            color: orangeColor,
                                            size: 30,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(),
                                    Row(
                                      children: [
                                        Text(
                                          apiGet.orderDeliveryDetailsMap['user']
                                                  ['jawwal']
                                              .toString(),
                                          textAlign: TextAlign.right,
                                          style: getStyle(blackColor,
                                              FontWeight.normal, 16),
                                        ),
                                        SizedBox(
                                          width: ScreenUtil().setWidth(15),
                                        ),
                                        Icon(
                                          FontAwesomeIcons.phoneAlt,
                                          color: orangeColor,
                                          size: 25,
                                        ),
                                      ],
                                    ),
                                    Container(),
                                    Container(),
                                    Container(),
                                    Row(
                                      children: [
                                        Text(
                                          apiGet.orderDeliveryDetailsMap['osra']
                                              ['jawwal'],
                                          textAlign: TextAlign.right,
                                          style: getStyle(blackColor,
                                              FontWeight.normal, 16),
                                        ),
                                        SizedBox(
                                          width: ScreenUtil().setWidth(15),
                                        ),
                                        Icon(
                                          FontAwesomeIcons.phoneAlt,
                                          color: orangeColor,
                                          size: 25,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "وقت التوصيل",
                                          textAlign: TextAlign.right,
                                          style: getStyle(blackColor,
                                              FontWeight.normal, 16),
                                        ),
                                        SizedBox(
                                          height: ScreenUtil().setHeight(5),
                                        ),
                                        Text(
                                          apiGet.orderDeliveryDetailsMap[
                                                  'end_request']
                                              .split(' ')[1],
                                          textAlign: TextAlign.right,
                                          style: getStyle(Color(0xff787878),
                                              FontWeight.w300, 16),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: ScreenUtil().setWidth(9),
                                    ),
                                    Icon(
                                      Icons.access_alarm,
                                      color: orangeColor,
                                      size: 30,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CustomButton(
                                      title: 'لا أوافق',
                                      width: 129,
                                      colorButton: whiteColor,
                                      onTap: () {
                                        FocusScope.of(context).unfocus();
                                        Server.server.getProfile();
                                        Get.off(ProfileDeliveryScreen());

                                        // Server.server.changestatusdelivery(
                                        //     apiGet.orderDeliveryDetailsMap['purchase'][0]['request_id'],
                                        //     '');
                                      },
                                    ),
                                    CustomButton(
                                      title: 'أوافق',
                                      width: 129,
                                      onTap: () {
                                        // FocusScope.of(context).unfocus();

                                        Server.server.changestatusdelivery(
                                            apiGet.orderDeliveryDetailsMap[
                                                'request_id'],
                                            '10',
                                            apiGet.orderDeliveryDetailsMap[
                                                'osra_id']);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                }),
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
