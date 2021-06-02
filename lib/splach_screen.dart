import 'dart:async';

import 'package:delivery_boy/isload.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:delivery_boy/backend/api_get.dart';
import 'package:delivery_boy/backend/auth_get.dart';
import 'package:delivery_boy/services/sp_helper.dart';
import 'package:delivery_boy/values/constant.dart';

import 'features/delivery/main_screen.dart';
import 'features/delivery/screens/sign_in_delivery.dart';
import 'package:delivery_boy/backend/server.dart';

class SplachScreen extends StatefulWidget {
  @override
  _SplachScreenState createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  AuthGet authGet = Get.find();
  ApiGet apiGet = Get.find();
  getDataInit() {
    Server.server.requestdelivery();
print(SPHelper.spHelper.getTokenDelivery());
    if (SPHelper.spHelper.getTokenDelivery() == null ) {
      Server.server.getArticipation();
      Server.server.getoffer();
      Server.server.getContact();
      apiGet.getProductsName();
      Server.server.getevalute();
      Server.server.requestforosra();
      Server.server.requestdelivery();
      authGet.getBancks();
       Timer(Duration(seconds: 3), () {
      Get.offAll(SignInDeliveryScreen());
    });
    } else {
      Server.server.getArticipation();
      Server.server.getoffer();
      Server.server.getProfile();
      Server.server.getContact();
      Server.server.requestdelivery();
      apiGet.getProductsName();
      authGet.getBancks();
      Server.server.requestforosra();
      Server.server.getevalute();
       Timer(Duration(seconds: 3), () {
      Get.offAll(()=>MainScreen());
    });
    }
  }

  @override
  void initState() {
    getDataInit();
    super.initState();
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: Container(
              // width: ScreenUtil().setWidth(243.9),
              // height: ScreenUtil().setHeight(106.82),
              child: Image.asset(
                "assets/svgs/van.gif",
                fit: BoxFit.fill,
              ),
            ),
          ),
          // Positioned(
          //   bottom: 100,
          //   right: 0,
          //   left: 0,
          //   child: IsLoad())
        ],
      ),
    );
  }
}
