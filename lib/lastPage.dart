import 'package:flutter/material.dart';
import 'main.dart';

class LastPage extends StatelessWidget {
  String? fullName;
  String? address;
  String? pizzaSize;
  String? toppings;
  String? pizzaType;
  int? pizzaPrice;
  LastPage({
    Key? key,
    required this.pizzaType,
    required this.pizzaPrice,
    required this.pizzaSize,
    required this.toppings,
    required this.fullName,
    required this.address,
    required phoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            // stops: [0.6,0.4],
            colors: [Colors.white24,Colors.black12]
            ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "HERE IS YOUR RECEIPT DETAILS",
                style: myStyle(),
                ),
              Text(
                "Picked pizza: $pizzaType",
                style: myStyle(),
                ),
              Text(
                "Pizza size: $pizzaSize",
                style: myStyle(),
                ),
              Text(
                "Toppings: $toppings",
                style: myStyle(),
                ),
              Text(
                "Total cost of your order: $pizzaPrice",
                style: myStyle(),
                ),
                const SizedBox(
                  height: 20,
                ),
              Text(
                " Thank you for placing your order $fullName. Your order will be delivered to $address in 15 minutes time.",
                style: myStyle(),
                textAlign: TextAlign.center,
              ),
              TextButton(
                child: const Text('Home'),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const MyHomePage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

TextStyle myStyle() {
  return const TextStyle(
    fontFamily: 'Oswald',
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontSize: 15,
  );
}
