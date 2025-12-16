import 'package:flutter/material.dart';

class Contactpage extends StatefulWidget {
  const Contactpage({super.key});

  @override
  State<Contactpage> createState() => _ContactpageState();
}

class _ContactpageState extends State<Contactpage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(child: Column(children: [Text("Aj TUI"), Text("@CAMT114")])),
      ],
    );
  }
}
