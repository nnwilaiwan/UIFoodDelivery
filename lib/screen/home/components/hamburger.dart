import 'package:flutter/material.dart';
import 'package:fooddelivery/model/appTextSetting.dart';
import 'package:fooddelivery/model/product.dart';
import 'package:fooddelivery/screen/constants.dart';
import 'package:fooddelivery/screen/detail/detailScreen.dart';
import 'package:fooddelivery/screen/home/components/product_card.dart';

class Hamburger extends StatelessWidget {
  const Hamburger({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hamburger',
          style: Theme.of(context).textTheme.headline5!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
        ),
        SingleChildScrollView(
          child: Container(
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              children: List.generate(demo_product.length, (index) {
                return Container(
                  child: ProductCard(
                    image: demo_product[index].image,
                    title: demo_product[index].title,
                    price: demo_product[index].price,
                    press: () {
                      AppTextSetting.itemDetail = 1;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            product: demo_product[index],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
