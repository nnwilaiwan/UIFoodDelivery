// ignore_for_file: deprecated_member_use

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fooddelivery/model/appTextSetting.dart';
import 'package:fooddelivery/model/product.dart';
import 'package:fooddelivery/screen/constants.dart';
import 'package:fooddelivery/screen/order/order_screen.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
    AppTextSetting.itemDetail = 1;
  }

  String randomID() {
    var number = 0;
    var rng = Random();
    number = rng.nextInt(100000);
    print(number);
    return number.toString();
  }

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        leading: const BackButton(
          color: Colors.black,
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
            icon: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset(
                "assets/icons/shopping-cart.png",
                height: 20,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Image.asset(
            widget.product.image,
            height: MediaQuery.of(context).size.height * 0.5,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.product.title,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        Image.asset(
                          "assets/icons/love.png",
                          color: Colors.red,
                          width: 25,
                          height: 25,
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Description",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: defaultPadding),
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi non quis exercitationem culpa nesciunt nihil aut nostrum explicabo reprehenderit optio amet ab temporibus asperiores quasi cupiditate. Voluptatum ducimus voluptates voluptas?",
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Row(
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      AppTextSetting.itemDetail++;
                                      print(AppTextSetting.itemDetail);
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.add_circle_outline_outlined,
                                    size: 35,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Center(
                                    child: Text(
                                  "${AppTextSetting.itemDetail}",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                )),
                                const SizedBox(width: 10),
                                IconButton(
                                  onPressed: () {
                                    if (AppTextSetting.itemDetail > 1) {
                                      setState(() {
                                        AppTextSetting.itemDetail--;
                                        print(AppTextSetting.itemDetail);
                                      });
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.remove_circle_outline,
                                    size: 35,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          "\$" + widget.product.price.toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: widthScreen,
                      height: 45,
                      margin: const EdgeInsets.all(15),
                      child: RaisedButton(
                        color: Colors.green,
                        onPressed: () {
                          AppTextSetting.LIST_ORDER.add({
                            "id": randomID(),
                            "image": widget.product.image,
                            "name": widget.product.title,
                            "qty": AppTextSetting.itemDetail,
                            "price": widget.product.price,
                          });

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OrderScreen(),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Add to cart",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
