import 'package:flutter/material.dart';

class Calculatepage extends StatefulWidget {
  const Calculatepage({super.key});

  @override
  State<Calculatepage> createState() => _CalculatepageState();
}

class _CalculatepageState extends State<Calculatepage> {
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

        title: Text(widget.toString()),
      ),
      body: Column(
        children: [
          SizedBox(height: 8.0),
          Text(
            "Change Calculate",
            style: TextStyle(
              fontSize: 24,
              fontFamily: "maa",
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic,
              color: Colors.blue,
              backgroundColor: Colors.pinkAccent,
            ),
          ),
          Image.asset("assets/food.png", width: 100, height: 100),
          Image.network(
            "https://media1.tenor.com/m/hi610Pd9rWAAAAAC/quby.gif",
            width: 100,
            height: 100,
          ),
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
