import 'package:daraz_clone/screens/items_screen.dart';
import 'package:flutter/material.dart';

import '../models/category_model.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ItemsScreen(category: category,),));
      },
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          height: 90,
          width: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 0,color: Colors.white),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: Column(children: [
            const SizedBox(
              height: 5,
            ),
            Image.asset(
              category.categoryImage,
              fit: BoxFit.fill,
              width: 60,
              height: 60,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              category.categoryTitle,
              style: TextStyle(
                fontSize: 14,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          ]),
        ),
      ),
    );
  }
}
