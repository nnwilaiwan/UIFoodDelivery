import 'package:flutter/material.dart';

class DemoScreen extends StatelessWidget {
  const DemoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset("assets/icons/menu.png"),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset("assets/icons/shopping-cart.png"),
          ),
        ],
      ),
      body: const Center(
        child: Text('wait...',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            )),
      ),
    );
  }
}
