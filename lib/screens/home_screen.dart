import 'package:daraz_clone/models/category_model.dart';
import 'package:daraz_clone/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../data/dummy_data.dart';
import '../provider/cart_provider.dart';
import '../widgets/cart_item_counter.dart';
import '../widgets/category_view.dart';
import '../widgets/item_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List offerImages = [
    'demo_images/offer_2.jpg',
    'demo_images/offer_1.jpg',
    'demo_images/offer_3.jpg',
    'demo_images/offer_4.jpg',
  ];
  int offerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        body: Column(
          children: [
            OfferSliderStack(),
            Container(
              color: Colors.grey[200],
              child: Column(
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      for (final item in categories)
                        Expanded(
                          child: CategoryView(
                            category: item,
                          ),
                        ),
                      const SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      for (final item in categories.reversed)
                        Expanded(
                          child: CategoryView(
                            category: item,
                          ),
                        ),
                      const SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              child: Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    for (final item in items)
                      ItemView(
                        item: item,
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Stack OfferSliderStack() {
    return Stack(
      children: [
        Stack(
          children: [
            CarouselSlider(
              items: offerImages
                  .map((image) => Builder(
                        builder: (context) {
                          return Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(image), fit: BoxFit.fill),
                            ),
                          );
                        },
                      ))
                  .toList(),
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  setState(() {
                    offerIndex = index;
                  });
                },
                height: 200,
                viewportFraction: 1,
                autoPlay: true,
              ),
            ),
            Positioned(
              bottom: 20,
              left: 150,
              child: AnimatedSmoothIndicator(
                  activeIndex: offerIndex,
                  count: offerImages.length,
                  effect: const WormEffect(
                      dotHeight: 10,
                      dotWidth: 10,
                      dotColor: Colors.black26,
                      activeDotColor: Colors.white)),
            ),
            Positioned(
                top: 10,
                left: 60,
                right: 80,
                height: 30,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 0),
                      color: Colors.white),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                      hintStyle: TextStyle(fontSize: 14),
                      prefixIcon: Icon(Icons.search_outlined),
                    ),
                  ),
                ),),
            Positioned(
              top: 6,
              right: 10,
              child:
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
            ),)
          ],
        ),
      ],
    );
  }
}
