import 'package:flutter/material.dart';
import 'package:fooddelivery/screen/constants.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.press,
  }) : super(key: key);
  final String image, title;
  final double price;

  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: press,
      child: Container(
        width: 200,
        height: 250,
        margin: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                image,
                height: 150,
                fit: BoxFit.fitHeight,
              ),
            ),
            const SizedBox(height: defaultPadding / 2),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: widthScreen,
                height: 35,
                decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                )),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: const EdgeInsets.all(8),
                child: Text(
                  "\$" + price.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            )
            // Row(
            //   children: [
            //     Expanded(
            //       child: Text(
            //         title,
            //         style: const TextStyle(
            //           color: Colors.black,
            //         ),
            //       ),
            //     ),
            //     const SizedBox(width: defaultPadding / 4),
            //     Text(
            //       "\$" + price.toString(),
            //       style: Theme.of(context).textTheme.subtitle2,
            //     )
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
