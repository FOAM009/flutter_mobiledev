import 'package:flutter/material.dart';

class Contactpage extends StatefulWidget {
  const Contactpage({super.key});

  @override
  State<Contactpage> createState() => _ContactpageState();
}

class _ContactpageState extends State<Contactpage> {
  @override
  Widget build(BuildContext context) {
    List mydata = ['apple', 'banana', 'papaya'];
    return ListView(
      children: [
        ListTile(
          onTap: () {},
          leading: Icon(Icons.map),
          title: Text(mydata[0]),
          subtitle: Text("subtitle"),
          trailing: FlutterLogo(),
        ),
        ListTile(onTap: () {}, leading: FlutterLogo(), title: Text(mydata[1])),
        ListTile(onTap: () {}, leading: FlutterLogo(), title: Text(mydata[2])),
      ],
    );
  }
}
