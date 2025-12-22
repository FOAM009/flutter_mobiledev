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
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        MyBox(
          "What is a computer?",
          "Computer is a things to calculate and fo any other works",
          "https://media1.tenor.com/m/b0cev0cRVSYAAAAC/yes-chef.gif",
        ),
        SizedBox(height: 20),
        MyBox(
          "What is a Flutter?",
          "Flutter is a tool to create a mobile application",
          "https://media1.tenor.com/m/vYrfrjSAI4QAAAAd/chef-muppets.gif",
        ),
        SizedBox(height: 20),
        MyBox(
          "What is a Dart?",
          "Dart is the language used in Flutter",
          "https://media1.tenor.com/m/jG-m1kDAe5oAAAAd/cooking-cook.gif",
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget MyBox(String title, String subtitle, String img_url) {
    return Container(
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
