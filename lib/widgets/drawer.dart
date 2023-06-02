import 'package:ecommerce_backend/views/allProducts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class widgetDrawer extends StatelessWidget {
  const widgetDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DrawerHeader(child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Menu"),
            Icon(Icons.person,size: 80,),
          ],
        ),decoration: BoxDecoration(color: Colors.blue)),
        ListTile(
          onTap: (){
            Navigator.push(context, CupertinoPageRoute(builder: (_)=>allProducts()));
          },
          title: Text("All Products"),
          leading: Icon(Icons.production_quantity_limits_rounded),
        ),
        ListTile(
          onTap: (){

          },
          title: Text("All Users"),
          leading: Icon(Icons.person),
        ),
        ListTile(
          onTap: (){

          },
          title: Text("Banner Controller"),
          leading: Icon(Icons.image),
        ),
      ],
    );
  }
}
