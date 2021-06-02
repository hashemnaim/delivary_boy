import 'package:delivery_boy/backend/api_get.dart';
import 'package:delivery_boy/features/delivery/screens/change_locations%20copy.dart';
import 'package:delivery_boy/features/delivery/screens/new_delivery_order_screen.dart';
import 'package:delivery_boy/features/delivery/screens/profile_delivery_screen.dart';
import 'package:delivery_boy/features/delivery/widgets/custom_nav_bottom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  final List<Widget> widgetOptions = <Widget>[
    NewOrderDeliveryScreen(),
    ChangeLocationLiveScreen(title: "تحديد الموقع"),
    ProfileDeliveryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<ApiGet>(
          init: ApiGet(),
          builder: (controller) {
            return widgetOptions[controller.indexNav];
          },
        ),
        bottomNavigationBar: CustomNavBottom());
  }
}
