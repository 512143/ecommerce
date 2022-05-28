import 'package:ecommerce/constants.dart';
import 'package:ecommerce/models/Product.dart';
import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/screens/details/components/body.dart';
import 'package:ecommerce/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';

import '../../models/cart.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key? key}) : super(key: key);
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double totalPrice = 0;
  double totalProduct = 0;

  void _calculateTotalProduct() {
    if (Cart.cart.isEmpty) {
      totalProduct == 0;
    } else {
      for (int i = 0; i < Cart.cart.length; i++) {
        totalProduct += 1;
      }
    }
  }

  void _calculateTotalPrice() {
    if (Cart.cart.isEmpty) {
      totalPrice == 0;
    } else {
      for (int i = 0; i < Cart.cart.length; i++) {
        totalPrice += Cart.cart.keys.toList()[i].price;
      }
    }
  }

  @override
  void initState() {
    _calculateTotalProduct();
    _calculateTotalPrice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          elevation: 0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.blueGrey,
            ),
          ),
          title: Text(
            "Корзина",
            style: TextStyle(color: Colors.blueGrey),
          ),
        ),
        body: Cart.cart.length > 0
            ? ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(height: 20.0),
                itemBuilder: (BuildContext context, int index) =>
                    SwipeActionCell(
                        key: ObjectKey(Cart.cart.keys.toList()[index]),
                        trailingActions: <SwipeAction>[
                          SwipeAction(

                              ///this is the same as iOS native
                              performsFirstActionWithFullSwipe: true,
                              title: "Удалить",
                              onTap: (CompletionHandler handler) async {
                                Cart.cart.removeWhere((key, value) =>
                                    key == Cart.cart.keys.toList()[index]);
                                setState(() {});
                              },
                              color: Colors.red),
                        ],
                        child: ProductItem(
                          product: Cart.cart.keys.toList()[index],
                        )),
                itemCount: Cart.cart.length,
              )
            : Center(
                child: Text("Корзина пуста", style: TextStyle(fontSize: 20.0)),
              ),
        bottomNavigationBar: Cart.cart.isNotEmpty
            ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                height: 70.0,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Итого:",
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text('\$${totalPrice.toString()}',
                            style: TextStyle(
                                color: Color.fromARGB(255, 45, 160, 48),
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                    Spacer(),
                    Text(
                      'Всего товаров: ',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '${totalProduct.toString()}',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600),
                    ),
                    Spacer(),
                    OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        'Купить',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600),
                      ),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.greenAccent,
                        side: BorderSide(width: 7.0, color: Colors.greenAccent),
                        minimumSize: Size(90, 60),
                      ),
                    )
                  ],
                ))
            : const SizedBox());
  }
}

class ProductItem extends StatelessWidget {
  ProductItem({Key? key, required this.product}) : super(key: key);
  final Product product;
  int selectedPage = 0;
  PageController _pageController = PageController();
  void setSelectedPage(int index) {
    selectedPage = index;
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      constraints: BoxConstraints(minHeight: 100.0),
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.green[200],
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
              spreadRadius: 7.0,
              blurRadius: 7.0,
              color: Colors.greenAccent.withOpacity(.3),
              offset: const Offset(0, 9)),
        ],
      ),
      child: Row(
        children: [
          Image.asset(product.image, height: 130.0),
          const SizedBox(width: 20.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.title,
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.w600),
              ),
              Text(
                '\$${product.price.toString()}',
                style: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w800,
                    color: Colors.deepPurpleAccent),
              ),
            ],
          ),
          Spacer(),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => HomeScreen()),
              );
            },
            child: Text(
              "Купить",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            style: TextButton.styleFrom(
              primary: Color.fromARGB(255, 46, 14, 119),
            ),
          ),
        ],
      ),
    );
  }
}
