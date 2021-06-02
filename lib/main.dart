import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:delivery_boy/backend/api_get.dart';
import 'package:delivery_boy/backend/auth_get.dart';
import 'package:delivery_boy/services/lifeCycleManager%20.dart';
import 'package:delivery_boy/services/notification_firebase.dart';
import 'package:delivery_boy/services/sp_helper.dart';
import 'package:delivery_boy/splach_screen.dart';
import 'package:delivery_boy/state/app_family_get.dart';
import 'package:delivery_boy/values/color.dart';
import 'package:delivery_boy/values/constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await SPHelper.spHelper.initSharedPrefrences();
  await Firebase.initializeApp();
  await SPHelper.spHelper.initSharedPrefrences();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: orangeColor,
    statusBarIconBrightness: Brightness.light,
  ));
  // await precachePicture(
  //     ExactAssetPicture(SvgPicture.svgStringDecoder, splash2Svg), null);
  // await precachePicture(
  //     ExactAssetPicture(SvgPicture.svgStringDecoder, splash1Svg), null);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  getImage(BuildContext context) async {
    // AssetImage backgroundImage = AssetImage(backDeliverySvg);
    // AssetImage backgroundImage2 = AssetImage(homefamilyPng);
    // AssetImage backgroundImage3 = AssetImage(backDeliverytopSvg);
    // await precacheImage(backgroundImage, context);
    // await precacheImage(backgroundImage2, context);
    // await precacheImage(backgroundImage3, context);
  }

  @override
  Widget build(BuildContext context) {
    // FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    getImage(context);

    return LifeCycleManager(
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        builder: () => GetMaterialApp(
          home: Home(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    NotificationHelper().initialNotification();
  }

  AuthGet authGet = Get.put(AuthGet());
  AppFamilyGet appFamilyGet = Get.put(AppFamilyGet());
  ApiGet apiGet = Get.put(ApiGet());

  @override
  Widget build(BuildContext context) {
    return SplachScreen();
  }
}
