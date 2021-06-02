// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:delivery_boy/backend/api_get.dart';
// import 'package:delivery_boy/backend/server.dart';
// import 'package:delivery_boy/components/widgets/custom_button.dart';
// import 'package:delivery_boy/components/widgets/custom_select_photo.dart';
// import 'package:delivery_boy/components/widgets/custom_text_field.dart';
// import 'package:delivery_boy/state/app_family_get.dart';
// import 'package:delivery_boy/values/color.dart';
// import 'package:delivery_boy/values/common.dart';
// import 'package:delivery_boy/values/constant.dart';

// class AddNewNotFoundProducts extends StatefulWidget {
//   @override
//   _AddNewNotFoundProductsState createState() => _AddNewNotFoundProductsState();
// }

// class _AddNewNotFoundProductsState extends State<AddNewNotFoundProducts> {
//   ApiGet apiGet = Get.find();

//   AppFamilyGet appFamilyGet = Get.find();

//   String extra;
//   String price;

//   String priceExtra;
//   String name;
//   String drink;

//   setName(String name) {
//     this.name = name;
//   }

//   setPrice(String price) {
//     this.price = price;
//   }

//   setDrink(String drink) {
//     this.drink = drink;
//   }

//   setExtra(String extra) {
//     this.extra = extra;
    
//   }

//   setPriceExtra(String priceExtra) {
//     this.priceExtra = priceExtra;
//   }

//   Timer timer;
//   @override
//   void initState() {
//     timer = Timer(Duration(seconds: 0), () {});

//     super.initState();
//   }

