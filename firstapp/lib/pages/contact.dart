import 'package:firstapp/pages/calc.dart';
import 'package:flutter/material.dart';

class Contactpage extends StatefulWidget {
  const Contactpage({super.key});

  @override
  State<Contactpage> createState() => _ContactpageState();
}

class _ContactpageState extends State<Contactpage> {
  final items = List<String>.generate(1000, (i) => "item $i");

  @override
  Widget build(BuildContext context) {
    List mydata = ['apple', 'banana', 'papaya'];
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Calculatepage()),
            );
          },
          leading: Icon(Icons.map),
          title: Text(mydata[index]),
        );
      },
      itemCount: mydata.length,
    );
  }
}
