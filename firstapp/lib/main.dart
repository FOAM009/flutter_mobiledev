import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'F&M Shop',
      theme: ThemeData(
        colorScheme: .fromSeed(
          seedColor: const Color.fromARGB(255, 73, 185, 220),
        ),
      ),
      home: const MyHomePage(title: 'Calculate Change'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var price = TextEditingController();
  var amount = TextEditingController();
  var change = TextEditingController();
  double _total = 0;
  double _change = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Column(
        children: [
          SizedBox(height: 8.0),
          priceTextField(),
          amountTextField(),
          calculateButton(),
          showTotalText(),
          receiveMoneyTextField(),
          changeCalculateBotton(),
          showChangeText(),
        ],
      ),
    );
  }

  Widget priceTextField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: price,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "price per item",
        ),
        keyboardType: TextInputType.numberWithOptions(),
      ),
    );
  }

  Widget amountTextField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: amount,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "amount of item",
        ),
        keyboardType: TextInputType.numberWithOptions(),
      ),
    );
  }

  Widget calculateButton() {
    return ElevatedButton(
      onPressed: () {
        if (price.text.isNotEmpty && amount.text.isNotEmpty) {
          setState(() {
            _total = double.parse(price.text) * double.parse(amount.text);
          });
        }
      },
      child: Text("Calculate Total "),
    );
  }

  Widget showTotalText() {
    return Text("Total: $_total Baht");
  }

  Widget receiveMoneyTextField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: change,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "get money",
        ),
      ),
    );
  }

  Widget changeCalculateBotton() {
    return ElevatedButton(
      onPressed: () {
        if (price.text.isNotEmpty &&
            amount.text.isNotEmpty &&
            change.text.isNotEmpty) {
          double total = double.parse(price.text) * double.parse(amount.text);
          double money = double.parse(change.text);

          if (money < total) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("money is not enough")));
            return;
          }

          setState(() {
            _change = money - total;
          });
        }
      },
      child: Text("Calculate Change"),
    );
  }

  Widget showChangeText() {
    return Text("Change: $_change Baht");
  }
}
