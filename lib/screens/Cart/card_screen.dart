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
       itemBuilder: (BuildContext context,int index)=>ProductItem(),
       itemCount: 2,
    ),
    );
  }
}
class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      constraints: BoxConstraints(
        minHeight: 100.0
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
          color: Colors.green[200],
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              spreadRadius: 7.0,
              blurRadius: 7.0,
              color: Colors.purple.withOpacity(.3),
              offset: const Offset(0, 9)
            ),
          ],
          ),
    );
  }
}