
import 'package:delivery_boy/backend/api_get.dart';
import 'package:delivery_boy/values/color.dart';
import 'package:delivery_boy/values/constant.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import 'package:get/get.dart';

class CustomAppBarItem {
  Widget icon;
  String title;
  bool index;
  bool hasNotification;

  CustomAppBarItem(
      {this.icon, this.hasNotification = false, this.title, this.index});
}

class CustomBottomAppBar extends StatefulWidget {
  final ValueChanged<int> onTabSelected;
  final List<CustomAppBarItem> items;

  CustomBottomAppBar({this.onTabSelected, this.items});

  @override
  _CustomBottomAppBarState createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  ApiGet appGet = Get.find();

  void _updateIndex(index) {
    // print(index);
    appGet.setindexNav(index);
    widget.onTabSelected(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<TabItem<dynamic>> itemss =
        List.generate(widget.items.length, (int index) {
      return _buildTabIcon(context,
          index: index, item: widget.items[index], onPressed: _updateIndex);
    });
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
        child: StyleProvider(
          style: Style(),
          child: ConvexAppBar(
            //  key:appGet. convexKey,
            backgroundColor: Colors.white,
            activeColor: orangeColor,
            initialActiveIndex: appGet.indexNav,
            //   color:Colors.amber ,
            // cornerRadius: 10,
            height: setH(50, context),
            style: TabStyle.reactCircle,
            elevation: 10,
            onTap: (index) {
              _updateIndex(index);
            },
            items: itemss,
          ),
        ));
  }

  _buildTabIcon(context,
      {int index, CustomAppBarItem item, ValueChanged<int> onPressed}) {
    return TabItem(
      icon: item.icon,
      title: item.title,
      activeIcon: item.icon,
      isIconBlend: false,
    );
  }
}

class Style extends StyleHook {
  @override
  double get activeIconSize => 20;

  @override
  double get activeIconMargin => 10;

  @override
  double get iconSize => 20;

  @override
  TextStyle textStyle(Color color) {
    return TextStyle(fontSize: 15, color: color);
  }
}
