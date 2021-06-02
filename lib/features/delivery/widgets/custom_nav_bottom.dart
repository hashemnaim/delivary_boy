import 'package:delivery_boy/backend/api_get.dart';
import 'package:delivery_boy/features/delivery/screens/new_delivery_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../main_screen.dart';
import 'animate_do.dart';
import 'custom_Item_nav_bottom.dart';

class CustomNavBottom extends StatefulWidget {
  // bool internalScreen;

  CustomNavBottom();

  @override
  _CustomNavBottomState createState() => _CustomNavBottomState();
}

class _CustomNavBottomState extends State<CustomNavBottom> {
  ApiGet appGet = Get.find();
  @override
  Widget build(BuildContext context) {
    int color = appGet.indexNav;

    return CustomBottomAppBar(
        onTabSelected: (index) {
          appGet.setindexNav(index);
          Get.to(() => MainScreen());
          setState(() {
            color = index;
            print(color);
          });
        },
        items: [
       
       
          CustomAppBarItem(
              icon: Padding(
                padding:
                    color == 0 ? EdgeInsets.all(10.0) : EdgeInsets.all(0.0),
                child: Dance(
                        child: SvgPicture.asset(
                        "assets/svgs/check_complete.svg",
                        color: color == 0? Colors.white : Colors.grey,
                        // width: 50,
                        // height: 50,
                        // fit: BoxFit.cover,
                      )),
                   
              ),
              index: false,
              hasNotification: false),
           CustomAppBarItem(
              icon: Padding(
                padding:
                    color == 1 ? EdgeInsets.all(14.0) : EdgeInsets.all(0.0),
                child: SvgPicture.asset(
                  "assets/svgs/home.svg",
                  color: color == 1 ? Colors.white : Colors.grey,
                ),
              ),
              index: false,
              //     title: translator.translate("main"),
              hasNotification: false),
    
          CustomAppBarItem(
              icon: Padding(
                  padding:
                      color == 2 ? EdgeInsets.all(16.0) : EdgeInsets.all(0.0),
                  child:Dance(
                          child: SvgPicture.asset(
                          "assets/svgs/users.svg",
                          color: color == 2 ? Colors.white : Colors.grey,
                        ))),
                      
              index: true,
              //     title: translator.translate("more"),
              hasNotification: false),
        ]);
  }
}
