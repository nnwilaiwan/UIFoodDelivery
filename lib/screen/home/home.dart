import 'package:flutter/material.dart';
import 'package:fooddelivery/screen/constants.dart';
import 'package:fooddelivery/screen/home/components/categories.dart';
import 'package:fooddelivery/screen/home/components/hamburger.dart';
import 'package:fooddelivery/screen/order/order_screen.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset("assets/icons/menu.png"),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OrderScreen(),
                ),
              );
            },
            icon: Image.asset("assets/icons/shopping-cart.png"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Food',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const Text(
              'Delivery',
              style: TextStyle(
                fontSize: 30,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            Form(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  filled: true,
                  fillColor: Colors.white,
                  border: outlineInputBorder,
                  focusedBorder: outlineInputBorder,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Image.asset(
                      "assets/icons/search.png",
                      scale: 25,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Categories(),
            const SizedBox(height: 10),
            const Hamburger(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

const outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(defaultBorderRadius),
    ),
    borderSide: BorderSide.none);
