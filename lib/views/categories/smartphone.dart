import 'package:flutter/material.dart';

class smartPhone extends StatefulWidget {
  final String MobileName;
  final String Price;
  const smartPhone({Key? key, required this.MobileName, required this.Price}) : super(key: key);

  @override
  State<smartPhone> createState() => _smartPhoneState();
}

class _smartPhoneState extends State<smartPhone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
        return ListTile(
          title: Text(widget.MobileName),
          subtitle: Text(widget.Price),
          // leading: Image.network(""),
          trailing: Icon(Icons.delete),
        );
      },),
    );
  }
}
