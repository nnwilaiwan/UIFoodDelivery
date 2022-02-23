import 'package:flutter/material.dart';
import 'package:fooddelivery/model/appTextSetting.dart';
import 'package:fooddelivery/screen/constants.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  void initState() {
    super.initState();
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
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Order',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 10),
            Column(
              children: orderList(
                context,
                heightScreen,
                widthScreen,
                AppTextSetting.LIST_ORDER,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Payment",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: widthScreen * 0.45,
                          width: widthScreen * 0.3,
                          child: Card(
                            color: Colors.black,
                            child: Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Column(
                                children: [
                                  const Align(
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      "**** 4832",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 80),
                                  const Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      "\$25.99",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          "assets/icons/visa.png",
                                          width: 45,
                                          height: 35,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: widthScreen * 0.45,
                          width: widthScreen * 0.3,
                          child: Card(
                            color: Colors.white,
                            child: Center(
                              child: Container(
                                  child: const Icon(
                                Icons.add,
                                size: 35,
                                color: Colors.grey,
                              )),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
            Container(
              width: widthScreen,
              height: 45,
              margin: const EdgeInsets.all(5),
              child: RaisedButton(
                color: Colors.green,
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Confirm Payment",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  List<Widget> orderList(BuildContext context, double heightScreen,
      double widthScreen, dynamic item) {
    List<Widget> card = [];

    for (int i = 0; i < item.length; i++) {
      var items = item[i];
      card.add(
        Card(
          color: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Slidable(
                actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: 0.25,
                secondaryActions: <Widget>[
                  IconSlideAction(
                    caption: 'Delete',
                    color: Colors.red,
                    icon: Icons.delete,
                    onTap: () {
                      _showDialogDel(this.context, 'ยืนยัน',
                          'ท่านต้องการลบรายการนี้หรือไม่ ?', items['id'], '1');
                    },
                  ),
                ],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Container(
                        //     margin: const EdgeInsets.only(left: 10),
                        //     child: Text(items['id'].toString())),
                        Container(
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              items['image'],
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              items['name'],
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      // AppTextSetting.item++;
                                      items['qty']++;
                                    });
                                    print(items['qty']);
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
                                  items['qty'].toStringAsFixed(2),
                                  // '${AppTextSetting.item}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                )),
                                const SizedBox(width: 10),
                                IconButton(
                                  onPressed: () {
                                    if (items['qty'] > 1) {
                                      setState(() {
                                        items['qty']--;
                                        // AppTextSetting.item--;
                                      });
                                    }
                                    print(items['qty']);
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
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.all(8),
                      child: Text(
                        "\$ " + items['price'].toStringAsFixed(2),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
    return card;
  }

  _showDialogDel(
      BuildContext context, String title, String text, String id, String from) {
    // set up the button
    Widget delButton = FlatButton(
      child: Text(
        "ลบ",
        style: TextStyle(
          fontSize: 16,
          color: Colors.blue[700],
        ),
      ),
      onPressed: () {
        // if (from == "1") {
        //   AppTextSetting.PRODUCT_ORDER_LIST
        //       .removeWhere((item) => item['id'] == id);
        // }
        setState(() {
          if (from == "1") {
            AppTextSetting.LIST_ORDER.removeWhere((item) => item['id'] == id);
            Navigator.of(context).pop();
          }
        });
      },
    );

    Widget closeButton = FlatButton(
      child: Text(
        "ยกเลิก",
        style: TextStyle(
          fontSize: 16,
          color: Colors.blue[700],
        ),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          color: Colors.grey[700],
        ),
      ),
      content: Text(
        text,
        style: TextStyle(
           fontSize: 16, color: Colors.grey[700]),
      ),
      actions: [delButton, closeButton],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
