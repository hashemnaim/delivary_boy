import 'dart:convert';
import 'dart:io';
import 'package:delivery_boy/features/delivery/screens/sign_in_delivery.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as myget;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'package:delivery_boy/backend/api_get.dart';
import 'package:delivery_boy/features/delivery/screens/profile_delivery_screen.dart';
import 'package:delivery_boy/features/families/screens/check_send_code_screen.dart';
import 'package:delivery_boy/features/families/screens/choose_baqa_screen.dart';
import 'package:delivery_boy/features/families/screens/forget_password_screen.dart';
import 'package:delivery_boy/features/families/screens/home_screen.dart';
import 'package:delivery_boy/payment_screen.dart';
import 'package:delivery_boy/services/firebase_chat.dart';
import 'package:delivery_boy/services/notification_firebase.dart';
import 'package:delivery_boy/services/sp_helper.dart';
import 'package:delivery_boy/state/app_family_get.dart';
import 'package:delivery_boy/values/common.dart';
import 'package:delivery_boy/values/constant.dart';

class Server {
  Server._();

  static Server server = Server._();
  Dio dio;

  initDio() {
    if (dio == null) {
      return dio = Dio();
    }
    return dio;
  }

  ApiGet apiGet = myget.Get.find();
  AppFamilyGet appGet = myget.Get.find();

  login(
      String jawwal, String password, String latitude, String longitude) async {
    apiGet.pr.show();
    try {
      initDio();
      String fcmToken = await NotificationHelper().getToken();

      FormData data = FormData.fromMap(
        {
          'jawwal': '+966$jawwal',
          'password': password,
          'latitude': latitude,
          'longitude': longitude,
          'fcm_token': fcmToken
        },
      );
      Response response = await dio.post(
        baseUrl + loginEndPoints,
        data: data,
      );
      Map map = response.data;
      if (map['status']) {
        apiGet.pr.hide();
        apiGet.type = map['user']['type'];

        map['user']['type'] == 'osra'
            ? SPHelper.spHelper.setTokenFamily(
                map['access_token'],
              )
            : SPHelper.spHelper.setTokenDelivery(
                map['access_token'],
              );

        apiGet.type = map['user']['type'];

        await getSheetSucsses('تم الدخول بنجاح');
        if (map['user']['type'] == 'osra') {
          // myget.Get.offAll(HomeFamilyScreen());
          getosraproduct();
          getProductsName();
          getProfile();
          requestforosra();
        } else {
          myget.Get.offAll(ProfileDeliveryScreen());
          getProfile();
        }
      } else {
        apiGet.pr.hide();

        await getSheetError('البيانات خاطئة');
      }
    } catch (e) {
      apiGet.pr.hide();
    }
  }

  registerFamily(
    String name,
    String jawwal,
    File image,
    String paswword,
    String passwordConfirmation,
    String latitude,
    String longitude,
    String address,
    String bankId,
    String nobank,
    String isOrder,
  ) async {
    apiGet.pr.show();

    try {
      initDio();
      String fcmToken = await NotificationHelper().getToken();

      FormData data = FormData.fromMap(
        {
          'name': name,
          'jawwal': '+966$jawwal',
          'password': paswword,
          'password_confirmation': passwordConfirmation,
          'latitude': latitude,
          'longitude': longitude,
          'address': address,
          'bank_id': bankId,
          'nobank': nobank,
          'fcm_token': fcmToken,
          'is_order': isOrder,
          'image': await MultipartFile.fromFile(
            image.path,
            filename: basename(image.path),
            contentType: MediaType("image", "jpg"),
          ),
        },
      );

      Response response = await dio.post(
        baseUrl + registerFamilyEndPoints,
        data: data,
      );
      Map map = response.data.runtimeType == String
          ? json.decode(response.data)
          : response.data;

      if (map['Status'] == 1) {
        apiGet.pr.hide();
        // myget.Get.to(CheckSendCodeScreen(0, jawwal, true, paswword));
        getSheetSucsses('تم إرسال الكود');
      } else if (map['Status'] == 60) {
        apiGet.pr.hide();
        getSheetError('البيانات خاطئة');
      }
      // else if (!map['status']) {
      //   apiGet.pr.hide();
      //   getSheetError('البيانات موجودة');
      // }
      else {
        apiGet.pr.hide();
        getSheetError('البيانات خاطئة');
      }
    } catch (e) {
      apiGet.pr.hide();
    }
  }

