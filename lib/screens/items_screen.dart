import 'package:daraz_clone/data/dummy_data.dart';
import 'package:daraz_clone/models/category_model.dart';
import 'package:daraz_clone/provider/cart_provider.dart';
import 'package:daraz_clone/widgets/item_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/item_model.dart';
import '../widgets/all_item_view.dart';
import '../widgets/cart_item_counter.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({super.key, required this.category});

  final Category category;

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  List<Item> newItems = [];

  void filter() {
    for (final item in items) {
      if (item.category.contains(widget.category.categoryTitle)) {
        newItems.add(item);
      }
    }
  }

  @override
  void initState() {
    filter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.category.categoryTitle),
          /*IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart_outlined),
          ),*/
          actions: [
            Padding(
              padding:
              const EdgeInsets.only(left: 0, right: 25, top: 8, bottom: 8),
              child: Stack(
                children: [
                  Consumer<CartProvider>(
                    builder: (context, value, child) => CartCounter(
                      count: value.list.length.toString(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: Colors.grey[200],
        body: newItems.isNotEmpty
            ? GridView(
                padding: EdgeInsets.all(10.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .72,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5),
                children: [
                  for (final item in newItems) AllItemView(item: item),
                ],
              )
            : Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('demo_images/logo.png', height: 150),
                      SizedBox(
                        height: 25,
                      ),
                      Text('We\'re sorry', style: TextStyle(fontSize: 16)),
                      SizedBox(
                        height: 5,
                      ),
                      Text('We cannot find any match for your search term.',
                          style: TextStyle(
                              fontSize: 15, color: Colors.grey.shade600)),
                    ]),
              ));
  }
}
