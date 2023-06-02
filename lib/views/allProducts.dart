import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_backend/service/apis.dart';
import 'package:ecommerce_backend/views/categories/smartphone.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../model/productmodel.dart';

class allProducts extends StatefulWidget {
  const allProducts({Key? key}) : super(key: key);

  @override
  State<allProducts> createState() => _allProductsState();
}
List<ProductModel> smartphone = [];

class _allProductsState extends State<allProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("All Products"),
      ),
      body: Wrap(
        children: [
          StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: apis.getSmartPhone(),
            builder: (context, snapshot) {
              final data = snapshot.data?.docs;
              smartphone = data?.map((e) => ProductModel.fromJson(e.data())).toList() ?? [];
              return InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: mq.height * 0.2,
                    width: mq.width * 0.42,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.red,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text(smartphone.length.toString(),style: TextStyle(fontSize: 28),),
                      Text("Smart Phone",style: TextStyle(fontSize: 20),),
                    ],),
                  ),
                ),
              );
            }
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: mq.height * 0.2,
              width: mq.width * 0.42,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.red,
              ),
              child: Text(""),
            ),
          ),
        ],
      ),
    );
  }
}
