import 'package:flutter/material.dart';

final String splash1Svg = 'assets/svgs/splash1.svg';
final String splash2Svg = 'assets/svgs/splash2.svg';
final String chattingSvg = 'assets/svgs/chatting.svg';
final String flagSvg = 'assets/svgs/flag.svg';
final String checkCompleteSvg = 'assets/svgs/check_complete.svg';
final String checkNoCompleteSvg = 'assets/svgs/check_no_complete.svg';
final String homefamilyPng = 'assets/svgs/homefamily.jpg';
final String customIconLocationPng = 'assets/svgs/current_location.png';
final String policySvg = 'assets/icons/policy.svg';
final String policy2Svg = 'assets/icons/policy2.svg';
final String helpSvg = 'assets/icons/help.svg';
final String callSvg = 'assets/icons/call.svg';
final String snapchatSvg = 'assets/icons/snapchat.svg';
final String whatsappSvg = 'assets/icons/whatsapp.svg';
final String home1jpg = 'assets/svgs/home1.jpg';
final String home2jpg = 'assets/svgs/home2.jpg';
final String burger1Svg = 'assets/svgs/burger1.jpg';
final String egesSvg = 'assets/svgs/eges.jpg';
final String top2Svg = 'assets/svgs/top2.jpg';
final String top3Svg = 'assets/svgs/top3.jpg';
final String top4Svg = 'assets/svgs/top4.jpg';
final String top5Svg = 'assets/svgs/top5.jpg';
final String topDelivery1Svg = 'assets/svgs/top_delivery_1.jpg';
final String backDeliverySvg = 'assets/svgs/back_delivery.jpg';
final String backDeliverytopSvg = 'assets/svgs/deliveryback.jpg';

//Api EndPoints..//////

final String baseUrl = 'https://san3h.com/api/auth/';

final String loginEndPoints = 'login';
final String registerFamilyEndPoints = 'registerosra';
final String registerDeliveryEndPoints = 'registerdeliver';
final String bankEndPoints = 'bank';
final String productEndPoints = 'product';
final String subprodutEndPoints = 'subprodut';
final String addosraproductEndPoints = 'addosraproduct';
final String getpriceproductEndPoints = 'getpriceproduct';
final String userProfileEndPoints = 'user-profile';
final String editProfileEndPoints = 'editprofile';
final String changIsopenEndPoints = 'isopen';
final String getosraproductEndPoints = 'getosraproduct';
final String getSearchOsraProductEndPoints = 'searchosraproduct';
final String updatelocationEndPoints = 'updatelocation';
final String getArticipationEndPoints = 'getarticipation';
final String getsubparticipationEndPoints = 'getsubparticipation';
final String subscribeEndPoints = 'Subscribe';
final String getofferEndPoints = 'getoffer';
final String subscribeOfferEndPoints = 'SubscribeOffer';
final String contactEndPoints = 'contact';
final String requestforosraEndPoints = 'requestforosra';
final String orderDeailsosraEndPoints = 'orderosra';
final String approvedorderEndPoints = 'approvedorder';
final String changeorderstatusEndPoints = 'changeorderstatus';
final String verifycodeosraEndPoints = 'verifycodeosra';
final String verifycodeEndPoints = 'verifycodedelivery';
final String changepasswordEndPoints = 'changepasswordosra';
final String resetpasswordosraEndPoints = 'resetpasswordosra';
setH(double height, BuildContext context) {
  return (height * MediaQuery.of(context).size.height) / 812;
}

setW(double width, BuildContext context) {
  return (width * MediaQuery.of(context).size.width) / 375;
}