import 'package:flutter/material.dart';

import '../models/item_model.dart';
import '../screens/item_details_screen.dart';

class ItemView extends StatelessWidget {
  const ItemView({
    super.key,
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemDetailsScreen(
              item: item,
            ),
          ),
        );
      },
      child: Container(
        width: 120,
        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Expanded(
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                Image.asset(item.itemImage[0], height: 100, width: 100),
                const SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(item.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                    const SizedBox(
                      height: 3,
                    ),
                    Text("৳ ${item.price}",
                        style: TextStyle(color: Colors.deepOrange, fontSize: 15)),
                    const SizedBox(
                      height: 3,
                    ),
                    Text("${item.sellCount} Sold",
                        style: TextStyle(color: Colors.grey)),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
