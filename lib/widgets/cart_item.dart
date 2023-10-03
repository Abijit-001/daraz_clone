import 'package:daraz_clone/models/item_model.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final Size screenSize;
  final Item item;

  const CartItem({
    super.key,
    required this.screenSize,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
      width: screenSize.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: Colors.white,
              offset: Offset(0, 1),
              blurRadius: 0,
              spreadRadius: 3)
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            item.itemImage[0],
            height: 100,
            width: 100,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 5,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 5),
                Text(
                  item.shopName,
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    Text(
                      '৳${item.price}',
                      style: TextStyle(fontSize: 16, color: Colors.deepOrange),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
