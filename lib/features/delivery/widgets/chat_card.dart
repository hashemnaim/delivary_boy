import 'package:flutter/material.dart';
 import 'package:delivery_boy/components/widgets/cash_network_image_share.dart';
import 'package:delivery_boy/values/color.dart';
import 'package:delivery_boy/values/common.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatCard extends StatelessWidget {
  final Map<String, dynamic> map;
  final String lastMessage;
  final int count;
  ChatCard(this.map, this.lastMessage, this.count);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(20),
        vertical: ScreenUtil().setHeight(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Stack(
                children: [
                  CachedNetworkImageShare(
                      map['usersInfo']['image'], 55, 55, 0.toDouble()),
                  map['usersInfo']['state'] == 'online'
                      ? Positioned(
                          top: ScreenUtil().setHeight(35),
                          child: Container(
                            height: ScreenUtil().setHeight(14),
                            width: ScreenUtil().setWidth(14),
                            decoration: BoxDecoration(
                              color: Color(0xff1ec27a),
                              shape: BoxShape.circle,
                              border: Border.all(color: whiteColor, width: 2),
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
              SizedBox(
                width: ScreenUtil().setWidth(10),
              ),
              Column(
                children: [
                  Text(
                    // map['mobile'],
                    map['usersInfo']['name'],
                    textAlign: TextAlign.right,
                    style: getStyle(blackColor, FontWeight.normal, 16),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    lastMessage.length > 20
                        ? lastMessage.substring(0, 19)
                        : '$lastMessage...',
                    textAlign: TextAlign.right,
                    style: getStyle(grayColor, FontWeight.normal, 16),
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                map['usersInfo']['state'] == 'online'
                    ? 'online'
                    : parseHumanDateTime(map['usersInfo']['date']),
                style: getStyle(
                  map['usersInfo']['state'] == 'online'
                      ? greenColor
                      : Color(0xff77838f),
                  FontWeight.normal,
                  12,
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              count == 0
                  ? Container()
                  : Container(
                      height: ScreenUtil().setHeight(25),
                      width: ScreenUtil().setWidth(43),
                      decoration: BoxDecoration(
                        color: orangeColor,
                        borderRadius: BorderRadius.circular(4.00),
                      ),
                      child: Center(
                        child: Text(
                          "$count",
                          textAlign: TextAlign.right,
                          style: getStyle(whiteColor, FontWeight.normal, 12),
                        ),
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
