import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_backend/model/productmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class apis {
  static FirebaseAuth auth = FirebaseAuth.instance;

  //for firestore
  static FirebaseFirestore Firestore = FirebaseFirestore.instance;

  //for storage
  static FirebaseStorage storage = FirebaseStorage.instance;

  static Future<String> post(
      File file,
      String MobileName,
      String Price,
      String Stock,
      String Dstorage,
      String RAM,
      String PrevPrice,
      String Display,
      String Dsize,
      String Resolution,
      String Processor,
      String MainCam,
      String FrontCam,
      String Battery,
      String Charging,
      String ChildCategoris
      ) async {
    final ext = file.path.split('.').last;
    final ref =
    storage.ref().child('SmartPhone/${file.path}.$ext');
    await ref.putFile(file, SettableMetadata(contentType: 'image/$ext'));

    var imgUrl = await ref.getDownloadURL();
    final CollectionReference postCollection = FirebaseFirestore.instance
        .collection("categories")
        .doc("4RhnyeeaXIEQ4OZeRhey")
        .collection(ChildCategoris);

    final DocumentReference newDocument = await postCollection.add({
      "Images": imgUrl,
      "MobileName": MobileName,
      "StockUpdate": Stock,
      "Storage": Dstorage,
      "RAM": RAM,
      "Price": Price,
      "PreviousPrice": PrevPrice,
      "Display": Display,
      "Size": Dsize,
      "Resolution": Resolution,
      "Processor": Processor,
      "MainCamera": MainCam,
      "FrontCamera": FrontCam,
      "Battery": Battery,
      "Charging": Charging,
    });

    final String documentId = newDocument.id;

    await newDocument.update({
      "DocId": documentId,
    });

    return documentId;
  }

  //apis for fetch smart phone
  static Stream<QuerySnapshot<Map<String, dynamic>>> getSmartPhone() {
    return Firestore
        .collection('categories')
        .doc("4RhnyeeaXIEQ4OZeRhey")
        .collection('SmartPhone')
        .snapshots();
  }

}
