import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:delivery_boy/backend/api_get.dart';
import 'package:delivery_boy/models/message_model.dart';

class FireBaseHelper {
  FireBaseHelper._();
  final ApiGet apiGet = Get.find();

  static FireBaseHelper fireBaseHelper = FireBaseHelper._();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  newMessage({MessageModel message, String senderId, String reciverId}) async {
    firestore.collection('Chats').doc('$reciverId$senderId').set({
      "users": [senderId, reciverId],
    });
    firestore
        .collection('Chats')
        .doc('$reciverId$senderId')
        .collection('Messages')
        .add(message.toJson());
  }

  getNumberChat() {}
  Future<Map<String, dynamic>> getInfoUser(String receviedId) async {
    DocumentSnapshot querySnapshot =
        await firestore.collection('Users').doc(receviedId).get();

    Map<String, dynamic> data = querySnapshot.data();
    return data;
  }

  updateReadMessage(String senderId, String reciverId) async {
    QuerySnapshot querySnapshot = await firestore
        .collection('Chats')
        .doc('$reciverId$senderId')
        .collection('Messages')
        .where('recieverId', isEqualTo: senderId)
        .get();

    for (var i = 0; i < querySnapshot.docs.length; i++) {
      await firestore
          .collection('Chats')
          .doc('$reciverId$senderId')
          .collection('Messages')
          .doc(querySnapshot.docs[i].id)
          .update({'read': true});
    }
  }

  Future<List<Map<String, dynamic>>> getAllMyChats({String myId}) async {
    QuerySnapshot querySnapshot = await firestore
        .collection('Chats')
        .where('users', arrayContains: myId)
        .get();

    List<Map<String, dynamic>> mapUsers = [];
    for (QueryDocumentSnapshot queryDocumentSnapshot in querySnapshot.docs) {
      Map<String, dynamic> data = queryDocumentSnapshot.data();
      Map<String, dynamic> dataUser = {};

      List users = data['users'];
      String otherId = users.where((element) => element != myId).toList().first;
      Map map = await getUserInformation(otherId);
      dataUser['mobile'] = otherId;
      dataUser['usersInfo'] = map;

      mapUsers.add(dataUser);
    }
    apiGet.listChats..value = mapUsers;
    return mapUsers;
  }

  Future<Map> getUserInformation(String id) async {
    DocumentSnapshot documentSnapshot =
        await firestore.collection('Users').doc(id).get();
    return documentSnapshot.data();
  }

  setUserInformation(
      {String idMobile,
      String id,
      String image,
      String name,
      String type}) async {
    await firestore.collection('Users').doc(idMobile).set({
      'id': id,
      'image': image,
      'name': name,
      'type': type,
    });
  }

  Stream<QuerySnapshot> getAllChatMessages(String reciverId, String senderId) {
    Stream<QuerySnapshot> stream = FirebaseFirestore.instance
        .collection('Chats')
        .doc('$reciverId$senderId')
        .collection('Messages')
        .orderBy('timeStamp')
        .snapshots();
    return stream;
  }

  Future<QuerySnapshot> getAllChatMessagesWithoutStream(
      String reciverId, String senderId) async {
    QuerySnapshot stream = await FirebaseFirestore.instance
        .collection('Chats')
        .doc('$reciverId$senderId')
        .collection('Messages')
        .orderBy('timeStamp')
        .get();
    return stream;
  }

  deleteMyChats({String reciverId}) async {
    await firestore.collection('Chats').doc(reciverId).delete();
  }

  updateUser(String id, String state, String date) async {
    await firestore.collection('Users').doc(id).update(
      {
        'date': date,
        'state': state,
      },
    );
  }

  updateUserDetails({String id, String image, String name}) async {
    await firestore.collection('Users').doc(id).update(
      {
        'image': image,
        'name': name,
      },
    );
  }
}
