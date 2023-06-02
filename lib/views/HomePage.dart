import 'dart:io';

import 'package:ecommerce_backend/service/apis.dart';
import 'package:ecommerce_backend/widgets/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
TextEditingController _mobileNameController = TextEditingController();
TextEditingController _storageNameController = TextEditingController();
TextEditingController _ramNameController = TextEditingController();
TextEditingController _prevController = TextEditingController();
TextEditingController _priceController = TextEditingController();
TextEditingController _displayController = TextEditingController();
TextEditingController _sizeController = TextEditingController();
TextEditingController _resulationController = TextEditingController();
TextEditingController _mainController = TextEditingController();
TextEditingController _frontController = TextEditingController();
TextEditingController _batteryController = TextEditingController();
TextEditingController _processorController = TextEditingController();

class _HomePageState extends State<HomePage> {
  var selected = "Choose";
  var charging = "Choose";
  String?selectCategory ;
  String? _image;
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(CupertinoIcons.add)),
              Tab(icon: Icon(Icons.image)),
              Tab(icon: Icon(Icons.category)),
            ],
          ),
          centerTitle: true,
          title: Text('Add post'),
          leading: IconButton(
            onPressed: (){

            },
            icon: Icon(Icons.menu),
          ),
        ),
        drawer: Drawer(

          child: widgetDrawer(),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 12.0,right: 12.0),
          child: TabBarView(
            children: [
              Tab(child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        label: Text("Mobile Name"),
                        hintText: "Mobile Name",
                      ),
                      controller: _mobileNameController,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        label: Text("Storage"),
                        hintText: "64GB",
                      ),
                      controller: _storageNameController,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        label: Text("Ram"),
                        hintText: "8GB",
                      ),
                      controller: _ramNameController,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        label: Text("PreviousPrice"),
                        hintText: "৳10000",
                      ),
                      controller: _prevController,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        label: Text("Sale Price"),
                        hintText: "৳90000",
                      ),
                      controller: _priceController,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        label: Text("Display"),
                        hintText: "Amolet Panel",
                      ),
                      controller: _displayController,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        label: Text("Size"),
                        hintText: "6.5 inch",
                      ),
                      controller: _sizeController,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        label: Text("Display Resolution"),
                        hintText: "1244 x 680",
                      ),
                      controller: _resulationController,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        label: Text("Main Camera"),
                        hintText: "54 MP",
                      ),
                      controller: _mainController,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        label: Text("Front Camera"),
                        hintText: "12 MP",
                      ),
                      controller: _frontController,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        label: Text("Processor"),
                        hintText: "Mediatek",
                      ),
                      controller: _processorController,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        label: Text("Battery"),
                        hintText: "5000 mAh",
                      ),
                      controller: _batteryController,
                    ),
                  ],
                ),
              )),
              Tab(child: Column(
                children: [
                  DropdownButton(
                      items: [
                        DropdownMenuItem(value: "Stock", child: Text("Stock")),
                        DropdownMenuItem(value: "Out of Stock", child: Text("Out of Stock")),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selected = value!;
                        });
                      },
                    hint: Text(selected),
                  ),
                  DropdownButton(
                      items: [
                        DropdownMenuItem(value: "Fast Charging", child: Text("Fast Charging")),
                        DropdownMenuItem(value: "No Fast Charging", child: Text("Not Fast Charging")),
                      ],
                      onChanged: (value) {
                        setState(() {
                          charging = value!;
                        });
                      },
                    hint: Text(charging),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final ImagePicker picker = ImagePicker();
                      // Pick an image.
                      final XFile? image =
                      await picker.pickImage(source: ImageSource.gallery,imageQuality: 80);
                      if(image!=null){
                        setState(() {
                          _image=image.path;
                        });
                      }},
                    child: Text("Choose Image"),
                  ),
                ],
              )),
              Tab(child: Column(
                children: [
                  Row(
                    children: [
                      Radio(value: "SmartPhone", groupValue: selectCategory, onChanged: (value){
                        setState(() {
                          selectCategory = value.toString();
                        });
                      }),
                      Text("Smartphone"),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(value: "Pre-OwendDevices", groupValue: selectCategory, onChanged: (value){
                        setState(() {
                          selectCategory = value.toString();
                        });
                      }),
                      Text("Pre-Owend Devices"),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(value: "AppleGadget", groupValue: selectCategory, onChanged: (value){
                        setState(() {
                          selectCategory = value.toString();
                        });
                      }),
                      Text("Apple Gadget"),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(value: "SmartWatch", groupValue: selectCategory, onChanged: (value){
                        setState(() {
                          selectCategory = value.toString();
                        });
                      }),
                      Text("Smart Watch"),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(value: "TWS", groupValue: selectCategory, onChanged: (value){
                        setState(() {
                          selectCategory = value.toString();
                        });
                      }),
                      Text("TWS"),
                    ],
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                      onPressed: (){
                        apis.post(
                            File(_image!),
                            _mobileNameController.text,
                            _priceController.text,
                            selected,
                            _storageNameController.text,
                            _ramNameController.text,
                            _prevController.text,
                            _displayController.text,
                            _sizeController.text,
                            _resulationController.text,
                            _processorController.text,
                            _mainController.text,
                            _frontController.text,
                            _batteryController.text,
                            charging,
                            selectCategory.toString());


                      }, child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text("Post"),
                  )),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
