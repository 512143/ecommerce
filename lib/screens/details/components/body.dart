import 'package:ecommerce/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/models/Product.dart';

import 'add_to_cart.dart';
import 'color_and_size.dart';
import 'counter_with_fav_btn.dart';
import 'description.dart';
import 'product_title_with_image.dart';

class Body extends StatelessWidget {
  final Product product;

  int amount = 1;
  Body({Key? key, required this.product}) : super(key: key);

  void addToCart() {
    Cart.cart[product] = amount;
  }

  void incrementAmount() {
    amount++;

    print('Количество товара $amount');
  }

  void decrementAmount() {
    amount--;
    print('Количество товара $amount');
  }

  @override
  Widget build(BuildContext context) {
    // It provide us total height and width
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: kDefaultPaddin,
                    right: kDefaultPaddin,
                  ),
                  // height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      ColorAndSize(product: product),
                      SizedBox(height: kDefaultPaddin / 2),
                      Description(product: product),
                      SizedBox(height: kDefaultPaddin / 2),
                      CounterWithFavBtn(
                        incrementAmount: incrementAmount,
                        decrmentAmount: decrementAmount,
                      ),
                      SizedBox(height: kDefaultPaddin / 2),
                      AddToCart(
                        product: product,
                        addToCart: addToCart,
                      )
                    ],
                  ),
                ),
                ProductTitleWithImage(product: product)
              ],
            ),
          )
        ],
      ),
    );
  }
}
