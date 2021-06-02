import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:delivery_boy/backend/api_get.dart';
import 'package:delivery_boy/features/chat_message.dart';
import 'package:delivery_boy/features/delivery/widgets/chat_card.dart';
import 'package:delivery_boy/models/message_model.dart';
import 'package:delivery_boy/services/firebase_chat.dart';
import 'package:delivery_boy/values/color.dart';
import 'package:delivery_boy/values/common.dart';

class MyChatsScreen extends StatelessWidget {
  final ApiGet apiGet = Get.find();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "الرسائل ",
            textAlign: TextAlign.right,
            style: getStyle(whiteColor, FontWeight.w700, 16),
          ),
          backgroundColor: orangeColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24.00)),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: ScreenUtil().setHeight(35),
            ),
            Obx(() {
              return Expanded(
                child: apiGet.listChats == []
                    ? loading()
                    : apiGet.listChats.length == 0
                        ? Center(
                            child: Text('لا يوجد رسائل'),
                          )
                        : ListView.builder(
                            itemCount: apiGet.listChats.length,
                            itemBuilder: (context, index) {
                              List<Map<String, dynamic>> myChat =
                                  apiGet.listChats.value;
                              return StreamBuilder<QuerySnapshot>(
                                  stream: FireBaseHelper.fireBaseHelper
                                      .getAllChatMessages(
                                          myChat[index]['mobile'].toString(),
                                          apiGet.mapProfile['userprofile'][0]
                                              ['jawwal']),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Center(
                                        child: Container(),
                                      );
                                    } else {
                                      List<Map<String, dynamic>> data = snapshot
                                          .data.docs
                                          .map((e) => e.data())
                                          .toList();
                                      List<MessageModel> messages = data
                                          .map((e) => MessageModel.fromJson(e))
                                          .toList();
                                      return GestureDetector(
                                        onTap: () {
                                           Get.to(ChatMessanger(
                                            myId:
                                                apiGet.mapProfile['userprofile']
                                                    [0]['jawwal'],
                                            otherId: myChat[index]['mobile']
                                                .toString(),
                                            id: myChat[index]['usersInfo']['id']
                                                .toString(),
                                          ));
                                          FireBaseHelper.fireBaseHelper
                                              .updateReadMessage(
                                            apiGet.mapProfile['userprofile'][0]
                                                ['jawwal'],
                                            myChat[index]['mobile'].toString(),
                                          );
                                          apiGet.testChat();
                                        },
                                        child: ChatCard(
                                          myChat[index],
                                          messages.length == 0
                                              ? ""
                                              : messages.last.content,
                                          messages.where((element) {
                                            return element.isRead == false &&
                                                element.senderId !=
                                                    apiGet.mapProfile[
                                                            'userprofile'][0]
                                                        ['jawwal'];
                                          }).length,
                                        ),
                                      );
                                    }
                                  });
                            },
                          ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
