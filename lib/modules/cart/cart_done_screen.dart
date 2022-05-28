import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_shop/component/component.dart';

class CartDoneScreen extends StatelessWidget {
  const CartDoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFECB7BF),
        title: Text(
          "Cart",
          style: TextStyle(
              color: Colors.black,
              fontFamily: "Playfair Display",
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 29, right: 28, top: 103, bottom: 36.1),
            child: Image.asset(
              'assets/images/cart.png',
              width: screenWidth,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 114, right: 115, bottom: 23),
            child: Text(
              "Whoops!",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Playfair Display"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 72, right: 37, bottom: 24),
            child: Text(
              "Your cart is empty now. Check our\nproducts and buy it.",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Playfair Display"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 139.5,left: 62, right: 36),
            child: defaultButton4(text: "Go to products", fun: () {}),
          )
        ],
      ),
    );
  }
}
