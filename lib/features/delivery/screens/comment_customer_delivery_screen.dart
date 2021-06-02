import 'package:delivery_boy/features/delivery/screens/comment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'package:get/get.dart';
import 'package:delivery_boy/backend/api_get.dart';
import 'package:delivery_boy/values/color.dart';
import 'package:delivery_boy/values/common.dart';
import 'package:delivery_boy/values/constant.dart';

class CommentCustomerDeliveryScreen extends StatelessWidget {
  bool isOsra;
  CommentCustomerDeliveryScreen(this.isOsra);
  ApiGet apiGet = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: orangeColor,
        title: Text("تعليقات العملاء ",  style: getStyle(
                                              Colors.white, FontWeight.w300, 20),
                                        ),
        centerTitle: true,
      ),
        backgroundColor: whiteColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: ScreenUtil().setHeight(20),
            ),
           
         
            Obx(() {
              return Expanded(
                child: apiGet.evaluteMap.isEmpty
                    ? loading()
                    : apiGet.evaluteMap['evalute'].length == 0
                        ? Center(
                            child: Text('لا يوجد تعليقات '),
                          )
                        : ListView.separated(
                            separatorBuilder: (context, index) {
                              return Divider(thickness: 1.5);
                            },
                            itemCount: apiGet.evaluteMap['evalute'].length,
                            itemBuilder: (context, index) {
                              Map data =
                                  apiGet.evaluteMap['evalute'][index];
                              return CommentCard(data);
                            },
                          ),
              );
            }),
          ],
        ));
  }
}