  registerDelivery(
    String name,
    String jawwal,
    String country,
    String city,
    String idno,
    File imagefrontcar,
    File imagebackcar,
    File imagelisence,
    File imageform,
    String bankId,
    String nobank,
    String paswword,
    String passwordConfirmation,
    String latitude,
    String longitude,
    String fulltime,
  ) async {
    apiGet.pr.show();

    try {
      initDio();
      String fcmToken = await NotificationHelper().getToken();

      FormData data = FormData.fromMap({
        'name': name,
        'jawwal': '+966$jawwal',
        'country': country,
        'city': city,
        'idno': idno,
        'bank_id': bankId,
        'nobank': nobank,
        'password': paswword,
        'password_confirmation': passwordConfirmation,
        'latitude': latitude,
        'longitude': longitude,
        'fulltime': fulltime,
        'fcm_token': fcmToken,
        'imagefrontcar': await MultipartFile.fromFile(
          imagefrontcar.path,
          filename: basename(imagefrontcar.path),
          contentType: MediaType("imagefrontcar", "jpg"),
        ),
        'imagebackcar': await MultipartFile.fromFile(
          imagebackcar.path,
          filename: basename(imagebackcar.path),
          contentType: MediaType("imagebackcar", "jpg"),
        ),
        'imagelisence': await MultipartFile.fromFile(
          imagelisence.path,
          filename: basename(imagelisence.path),
          contentType: MediaType("imagelisence", "jpg"),
        ),
        'imageform': await MultipartFile.fromFile(
          imageform.path,
          filename: basename(imageform.path),
          contentType: MediaType("imageform", "jpg"),
        ),
      });

      Response response = await dio.post(
        baseUrl + registerDeliveryEndPoints,
        data: data,
      );
      Map map = response.data.runtimeType == String
          ? json.decode(response.data)
          : response.data;

      if (map['Status'] == 1) {
        apiGet.pr.hide();
        // myget.Get.to(CheckSendCodeScreen(1, jawwal, true, paswword));
        getSheetSucsses('تم إرسال الكود');
      } else if (map['Status'] == 60) {
        apiGet.pr.hide();
        getSheetError('البيانات خاطئة');
      } else if (!map['status']) {
        apiGet.pr.hide();
        getSheetError('البيانات موجودة');
      } else {
        apiGet.pr.hide();
        getSheetError('البيانات خاطئة');
      }
    } catch (e) {
      apiGet.pr.hide();
    }
  }

  Future<Map> getBanksName() async {
    try {
      initDio();
      Response response = await dio.get(
        baseUrl + bankEndPoints,
      );
      return response.data;
    } catch (e) {
      return null;
    }
  }

