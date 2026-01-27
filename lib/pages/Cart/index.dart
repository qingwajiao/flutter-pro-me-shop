import 'package:flutter/material.dart';

class CartView extends StatefulWidget{
  const CartView({super.key});
  
  @override
  State<StatefulWidget> createState() => _cartViewState();
  
}

// ignore: camel_case_types
class _cartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("购物车"),
      ),
    );
  }


}
