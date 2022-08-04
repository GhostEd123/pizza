import 'package:flutter/material.dart';
import 'cart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza Delivery App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // var size,height,width;
  List<String> images = [
    'assets/images/buffalo.jpeg',
    'assets/images/hawaiian.jpeg',
    'assets/images/MeatPizza.jpeg',
    'assets/images/MagaritaPizza.jpg',
    'assets/images/BBQchicken.jpeg',
    'assets/images/VeggiePizza.jpeg',
    'assets/images/pepperonniPizza.jpg',
  ];
  List<String> pizzaType = [
    "Veggie ",
    "Pepperoni ",
    "Meat Pizza ",
    "Margherita Pizza ",
    "BBQ Chicken Pizza ",
    "Hawaiian Pizza ",
    "Buffalo Pizza ",
  ];
  List<int> pizzaPrice = [1000, 1350, 1330, 1300, 1370, 1400, 1350];
  @override
  Widget build(BuildContext context) {
    // size = MediaQuery.of(context).size;
    // height = size.height;
    // width = size.width;
    return Scaffold(
        // backgroundColor: Colors.black12,
        appBar: AppBar(
          title: const Text('Pizza Delivery App'),
          centerTitle: true,
          backgroundColor: Colors.black,
          actions: [
            IconButton(
                onPressed: () {
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  CartPage()));
                },
                icon: const Icon(Icons.shopping_cart))
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
                // stops: [0.6,0.4],
                colors: [Colors.white24, Colors.black12]),
          ),
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                itemBuilder: (buildContext, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CartPage(
                                pizzaType: pizzaType[index],
                                pizzaPrice: pizzaPrice[index],
                                pizzaPicture: images[index],
                              )));
                    },
                    child: Container(
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(images[index]),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              '${pizzaType[index]}' +
                                  '' +
                                  '(N${pizzaPrice[index]})',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Oswald',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      height: 100,
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
                itemCount: images.length,
                shrinkWrap: true,
                padding: const EdgeInsets.all(5),
                scrollDirection: Axis.vertical,
              )),
        ));
  }
}