  updatelocation(
      String latitude, String longitude, String address, bool isOsra) async {
    apiGet.pr.show();
    String token = isOsra
        ? SPHelper.spHelper.getTokenFamily()
        : SPHelper.spHelper.getTokenDelivery();

    try {
      initDio();
      FormData formData = FormData.fromMap(
        {
          'latitude': latitude,
          'address': address,
          'longitude': longitude,
        },
      );
      Response response = await dio.post(
        baseUrl + updatelocationEndPoints,
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      Map map = response.data;
      if (map['status']) {
        apiGet.pr.hide();

        getSheetSucsses('تم التحديث سيتم مراجعة الطلب');
      } else {
        apiGet.pr.hide();
      }
    } catch (e) {
      apiGet.pr.hide();
    }
  }

  Future<Map> getProductsName() async {
    try {
      initDio();
      Response response = await dio.get(
        baseUrl + productEndPoints,
      );

      return response.data;
    } catch (e) {
      return null;
    }
  }

  getoffer() async {
    try {
      initDio();
      Response response = await dio.get(
        baseUrl + getofferEndPoints,
      );
      apiGet.offersMap.assignAll(response.data);
      return response.data;
    } catch (e) {
      return null;
    }
  }

  getContact() async {
    try {
      initDio();
      Response response = await dio.get(
        baseUrl + contactEndPoints,
      );

      apiGet.contactMap.assignAll(response.data);
      return response.data;
    } catch (e) {
      return null;
    }
  }

  getArticipation() async {
    try {
      initDio();
      Response response = await dio.get(
        baseUrl + getArticipationEndPoints,
      );

      apiGet.setBaqa(response.data);
    } catch (e) {
      return null;
    }
  }

  getsubparticipation(String baqaId) async {
    try {
      initDio();
      Response response = await dio.get(
        baseUrl + getsubparticipationEndPoints + '/$baqaId',
      );

      apiGet.setSubBaqa(response.data);
    } catch (e) {
      return null;
    }
  }

  subscribeBaqa(String subPartId, bool isFirst) async {
    String tokenFamily = SPHelper.spHelper.getTokenFamily();
    apiGet.pr.show();

    try {
      initDio();

      FormData formData = FormData.fromMap(
        {
          'sub_part_id': subPartId,
        },
      );
      Response response = await dio.post(
        baseUrl + subscribeEndPoints,
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $tokenFamily',
          },
        ),
      );

      Map map = response.data;

      if (map['status']) {
        apiGet.pr.hide();
        if (isFirst) {
          // myget.Get.offAll(HomeFamilyScreen());
          getProductsName();
          getProfile();
          getoffer();
          getosraproduct();

          getSheetSucsses('تم التسجيل بنجاح');
        } else {
          // myget.Get.offAll(HomeFamilyScreen());
          getProfile();
          getSheetSucsses('تمت الإضافة');
        }
      } else {
        apiGet.pr.hide();

        getSheetError('لم يتم الإضافة');
      }
    } catch (e) {
      apiGet.pr.hide();
    }
  }

  subscribeOffer(String offerId) async {
    String tokenFamily = SPHelper.spHelper.getTokenFamily();
    apiGet.pr.show();

    try {
      initDio();

      FormData formData = FormData.fromMap(
        {
          'offer_id': offerId,
        },
      );
      Response response = await dio.post(
        baseUrl + subscribeOfferEndPoints,
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $tokenFamily',
          },
        ),
      );

      Map map = response.data;
      if (map['status']) {
        apiGet.pr.hide();
        myget.Get.back();
        myget.Get.back();
        getSheetSucsses(map['msg']);
      } else {
        apiGet.pr.hide();

        getSheetError(map['msg']);
      }
    } catch (e) {
      apiGet.pr.hide();
    }
  }

  approvedorder(String requestId, String isApproved, String timeRequest) async {
    String tokenFamily = SPHelper.spHelper.getTokenFamily();
    apiGet.pr.show();

    try {
      initDio();

      FormData formData = FormData.fromMap(
        {
          'request_id': requestId,
          'is_approved': isApproved,
          'time_request': timeRequest,
        },
      );
      Response response = await dio.post(
        baseUrl + approvedorderEndPoints,
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $tokenFamily',
          },
        ),
      );
      FormData formData2 = isApproved == '1'
          ? FormData.fromMap(
              {
                'request_id': requestId,
                'status': '2',
              },
            )
          : {};
      isApproved == '1'
          ? await dio.post(
              baseUrl + changeorderstatusEndPoints,
              data: formData2,
              options: Options(
                headers: {
                  'Authorization': 'Bearer $tokenFamily',
                },
              ),
            )
          : print('');

      Map map = response.data;

      if (map['status']) {
        apiGet.pr.hide();
        requestforosra();
        accountuser();
        myget.Get.back();
        myget.Get.back();
        getSheetSucsses(map['msg']);
      } else {
        apiGet.pr.hide();

        getSheetError(map['msg']);
      }
    } catch (e) {
      apiGet.pr.hide();
    }
  }

  changestatusdelivery(String requestId, String status, String osraId) async {
    String tokenDelivery = SPHelper.spHelper.getTokenDelivery();
    apiGet.pr.show();

    try {
      initDio();

      FormData formData = FormData.fromMap(
        {
          'request_id': requestId,
          'status': status,
          'osra_id': osraId,
        },
      );
      Response response = await dio.post(
        baseUrl + 'changestatusdelivery',
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $tokenDelivery',
          },
        ),
      );

      Map map = response.data;

      if (map['status']) {
        apiGet.pr.hide();
        getProfile();
        await requestdelivery();
        await orderdelivery();
        await accountuser();

        // myget.Get.to(ProfileDeliveryScreen());
        myget.Get.back();

        getSheetSucsses(map['msg']);
      } else {
        apiGet.pr.hide();

        getSheetError(map['msg']);
      }
    } catch (e) {
      apiGet.pr.hide();
    }
  }

  changeorder(String requestId, String status) async {
    String tokenFamily = SPHelper.spHelper.getTokenFamily();
    apiGet.pr.show();

    try {
      initDio();

      FormData formData = FormData.fromMap(
        {
          'request_id': requestId,
          'status': status,
        },
      );
      Response response = await dio.post(
        baseUrl + changeorderstatusEndPoints,
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $tokenFamily',
          },
        ),
      );
      Map map = response.data;
      if (map['status']) {
        apiGet.pr.hide();
        requestforosra();
        orderDeailsosra(requestId);

        if (status == '3') {
          appGet.setCurentStep(3);
        }

        getSheetSucsses(map['msg']);
        await accountuser();
      } else {
        apiGet.pr.hide();
        orderDeailsosra(requestId);
        getSheetError(map['msg']);
      }
    } catch (e) {
      apiGet.pr.hide();
    }
  }

  Future<Map> getSubProductsName(String productId) async {
    try {
      initDio();
      Response response = await dio.get(
        baseUrl + subprodutEndPoints + '/$productId',
      );

      return response.data;
    } catch (e) {
      return null;
    }
  }

  Future<Map> getpriceproduct(String subProductId) async {
    try {
      initDio();
      Response response = await dio.get(
        baseUrl + getpriceproductEndPoints + '/$subProductId',
      );

      return response.data;
    } catch (e) {
      return null;
    }
  }

  requestforosra() async {
    try {
      initDio();
      String tokenFamily = SPHelper.spHelper.getTokenFamily();

      Response response = await dio.get(
        baseUrl + requestforosraEndPoints,
        options: Options(
          headers: {
            'Authorization': 'Bearer $tokenFamily',
          },
        ),
      );

      List data = response.data['request'];
      List orderOtherNews = data
          .where((element) =>
              element['status'] != '1' && element['status'] != null ||
              (element['is_approved'] == '5' && element['status'] == null))
          .toList();
      List orderNew = data
          .where((element) =>
              (element['status'] == null && element['is_approved'] != '5') ||
              element['status'] == '1' && element['is_approved'] == '0')
          .toList();

      apiGet.osraNewsOrderMap.value = orderNew;
      apiGet.osraOrderMap.value = orderOtherNews;
    } catch (e) {
      return null;
    }
  }

  orderDeailsosra(String orderId) async {
    try {
      initDio();
      String tokenFamily = SPHelper.spHelper.getTokenFamily();

      Response response = await dio.get(
        baseUrl + orderDeailsosraEndPoints + '/$orderId',
        options: Options(
          headers: {
            'Authorization': 'Bearer $tokenFamily',
          },
        ),
      );

      apiGet.osraOrderDeyailsMap.assignAll(response.data);
    } catch (e) {
      return null;
    }
  }

  orderDeailsDelivery(String orderId) async {
    try {
      initDio();
      String tokenDelivery = SPHelper.spHelper.getTokenDelivery();

      Response response = await dio.get(
        baseUrl + 'deliveryorder' + '/$orderId',
        options: Options(
          headers: {
            'Authorization': 'Bearer $tokenDelivery',
          },
        ),
      );

      apiGet.deliveryOrderDeyailsMap2.assignAll(response.data);
    } catch (e) {
      return null;
    }
  }

  requestdelivery() async {
    try {
      initDio();
      String tokenDelivery = SPHelper.spHelper.getTokenDelivery();

      Response response = await dio.get(
        baseUrl + 'requestdelivery',
        options: Options(
          headers: {
            'Authorization': 'Bearer $tokenDelivery',
          },
        ),
      );

      // List orderOtherNews = data
      //     .where((element) =>
      //         element['status'] != '1' && element['status'] != null ||
      //         (element['is_approved'] == '5' && element['status'] == null))
      //     .toList();

      // List orderNew = data
      //     .where((element) =>
      //         (element['status'] == null && element['is_approved'] != '5') ||
      //         element['status'] == '1' && element['is_approved'] == '0')
      //     .toList();
      apiGet.deliveryAllOrderMap.assignAll(response.data);
    } catch (e) {
      return null;
    }
  }

  verifycode(
    String jawwal,
    String code,
    int type,
  ) async {
    try {
      apiGet.pr.show();
      initDio();

      FormData formData = FormData.fromMap({
        'jawwal': '+966$jawwal',
        'code': code,
      });
      Response response = await dio.post(
        baseUrl + verifycodeosraEndPoints,
        data: formData,
      );

      if (response.data['status']) {
        apiGet.pr.hide();

        myget.Get.to(ForgetPasswordScreen(type, jawwal));
      } else {
        apiGet.pr.hide();
        getSheetError('لم يتم التأكيد');
      }
    } catch (e) {
      apiGet.pr.hide();

      return null;
    }
  }

  Future<int> verifycode2(
    String jawwal,
    String code,
    String password,
    int type,
  ) async {
    try {
      apiGet.pr.show();
      initDio();

      FormData formData = FormData.fromMap({
        'jawwal': '+966$jawwal',
        'code': code,
        'password': password,
      });
      Response response = await dio.post(
        baseUrl + verifycodeEndPoints,
        data: formData,
      );

      Map map = response.data;
      if (response.data['status'] == 2) {
        apiGet.pr.hide();
        apiGet.type = map['user']['type'];

        map['user']['type'] == 'osra'
            ? SPHelper.spHelper.setTokenFamily(
                map['access_token'],
              )
            : SPHelper.spHelper.setTokenDelivery(
                map['access_token'],
              );

        apiGet.type = map['user']['type'];

        await getSheetSucsses('تم الدخول بنجاح');
        await accountuser();
        FireBaseHelper.fireBaseHelper.setUserInformation(
            idMobile: '+966$jawwal',
            type: map['user']['type'],
            name: map['user']['name'],
            id: map['user']['id'].toString(),
            image: map['user']['image'] ??
                'https://san3h.com/images/1615457869.jpg');
        if (map['user']['type'] == 'osra') {
          // myget.Get.offAll(ChooseBaqaScreen(true));
        } else {
          myget.Get.offAll(ProfileDeliveryScreen());
          getProfile();
          return 1;
        }
      } else {
        apiGet.pr.hide();
        getSheetError('الرمز خاطئ');
      }
    } catch (e) {
      apiGet.pr.hide();

      return null;
    }
  }

  changepassword(
      String jawwal, String password, String passwordConfirmation) async {
    try {
      apiGet.pr.show();
      initDio();
      FormData formData = FormData.fromMap({
        'jawwal': '+966$jawwal',
        'password': password,
        'password_confirmation': passwordConfirmation,
      });
      Response response = await dio.post(
        baseUrl + changepasswordEndPoints,
        data: formData,
      );

      if (response.data['status']) {
        apiGet.pr.hide();
        myget.Get.to(SignInDeliveryScreen());
        getSheetSucsses(response.data['msg']);
      } else {
        apiGet.pr.hide();
        getSheetError(response.data['msg']);
      }
    } catch (e) {
      apiGet.pr.hide();

      return null;
    }
  }

  resetpassword2(String jawwal) async {
    apiGet.pr.show();
    initDio();

    FormData formData = FormData.fromMap({
      'jawwal': '+966$jawwal',
    });
    Response response = await dio.post(
      baseUrl + 'resendcode',
      data: formData,
    );

    Map map = response.data.runtimeType == String
        ? json.decode(response.data)
        : response.data;
    if (map['Status'] == 1) {
      apiGet.pr.hide();
      getSheetSucsses('تم إرسال الكود');
    } else if (response.data['Status'] == 60) {
      apiGet.pr.hide();
      getSheetError('تأكد من الرقم المدخل');
    } else if (!map['status']) {
      apiGet.pr.hide();

      getSheetError('الرقم المدخل غير موجود');
    }
  }

  resetpassword(String jawwal, int type) async {
    try {
      apiGet.pr.show();
      initDio();
      FormData formData = FormData.fromMap({
        'jawwal': '+966$jawwal',
      });
      Response response = await dio.post(
        baseUrl + resetpasswordosraEndPoints,
        data: formData,
      );

      Map map = response.data.runtimeType == String
          ? json.decode(response.data)
          : response.data;
      if (map['Status'] == 1) {
        apiGet.pr.hide();
        // myget.Get.to(CheckSendCodeScreen(type, jawwal, false, ''));
        getSheetSucsses('تم إرسال الكود');
      } else if (response.data['Status'] == 60) {
        apiGet.pr.hide();
        getSheetError('تأكد من الرقم المدخل');
      } else if (!map['status']) {
        apiGet.pr.hide();

        getSheetError('الرقم المدخل غير موجود');
      }
    } catch (e) {
      apiGet.pr.hide();

      return null;
    }
  }

  Future<int> addosraproduct(
    File image,
    String productId,
    String subProductId,
    String price,
    String drink,
    String extraproduct,
  ) async {
    String tokenFamily = SPHelper.spHelper.getTokenFamily();
    apiGet.pr.show();

    try {
      initDio();

      FormData data = FormData.fromMap(
        drink == null
            ? {
                'image': await MultipartFile.fromFile(
                  image.path,
                  filename: basename(image.path),
                  contentType: MediaType("image", "jpg"),
                ),
                'product_id': productId,
                'sub_product_id': subProductId,
                'price': price,
                'extraproduct': extraproduct,
              }
            : {
                'image': await MultipartFile.fromFile(
                  image.path,
                  filename: basename(image.path),
                  contentType: MediaType("image", "jpg"),
                ),
                'product_id': productId,
                'sub_product_id': subProductId,
                'price': price,
                'drink': drink,
                'extraproduct': extraproduct,
              },
      );

      Response response = await dio.post(
        baseUrl + addosraproductEndPoints,
        data: data,
        options: Options(
          headers: {
            'Authorization': 'Bearer $tokenFamily',
          },
        ),
      );

      Map map = response.data;
      if (map['status']) {
        apiGet.pr.hide();
        getosraproduct();
        appGet.mapExtra.clear();
        return map['product']['is_aproved'];
      } else {
        apiGet.pr.hide();
        // getSheetError(map['msg']);
        return -1;
      }
    } catch (e) {
      apiGet.pr.hide();

      return -1;
    }
  }

  Future<int> addNewOsraproduct(
    File image,
    String name,
    String price,
    String drink,
    String extraproduct,
  ) async {
    String tokenFamily = SPHelper.spHelper.getTokenFamily();
    apiGet.pr.show();

    try {
      initDio();

      FormData data = FormData.fromMap(
        drink == null
            ? {
                'image': await MultipartFile.fromFile(
                  image.path,
                  filename: basename(image.path),
                  contentType: MediaType("image", "jpg"),
                ),
                'name': name,
                'price': price,
                'extraproduct': extraproduct,
              }
            : {
                'image': await MultipartFile.fromFile(
                  image.path,
                  filename: basename(image.path),
                  contentType: MediaType("image", "jpg"),
                ),
                'name': name,
                'price': price,
                'drink': drink == null ? " " : drink,
                'extraproduct': extraproduct,
              },
      );

      Response response = await dio.post(
        baseUrl + addosraproductEndPoints,
        data: data,
        options: Options(
          headers: {
            'Authorization': 'Bearer $tokenFamily',
          },
        ),
      );

      Map map = response.data;
      if (map['status']) {
        apiGet.pr.hide();
        getosraproduct();
        appGet.mapExtra.clear();
        // appGet.imageProduct = null;
        return map['product']['is_aproved'];
      } else {
        // appGet.imageProduct = null;
        appGet.mapExtra.clear();
        apiGet.pr.hide();
        // getSheetError(map['msg']);
        return -1;
      }
    } catch (e) {
      apiGet.pr.hide();

      return -1;
    }
  }

  getProfile2() async {
    String token = SPHelper.spHelper.getTokenDelivery();

    try {
      initDio();
      Response response = await dio.get(
        baseUrl + userProfileEndPoints,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      Map map = response.data;

      if (map['status']) {
        apiGet.mapProfile.assignAll(map);
        apiGet.isOpen.value = map['userprofile'][0]['isopen'] == null
            ? true
            : map['userprofile'][0]['isopen'] == '1'
                ? true
                : false;
      }
    } catch (e) {}
  }

  getProfile() async {
    String token = apiGet.type == 'osra'
        ? SPHelper.spHelper.getTokenFamily()
        : SPHelper.spHelper.getTokenDelivery();

    try {
      initDio();
      Response response = await dio.get(
        baseUrl + userProfileEndPoints,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      Map map = response.data;

      if (map['status']) {
        apiGet.mapProfile.assignAll(map);
        apiGet.isOpen.value = map['userprofile'][0]['isopen'] == null
            ? true
            : map['userprofile'][0]['isopen'] == '1'
                ? true
                : false;
        if (apiGet.type != 'osra') {
          FireBaseHelper.fireBaseHelper.updateUserDetails(
            id: map['userprofile'][0]['jawwal'],
            image: map['userprofile'][0]['delivery']['imageform'],
            name: map['userprofile'][0]['name'],
          );
        }
      }
    } catch (e) {}
  }

  accountuser() async {
    String token = apiGet.type == 'osra'
        ? SPHelper.spHelper.getTokenFamily()
        : SPHelper.spHelper.getTokenDelivery();

    try {
      initDio();
      Response response = await dio.get(
        baseUrl + 'accountuser',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      Map map = response.data;

      if (map['status']) {
        apiGet.accountuserMap.assignAll(map);
      }
    } catch (e) {}
  }

  editProfile(File image, String jawwal, String name) async {
    String token = apiGet.type == 'osra'
        ? SPHelper.spHelper.getTokenFamily()
        : SPHelper.spHelper.getTokenDelivery();
    apiGet.pr.show();

    try {
      initDio();

      FormData data = FormData.fromMap(apiGet.type == 'osra'
          ? image == null
              ? {
                  'name': name,
                  'jawwal': jawwal.contains('+966') ? jawwal : '+966$jawwal',
                }
              : {
                  'name': name,
                  'jawwal': jawwal.contains('+966') ? jawwal : '+966$jawwal',
                  'image': await MultipartFile.fromFile(
                    image.path,
                    filename: basename(image.path),
                    contentType: MediaType("image", "jpg"),
                  ),
                }
          : image == null
              ? {
                  'name': name,
                  'jawwal': jawwal.contains('+966') ? jawwal : '+966$jawwal',
                }
              : {
                  'name': name,
                  'jawwal': jawwal.contains('+966') ? jawwal : '+966$jawwal',
                  'imageform': await MultipartFile.fromFile(
                    image.path,
                    filename: basename(image.path),
                    contentType: MediaType("imageform", "jpg"),
                  ),
                });
      Response response = await dio.post(
        baseUrl + editProfileEndPoints,
        data: data,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      Map map = response.data as Map;

      if (map['status']) {
        apiGet.pr.hide();
        getProfile();

        if (apiGet.type == 'osra') {
          FireBaseHelper.fireBaseHelper.updateUserDetails(
            id: jawwal.contains('+966') ? jawwal : '+966$jawwal',
            image: apiGet.type == 'osra'
                ? map['editprofile']['image']
                : map['editprofile']['imageform'],
            name: map['editprofile']['name'],
          );
        }

        getSheetSucsses('تم التعديل بنجاح');
      } else {
        apiGet.pr.hide();
        getSheetError('لم يتم التعديل بنجاح');
      }
    } catch (e) {
      apiGet.pr.hide();
    }
  }

  changIsopen(String isopen) async {
    String token = apiGet.type == 'osra'
        ? SPHelper.spHelper.getTokenFamily()
        : SPHelper.spHelper.getTokenDelivery();
    apiGet.pr.show();
    try {
      initDio();

      FormData data = FormData.fromMap({
        'isopen': isopen,
      });
      Response response = await dio.post(
        baseUrl + changIsopenEndPoints,
        data: data,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      Map map = response.data as Map;

      if (map['status']) {
        apiGet.pr.hide();
        getProfile();
        getSheetSucsses('تم التعديل بنجاح');
      } else {
        apiGet.pr.hide();
        getSheetError('لم يتم التعديل بنجاح');
      }
    } catch (e) {
      apiGet.pr.hide();
    }
  }

  getosraproduct() async {
    String tokenFamily = SPHelper.spHelper.getTokenFamily();

    try {
      initDio();
      Response response = await dio.get(
        baseUrl + getosraproductEndPoints,
        options: Options(
          headers: {
            'Authorization': 'Bearer $tokenFamily',
          },
        ),
      );
      Map map = response.data as Map;

      if (map['status']) {
        apiGet.mapProductFamily.assignAll(map);
      }
    } catch (e) {}
  }

  deleteosraproduct(String productId) async {
    try {
      initDio();
      apiGet.pr.show();

      String tokenFamily = SPHelper.spHelper.getTokenFamily();

      FormData data = FormData.fromMap({
        'id': productId,
      });
      Response response = await dio.post(
        baseUrl + 'deleteosraproduct',
        data: data,
        options: Options(
          headers: {
            'Authorization': 'Bearer $tokenFamily',
          },
        ),
      );

      getosraproduct();
      apiGet.pr.hide();
      getSheetSucsses('تم حذف المنتج');
    } catch (e) {
      apiGet.pr.hide();
    }
  }

  getSearchOsraProduct(String data) async {
    String tokenFamily = SPHelper.spHelper.getTokenFamily();

    try {
      initDio();
      Response response = await dio.post(
        baseUrl + getSearchOsraProductEndPoints,
        data: FormData.fromMap({'data': data}),
        options: Options(
          headers: {
            'Authorization': 'Bearer $tokenFamily',
          },
        ),
      );
      Map map = response.data as Map;

      if (map['status']) {
        apiGet.mapProductFamily.assignAll(map);
      }
    } catch (e) {}
  }

  conectUs(String message) async {
    String token = apiGet.type == 'osra'
        ? SPHelper.spHelper.getTokenFamily()
        : SPHelper.spHelper.getTokenDelivery();
    apiGet.pr.show();
    try {
      initDio();

      FormData data = FormData.fromMap({
        'message': message,
      });
      Response response = await dio.post(
        baseUrl + 'helpme',
        data: data,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      Map map = response.data as Map;

      if (map['status']) {
        apiGet.pr.hide();
        getProfile();
        getSheetSucsses('تم إرسال الرسالة');
      } else {
        apiGet.pr.hide();
        getSheetError('لم يتم إرسال الرسالة');
      }
    } catch (e) {
      apiGet.pr.hide();
    }
  }

  getevalute() async {
    String token = apiGet.type == 'osra'
        ? SPHelper.spHelper.getTokenFamily()
        : SPHelper.spHelper.getTokenDelivery();
    try {
      initDio();

      Response response = await dio.get(
        baseUrl + 'getevalute',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      Map map = response.data as Map;

      if (map['status']) {
        apiGet.evaluteMap.assignAll(map);
      }
    } catch (e) {
      apiGet.pr.hide();
    }
  }

  orderdelivery() async {
    String token = SPHelper.spHelper.getTokenDelivery();
    try {
      initDio();

      Response response = await dio.get(
        baseUrl + 'orderdelivery',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      // Map map = response.data as Map;

      apiGet.notAcceptdeliveryOrderMap
          .assignAll(response.data['delivery_order']);
    } catch (e) {
      apiGet.pr.hide();
    }
  }

  getAllrequestforuser() async {
    String token = apiGet.type == 'osra'
        ? SPHelper.spHelper.getTokenFamily()
        : SPHelper.spHelper.getTokenDelivery();
    try {
      initDio();

      Response response = await dio.get(
        baseUrl + 'allrequestforuser',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      Map map = response.data as Map;

      if (map['status']) {
        apiGet.notificationMap.assignAll(map);
      } else {}
    } catch (e) {
      apiGet.pr.hide();
    }
  }

  //payment
  initPayment(
    String baqaChoose,
    String price,
    bool isFirst,
  ) async {
    initDio();
    apiGet.pr.show();

    FormData formData = FormData.fromMap({
      'ivp_method': 'create',
      'ivp_store': '24774',
      'ivp_authkey': 'z9h9-dx3zk^wZRn4',
      'ivp_amount': price,
      'ivp_currency': 'SAR',
      'bill_city': apiGet.mapProfile.isEmpty
          ? ''
          : apiGet.mapProfile['userprofile'][0]['osra_user']['address'],
      'bill_addr1': apiGet.mapProfile.isEmpty
          ? ''
          : apiGet.mapProfile['userprofile'][0]['osra_user']['address'],
      'bill_phone': apiGet.mapProfile.isEmpty
          ? ''
          : apiGet.mapProfile['userprofile'][0]['jawwal'],
      'bill_country': 'SA',
      'ivp_test': '0',
      'ivp_cart': '$price${DateTime.now()}${DateTime.now().second}',
      'ivp_desc': 'to Subscripb baqa',
      'return_auth': 'https://san3h.com/success',
      'return_decl': 'https://san3h.com/error',
      'return_can': 'https://san3h.com/error',
      'ivp_lang': 'ar',
    });
    Response response = await dio.post(
      // 'https://secure.telr.com/gateway/order.json',
      baseUrl + 'pay',
      data: formData,
    );

    apiGet.pr.hide();

    myget.Get.to(WebViewScreen(
      response.data['order'],
      isFirst,
      baqaChoose,
    ));
  }

  paymentStep2(String orderRef, String baqaChoose, bool isFirst) async {
    initDio();
    apiGet.pr.show();

    FormData formData = FormData.fromMap({
      'ivp_method': 'check',
      'ivp_store': '24774',
      'ivp_authkey': 'z9h9-dx3zk^wZRn4',
      'order_ref': orderRef,
    });
    Response response = await dio.post(
      'https://secure.telr.com/gateway/order.json',
      data: formData,
    );

    if (response.data['order']['status']['code'] == 3) {
      apiGet.pr.hide();

      Server.server.subscribeBaqa(baqaChoose, isFirst);
    }
  }

  chatNotification(String message, String recivedId) async {
    String token = apiGet.type == 'osra'
        ? SPHelper.spHelper.getTokenFamily()
        : SPHelper.spHelper.getTokenDelivery();
    try {
      initDio();

      FormData data = FormData.fromMap({
        'message': message,
        'dest_user_id': recivedId,
      });
      Response response = await dio.post(
        baseUrl + 'chatlog',
        data: data,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      Map map = response.data as Map;

      if (map['status']) {
      } else {}
    } catch (e) {}
  }
}
