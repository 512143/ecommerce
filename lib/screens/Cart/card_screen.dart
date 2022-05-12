import 'package:ecommerce/models/Product.dart';
import 'package:ecommerce/models/cart.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.white,
       automaticallyImplyLeading: false,
       leading: IconButton(
         onPressed: (){
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
     body: ListView.separated(
       padding: const EdgeInsets.symmetric(vertical: 20.0),
       separatorBuilder: (BuildContext context, int index)
       =>const SizedBox(height:20.0),
       itemBuilder: (BuildContext context,int index)
       =>ProductItem(product: Cart.cart.keys.toList()[index],),
       itemCount: Cart.cart.length,
    ),
    );
  }
}
class ProductItem extends StatelessWidget {
   ProductItem({Key? key , required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      constraints: BoxConstraints(
        minHeight: 100.0
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10 ),
      decoration: BoxDecoration(
          color: Colors.green[200],
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              spreadRadius: 7.0,
              blurRadius: 7.0,
              color: Colors.greenAccent.withOpacity(.3),
              offset: const Offset(0, 9)
            ),
          ],
          ),
          child: Row(
            children: [
              Image.asset(product.image, height: 130.0 ),
              const SizedBox(width: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  
                  Text(
                    '\$${product.price.toString()}',
                    style: const TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.deepPurpleAccent
                    ),
                  ),
                ],
                )

            ],
          ),
    );
  }
}