//   @override
//   void dispose() {
//     // timer.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: whiteColor,
//       body: Stack(
//         children: [
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
//             child: ListView(
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     SizedBox(
//                       height: ScreenUtil().setHeight(130),
//                     ),
//                     Text(
//                       "إضافة منتج جديد ",
//                       textAlign: TextAlign.right,
//                       style: getStyle(blackColor, FontWeight.w700, 20),
//                     ),
//                     SizedBox(height: ScreenUtil().setHeight(20)),
//                     Text(
//                       "صورة المنتج ",
//                       textAlign: TextAlign.right,
//                       style: getStyle(blackColor, FontWeight.w700, 18),
//                     ),
//                     SizedBox(height: ScreenUtil().setHeight(15)),
//                     Container(
//                       height: 70.h,
//                       child: Directionality(
//                         textDirection: TextDirection.rtl,
//                         child: GetBuilder<AppFamilyGet>(
//                           init: AppFamilyGet(),
//                           id: 'imageProduct',
//                           builder: (authController) {
//                             return CustomSelectPhoto(
//                               image: authController.imageProduct,
//                               onTap: authController.addImageProduct,
//                             );
//                           },
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: ScreenUtil().setHeight(15)),
//                     Text(
//                       "اسم الطبق ",
//                       textAlign: TextAlign.right,
//                       style: getStyle(blackColor, FontWeight.w700, 18),
//                     ),
//                     SizedBox(height: ScreenUtil().setHeight(10)),
//                     CustomTextFiled(
//                       onSaved: setName,
//                       hintText: 'اسم الطبق',
//                       keyboardType: TextInputType.text,
//                     ),
//                     SizedBox(height: ScreenUtil().setHeight(15)),
//                     Text(
//                       "السعر",
//                       textAlign: TextAlign.right,
//                       style: getStyle(blackColor, FontWeight.w700, 18),
//                     ),
//                     SizedBox(height: ScreenUtil().setHeight(10)),
//                     CustomTextFiled(
//                       onSaved: setPrice,
//                       hintText: 'السعر',
//                       keyboardType: TextInputType.number,
//                     ),
//                     SizedBox(height: ScreenUtil().setHeight(15)),
//                     Text(
//                       "(إن وجد) إضافة مشروب ",
//                       textAlign: TextAlign.right,
//                       style: getStyle(blackColor, FontWeight.w700, 18),
//                     ),
//                     SizedBox(height: ScreenUtil().setHeight(10)),
//                     CustomTextFiled(
//                       keyboardType: TextInputType.text,
//                       onSaved: setDrink,
//                     ),
//                     SizedBox(height: ScreenUtil().setHeight(15)),
//                     GetBuilder<AppFamilyGet>(
//                         init: AppFamilyGet(),
//                         id: 'extraMap',
//                         builder: (controller) {
//                           return Column(
//                             children: [
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   GestureDetector(
//                                     onTap: () {
//                                       // controller.addMapExtra(extra, priceExtra);
                                    
//                                       if (extra == null || priceExtra == null) {
//                                       } else {
//                                         // controller.addNumberExtra();

//                                         controller.addMapExtra(
//                                             extra, priceExtra);
//                                         Fluttertoast.showToast(
//                                             msg: "تمت الإضافة",
//                                             toastLength: Toast.LENGTH_SHORT,
//                                             gravity: ToastGravity.CENTER,
//                                             timeInSecForIosWeb: 1,
//                                             backgroundColor: Colors.green,
//                                             textColor: Colors.white,
//                                             fontSize: 16.0);
//                                         // setExtra(null);
//                                         // setPriceExtra(null);
//                                       }
//                                     },
//                                     child: Container(
//                                       height: 30.h,
//                                       width: ScreenUtil().setWidth(30),
//                                       decoration: BoxDecoration(
//                                         color: orangeColor,
//                                         shape: BoxShape.circle,
//                                       ),
//                                       child: Center(
//                                         child: Icon(
//                                           Icons.add,
//                                           color: whiteColor,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Text(
//                                     "(إن وجد) إضافة إضافات ",
//                                     textAlign: TextAlign.right,
//                                     style: getStyle(
//                                         blackColor, FontWeight.w700, 18),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(height: ScreenUtil().setHeight(15)),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: CustomTextFiled(
//                                       onSaved: (value) => setPriceExtra(value),
//                                       hintText: 'السعر',
//                                       keyboardType: TextInputType.number,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: ScreenUtil().setHeight(10),
//                                   ),
//                                   Expanded(
//                                     child: CustomTextFiled(
//                                       onSaved: (value) => setExtra(value),
//                                       hintText: 'الإضافة',
//                                       keyboardType: TextInputType.text,
//                                     ),
//                                   ),
//                                 ],
//                               ),

//                               // Container(
//                               //   height:300,
//                               //   child: ListView.builder(
//                               //     physics: NeverScrollableScrollPhysics(),
//                               //     shrinkWrap: false,
//                               //     scrollDirection: Axis .vertical,
//                               //     itemCount: controller.numberExtra,
//                               //     itemBuilder:
//                               //         (BuildContext context, int index) {
//                               //       return Container(
//                               //         margin: EdgeInsets.only(bottom: 8.h),
//                               //         child:   );
//                               //     },
//                               //   ),
//                               // ),
//                             ],
//                           );
//                         }),
//                     SizedBox(height: ScreenUtil().setHeight(40)),
//                     CustomButton(
//                       title: 'إضافة ',
//                       onTap: () async {
//                         FocusScope.of(context).unfocus();
//                         if (appFamilyGet.imageProduct == null) {
//                           getSheetError('الرجاء تعبئة الحقول الناقصة');
//                         } else {
//                           int add = await Server.server.addNewOsraproduct(
//                             appFamilyGet.imageProduct,
//                             name,
//                             price,
//                             drink,
//                             appFamilyGet.mapExtra.toString(),
//                           );
//                           if (add == 1) {
//                             getSheetSucsses('تم إضافة المنتج بنجاح');
//                             appFamilyGet.imageProduct = null;
//                           } else if (add == 0) {
//                             Timer(Duration(seconds: 3), () {
//                               Get.back();
//                               Get.back();
//                             });
//                             return Get.dialog(
//                               Dialog(
//                                 backgroundColor: Colors.transparent,
//                                 insetPadding: EdgeInsets.all(0),
//                                 child: ClipRRect(
//                                   child: Container(
//                                     height: ScreenUtil().setHeight(187),
//                                     width: ScreenUtil().setWidth(335),
//                                     decoration: BoxDecoration(
//                                       color: whiteColor,
//                                       boxShadow: [
//                                         BoxShadow(
//                                           offset: Offset(0.00, 3.00),
//                                           color: blackColor.withOpacity(0.16),
//                                           blurRadius: 6,
//                                         ),
//                                       ],
//                                       borderRadius: getBoarderRadius(41.00),
//                                     ),
//                                     child: Center(
//                                       child: Text(
//                                         '''تم إضافة المنتج، سيتم مراجعته من
// قبل إدارة سنعة.
// شكرا لكم ''',
//                                         textAlign: TextAlign.center,
//                                         style: TextStyle(
//                                           fontFamily: "Almarai",
//                                           fontSize: 18,
//                                           height: 1.5,
//                                           color: Color(0xff000000),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             );
//                           } else if (add == -1) {
//                             Timer(Duration(seconds: 3), () {
//                               Get.back();
//                               Get.back();
//                             });
//                             return Get.dialog(
//                               Dialog(
//                                 backgroundColor: Colors.transparent,
//                                 insetPadding: EdgeInsets.all(0),
//                                 child: ClipRRect(
//                                   child: Container(
//                                     height: ScreenUtil().setHeight(187),
//                                     width: ScreenUtil().setWidth(335),
//                                     decoration: BoxDecoration(
//                                       color: whiteColor,
//                                       boxShadow: [
//                                         BoxShadow(
//                                           offset: Offset(0.00, 3.00),
//                                           color: blackColor.withOpacity(0.16),
//                                           blurRadius: 6,
//                                         ),
//                                       ],
//                                       borderRadius: getBoarderRadius(41.00),
//                                     ),
//                                     child: Center(
//                                       child: Text(
//                                         '''لقد وصلت إلي الحد المسموح من الأطباق 
// في الباقة لإضافة المزيد من الأطباق قم بترقية الباقة''',
//                                         textAlign: TextAlign.center,
//                                         style: TextStyle(
//                                           fontFamily: "Almarai",
//                                           fontSize: 18,
//                                           height: 1.5,
//                                           color: Color(0xff000000),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             );
//                           }
//                         }
//                       },
//                     ),
//                     SizedBox(height: ScreenUtil().setHeight(40)),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Transform.translate(
//             offset: Offset(-90, -80),
//             child: Container(
//               width: ScreenUtil().setWidth(280),
//               height: ScreenUtil().setHeight(280),
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 image: DecorationImage(
//                   image: AssetImage(
//                     top3Svg,
//                   ),
//                   fit: BoxFit.fill,
//                 ),
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.topCenter,
//             child: SizedBox(
//               height: ScreenUtil().setHeight(100),
//               child: Directionality(
//                 textDirection: TextDirection.rtl,
//                 child: AppBar(
//                   backgroundColor: Colors.transparent,
//                   elevation: 0,
//                   iconTheme: IconThemeData(color: blackColor),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
