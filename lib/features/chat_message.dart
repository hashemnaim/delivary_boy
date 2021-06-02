import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as init;
import 'package:delivery_boy/backend/server.dart';
import 'package:delivery_boy/models/message_model.dart';
import 'package:delivery_boy/services/firebase_chat.dart';
import 'package:delivery_boy/values/color.dart';
import 'package:delivery_boy/values/common.dart';

class ChatMessanger extends StatefulWidget {
  final String myId;
  final String otherId;
  final String name;
  final String image;
  final String id;
  final String recevidNotificationId;
  ChatMessanger(
      {this.myId,
      this.otherId,
      this.id,
      this.name,
      this.image,
      this.recevidNotificationId});

  @override
  _ChatMessangerState createState() => _ChatMessangerState();
}

class _ChatMessangerState extends State<ChatMessanger> {
  TextEditingController textEditingController = TextEditingController();

  ScrollController _controller;
  @override
  void initState() {
    _controller = ScrollController();
    try {
      Timer(
        Duration(milliseconds: 200),
        () {
          if (_controller == null) {
          } else {
            _controller.jumpTo(_controller.position.maxScrollExtent);
          }
        },
      );
    } catch (e) {}
    super.initState();
  }

  buildMessage(Map map, String myId, double width) {
    if (map['senderId'] == myId) {
      return myMessage(map, width, map['hour']);
    } else {
      return partnerMessageView(map, width, map['hour']);
    }
  }

  Widget myMessage(Map map, double width, String hour) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 8.0, left: 10, right: 10),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            constraints: BoxConstraints(
              minWidth: 50,
              maxWidth: 200,
            ),
            decoration: BoxDecoration(
              color: orangeColor,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0.00, 5.00),
                  color: Color(0xff000000).withOpacity(0.12),
                  blurRadius: 14,
                ),
              ],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.00),
                bottomRight: Radius.circular(8.00),
                bottomLeft: Radius.circular(8.00),
              ),
            ),
            child: Container(
              child: map['content'].toString().isNotEmpty
                  ? Text(map['content'],
                      style: getStyle(Color(0xffffffff), FontWeight.normal, 17))
                  : Container(
                      constraints: BoxConstraints(
                        minWidth: 50,
                        maxWidth: 200,
                      ),
                      child: CachedNetworkImage(
                        imageUrl: map['urlImage'],
                        imageBuilder: (context, imageProvider) => Container(
                          height: ScreenUtil().setHeight(150),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            Center(child: Icon(Icons.error)),
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }

  Widget partnerMessageView(Map map, double width, String hour) {
    return Container(
      padding: const EdgeInsets.only(top: 8.0, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            constraints: BoxConstraints(
              minWidth: 50,
              maxWidth: 200,
            ),
            decoration: BoxDecoration(
              color: Color(0xffefeff4),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8.00),
                topLeft: Radius.circular(8.00),
                bottomRight: Radius.circular(8.00),
              ),
            ),
            child: Container(
              child: map['content'].toString().isNotEmpty
                  ? Text(map['content'],
                      style: getStyle(blackColor, FontWeight.normal, 17))
                  : Container(
                      constraints: BoxConstraints(
                        minWidth: 50,
                        maxWidth: 200,
                      ),
                      child: CachedNetworkImage(
                        imageUrl: map['urlImage'],
                        imageBuilder: (context, imageProvider) => Container(
                          height: ScreenUtil().setHeight(150),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            Center(child: Icon(Icons.error)),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // appBar: PreferredSize(
        //   preferredSize: Size(0, ScreenUtil().setHeight(125)),
        //   child: SizedBox(
        //     height: ScreenUtil().setHeight(125),
        //     width: double.infinity,
        //     child: ClipRRect(
        //       borderRadius: BorderRadius.only(
        //         bottomLeft: Radius.circular(25),
        //         bottomRight: Radius.circular(25),
        //       ),
        //       child: AppBar(
        //         centerTitle: true,
        //         backgroundColor: Colors.blue,
        //         title: Text(
        //           widget.name.toString(),
        //           // style: getStyle(18, FontWeight.normal, whiteColor),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
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
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FireBaseHelper.fireBaseHelper
                        .getAllChatMessages(widget.otherId, widget.myId),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: Container(),
                        );
                      } else if (snapshot.hasData && snapshot.data == null) {
                        return Center(
                          child: Text(
                            'no_messages',
                            // style: getStyle(18, FontWeight.normal, blueColor),
                          ),
                        );
                      } else {
                        List<Map<String, dynamic>> data =
                            snapshot.data.docs.map((e) => e.data()).toList();
                        List<MessageModel> messages =
                            data.map((e) => MessageModel.fromJson(e)).toList();
                        return ListView.builder(
                          controller: _controller,
                          itemCount: messages.length,
                          itemBuilder: (context, index) {
                            return buildMessage(
                              data[index],
                              widget.myId,
                              size.width,
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    SizedBox(
                      width: ScreenUtil().setWidth(10),
                    ),
                    GestureDetector(
                        onTap: () async {
                          if (textEditingController.text.trim().isNotEmpty) {
                            // DateTime dateTime = DateTime.now();
                            // String hour = '${dateTime.hour}:${dateTime.minute}';

                            Server.server.chatNotification(
                                textEditingController.text, widget.id);
                            FireBaseHelper.fireBaseHelper.updateReadMessage(
                              widget.myId,
                              widget.otherId,
                            );
                            String hour =
                                init.DateFormat.jm().format(DateTime.now());
                            FireBaseHelper.fireBaseHelper.newMessage(
                              message: MessageModel(
                                content: textEditingController.text,
                                recieverId: widget.otherId,
                                senderId: widget.myId,
                                hour: hour,
                                timeStamp: FieldValue.serverTimestamp(),
                                isRead: false,
                              ),
                              reciverId: widget.otherId,
                              senderId: widget.myId,
                            );

                            textEditingController.clear();

                            Timer(
                              Duration(milliseconds: 300),
                              () => _controller
                                  .jumpTo(_controller.position.maxScrollExtent),
                            );
                          }
                        },
                        child: Icon(
                          Icons.send_rounded,
                          color: orangeColor,
                        )),
                    SizedBox(
                      width: ScreenUtil().setWidth(14),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        width: ScreenUtil().setWidth(290),
                        height: ScreenUtil().setHeight(50),
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          border: Border.all(
                            width: 1.00,
                            color: Color(0xffefeff4),
                          ),
                          borderRadius: BorderRadius.circular(8.00),
                        ),
                        child: Column(
                          children: [
                            TextField(
                              controller: textEditingController,
                              onTap: () {
                                try {
                                  Timer(
                                    Duration(milliseconds: 300),
                                    () => _controller.jumpTo(
                                        _controller.position.maxScrollExtent),
                                  );
                                } catch (e) {}
                              },
                              decoration: InputDecoration(
                                hintText: "اكتب الرسالة هنا",
                                hintStyle: TextStyle(
                                  fontFamily: "SF Pro Display",
                                  fontSize: 15,
                                  color: Color(0xffc8c7cc),
                                ),

                                contentPadding: EdgeInsets.only(
                                    left: 15, right: 15, top: 15),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                // hintText: translator.translate('message_here'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(10),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
