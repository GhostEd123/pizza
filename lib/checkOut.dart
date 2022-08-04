import 'package:flutter/material.dart';
import 'lastPage.dart';

class ReceiptPage extends StatefulWidget {
  String? pizzaSize;
  String? toppings;
  int? pizzaPricee;
  String? pizzaTypee;

  ReceiptPage(
      {Key? key,
      required this.pizzaPricee,
      required this.pizzaTypee,
      required this.pizzaSize,
      required this.toppings});

  @override
  State<ReceiptPage> createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Receipt'),
        centerTitle: true,
        backgroundColor: Colors.black,
        // actions: [
        //   ElevatedButton(
        //     onPressed: (){},
        //     child: const Text('Save'))
        // ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
              // stops: [0.6,0.4],
              colors: [Colors.white24, Colors.black12]),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Please enter your details below!',
                style: TextStyle(
                  fontFamily: 'Oswald',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: fullNameController,
                decoration: const InputDecoration(
                  hintText: 'Full Name:',
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: phoneNumberController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Phone Number:',
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: addressController,
                decoration: const InputDecoration(
                  hintText: 'Address:',
                  prefixIcon: Icon(
                    Icons.location_pin,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                ),
                onPressed: () {
                  print(widget.pizzaSize);
                  print(widget.toppings);

                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => LastPage(
                            pizzaPrice: widget.pizzaPricee,
                            pizzaType: widget.pizzaTypee,
                            fullName: fullNameController.text,
                            address: addressController.text,
                            phoneNumber: phoneNumberController.text,
                            pizzaSize: widget.pizzaSize,
                            toppings: widget.toppings,
                          )));
                },
                child: const Text('CONFIRM ORDER!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
