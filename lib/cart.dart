import 'package:flutter/material.dart';
import 'package:pizza/checkOut.dart';


class CartPage extends StatefulWidget {
  //  CartPage() : super(key: key);
  String? pizzaType;
  int? pizzaPrice;
  String? pizzaPicture;

  CartPage(
      {Key? key,
      required this.pizzaPrice,
      required this.pizzaType,
      required this.pizzaPicture});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // int count = 6;
  String? selectedSize;
  String? selectedToppings;
  List<String> toppings = [
    "Mushroom",
    "Onions",
    "Green pepper",
    "Extra cheese",
    "Pepperoni",
    "Sausage",
    "Pineapple",
    "Ham",
  ];

  // int? pizzaPrice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: const Text('Pizza Delivery App'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 120,
                backgroundImage: AssetImage('${widget.pizzaPicture}'),
                // height: 300,
                // decoration: BoxDecoration(
                //   image: DecorationImage(
                //     image: ,
                //   ),
                // ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '${widget.pizzaType}' + '' + '(N${widget.pizzaPrice})',
                style: const TextStyle(fontSize: 23, fontFamily: 'Oswald'),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      print(widget.pizzaPrice);
                      setState(() {
                        selectedSize = 'S';
                      });
                      // color: ;
                      // widget.pizzaPrice = widget.pizzaPrice! + 100;
                      // print(pizzaPrice);
                    },
                    child: CircleAvatar(
                      child: const Text('S'),
                      backgroundColor:
                          selectedSize == 'S' ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedSize = 'M';
                      });
                    },
                    child: CircleAvatar(
                      child: const Text('M'),
                      backgroundColor:
                          selectedSize == 'M' ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedSize = 'L';
                      });
                    },
                    child: CircleAvatar(
                      child: const Text('L'),
                      backgroundColor:
                          selectedSize == 'L' ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2.6,
                    child: ListView.separated(
                      itemBuilder: (buildContext, index) {
                        return GestureDetector(
                          onTap: () {
                            //  Navigator.of(context).push(
                            //    MaterialPageRoute(builder:
                            //    (context) =>  CartPage(
                            //      pizzaType: pizzaType[index],
                            //      pizzaPrice: pizzaPrice[index],
                            //      pizzaPicture: images[index],
                            //      )
                            //    )
                            // );

                            setState(() {
                              selectedToppings = toppings[index];
                              // print(toppings[index]);
                            });
                          },
                          child: Container(
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                // CircleAvatar(
                                //   radius: 40,
                                //   backgroundImage: AssetImage(images[index]),
                                // ),
                                // const SizedBox(
                                //   width: 10,
                                // ),
                                Expanded(
                                  child: Text(
                                    '${toppings[index]}' + '   ' + '(N100)',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Oswald',
                                      color: selectedToppings == toppings[index]
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: selectedToppings == toppings[index]
                                  ? Colors.white
                                  : Colors.black,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            height: 60,
                            // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                            // tileColor: Colors.black,
                            // style: ListTileStyle.drawer,
                          ),
                        );
                      },
                      separatorBuilder: (buildContext, index) {
                        return const Divider(
                          height: 10,
                          color: Colors.white,
                        );
                      },
                      itemCount: toppings.length,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(5),
                      scrollDirection: Axis.vertical,
                    ),
                  )),
              const SizedBox(
                width: 40,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                ),
                onPressed: () {
                  if (selectedSize == 'S') {
                    widget.pizzaPrice = widget.pizzaPrice! + 300;
                  } else if (selectedSize == 'M') {
                    widget.pizzaPrice = widget.pizzaPrice! + 500;
                  } else if (selectedSize == 'L') {
                    widget.pizzaPrice = widget.pizzaPrice! + 1000;
                  }
                  widget.pizzaPrice = widget.pizzaPrice! + 100;
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ReceiptPage(
                            pizzaPricee: widget.pizzaPrice,
                            pizzaTypee: widget.pizzaType,
                            pizzaSize: selectedSize,
                            toppings: selectedToppings,
                          )));
                  print(widget.pizzaPrice);
                  print(widget.pizzaType);
                },
                child: const Text('ORDER NOW!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
