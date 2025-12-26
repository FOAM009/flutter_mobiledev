import 'dart:convert';

import 'package:firstapp/pages/detail.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: FutureBuilder(
        builder: (context, snapshot) {
          var data = json.decode(snapshot.data.toString());
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return MyBox(
                data[index]['title'],
                data[index]['subtitle'],
                data[index]['img_url'],
              );
            },
            itemCount: data.length,
          );
        },
        future: DefaultAssetBundle.of(context).loadString('assets/data.json'),
      ),
    );
  }

  Widget MyBox(String title, String subtitle, String img_url) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(20),
      height: 150,
      decoration: BoxDecoration(
        color: Colors.blue[200],
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(img_url),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5),
            BlendMode.darken,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(fontSize: 15, color: Colors.blueGrey),
          ),
          SizedBox(height: 15),
          TextButton(
            onPressed: () {
              print("next page >>");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailPage()),
              );
            },
            child: Text("read more", style: TextStyle(color: Colors.amber)),
          ),
        ],
      ),
    );
  }
}
