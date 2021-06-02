import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_boy/backend/api_get.dart';
import 'package:delivery_boy/services/sp_helper.dart';
import 'package:delivery_boy/state/app_family_get.dart';
import 'package:delivery_boy/values/common.dart';

class LifeCycleManager extends StatefulWidget {
  final Widget child;
  LifeCycleManager({Key key, this.child}) : super(key: key);

  _LifeCycleManagerState createState() => _LifeCycleManagerState();
}

class _LifeCycleManagerState extends State<LifeCycleManager>
    with WidgetsBindingObserver {
  Timer _timerLink;
  final ApiGet apiGet = Get.put(ApiGet());
  AppFamilyGet appFamilyGet = Get.put(AppFamilyGet());
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    if (_timerLink != null) {
      // _timerLink.cancel();
    }
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    
    if (state == AppLifecycleState.paused) {
      SPHelper.spHelper.getTokenDelivery() == null ||
              SPHelper.spHelper.getTokenFamily() == null ||
              apiGet.type == null
          ? print('')
          : apiGet.mapProfile.isNotEmpty
              ? updateStatusUser(
                  apiGet.mapProfile['userprofile'][0]['jawwal'], 'offline')
              : print('');
    } else if (state == AppLifecycleState.resumed) {
      SPHelper.spHelper.getTokenDelivery() == null ||
              SPHelper.spHelper.getTokenFamily() == null ||
              apiGet.type == null
          ? print('')
          : apiGet.mapProfile.isNotEmpty
              ? updateStatusUser(
                  apiGet.mapProfile['userprofile'][0]['jawwal'], 'online')
              : print('');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.child,
    );
  }
}
