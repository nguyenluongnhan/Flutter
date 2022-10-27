import 'dart:html';

import 'package:a/components/product_title_width_image.dart';
import 'package:a/constants.dart';
import 'package:a/model/Product.dart';
import 'package:a/screen/cart_srceen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class dBody extends StatelessWidget {
  final ProductModel product;
  const dBody({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.5),
                  height: 400,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      )),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                        child: Text(
                          product.description ?? "",
                          style: TextStyle(
                            height: 1.5,
                            color: kTextColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CartCounter(),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CartScreen(
                                          product: product,
                                        )));
                          },
                          child: Text("Add to cart"))
                    ],
                  ),
                ),
                ProductTitleWidthImage(product: product),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CartCounter extends StatefulWidget {
  const CartCounter({super.key});

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
        ),
        // SizedBox(
        //   width: 30,
        //   height: 32,
        OutlinedButton(
          // padding: EdgeInsets.zero,
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(13),
          //),
          onPressed: () {
            setState(() {
              numOfItems--;
            });
          },
          child: Icon(Icons.remove),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            numOfItems.toString().padLeft(2, "0"),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        OutlinedButton(
          // padding: EdgeInsets.zero,
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(13),
          //),
          onPressed: () {
            setState(() {
              numOfItems++;
            });
          },
          child: Icon(Icons.add),
        ),
        // )
      ],
    );
  }
}
