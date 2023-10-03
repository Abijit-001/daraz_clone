import 'package:daraz_clone/screens/cart_screen.dart';
import 'package:flutter/material.dart';

import 'package:badges/badges.dart' as badges;

class CartCounter extends StatelessWidget {
  const CartCounter({
    super.key,
    required this.count,
  });

  final String count;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(),));
      },
      child: badges.Badge(
        badgeContent: Text(
          count ?? "0",
          style: TextStyle(color: Colors.white, fontSize: 10),),
        child: Icon(Icons.shopping_cart_outlined),
      ),
    );
  }
}