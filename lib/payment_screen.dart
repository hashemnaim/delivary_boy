import 'dart:io';
import 'package:flutter/material.dart';
import 'package:delivery_boy/backend/server.dart';
import 'package:delivery_boy/values/color.dart';
import 'package:delivery_boy/values/common.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final Map map;
  final String baqaChoose;
  final bool isFirst;

  WebViewScreen(
    this.map,
    this.isFirst,
    this.baqaChoose,
  );
  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: orangeColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'بيانات الدفع',
          textAlign: TextAlign.right,
          style: getStyle(whiteColor, FontWeight.w700, 20),
        ),
      ),
      body: widget.map == null || widget.map.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              padding: EdgeInsets.all(10),
              child: Center(
                child: WebView(
                  initialUrl: widget.map['url'],
                  javascriptMode: JavascriptMode.unrestricted,
                  navigationDelegate: (NavigationRequest request) {
                    if (request.url.contains('success')) {
                      
                      Server.server.paymentStep2(
                        widget.map['ref'],
                        widget.baqaChoose,
                        widget.isFirst,
                      );
                    }
                    if (request.url.contains('error')) {
                      
                    }
                    return NavigationDecision.navigate;
                  },
                ),
              ),
            ),
    );
  }
}
