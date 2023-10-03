import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:daraz_clone/provider/cart_provider.dart';
import 'package:daraz_clone/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_stripe/flutter_stripe.dart' as stripe;
import '../models/item_model.dart';
import '../widgets/cart_item_counter.dart';

class ItemDetailsScreen extends StatefulWidget {
  const ItemDetailsScreen({super.key, required this.item});

  final Item item;

  @override
  State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  int offerIndex = 0;

  Map<String, dynamic>? paymentIntent;

  Future<void> payment() async {
    print('${widget.item.price}');

    try {
      Map<String, dynamic> body = {
        'amount': "${widget.item.price}00",
        'currency': "BDT",
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization':
              'Bearer sk_test_51Njh5MBrgg9vq6KSWxReEvKMARIecrWPksvJtCKNH6cDBShXcXLVqZLsf5UUU15BqjFSzOBowcV7xofycQ9Gcv3N00Nphmevz5',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      paymentIntent = json.decode(response.body);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$e'),
        ),
      );
    }

    await stripe.Stripe.instance
        .initPaymentSheet(
            paymentSheetParameters: stripe.SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent!['client_secret'],
          style: ThemeMode.light,
          merchantDisplayName: 'Abijit',
        ))
        .then((value) {});

    try {
      await stripe.Stripe.instance.presentPaymentSheet().then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Payment Successful'),
          ),
        );
      });
    } catch (e) {}

    Navigator.pop(context);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(widget.item.title),
        titleSpacing: 2,
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
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 50),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      CarouselSlider(
                        items: widget.item.itemImage
                            .map(
                              (image) => Builder(
                                builder: (context) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                          image: AssetImage(image),
                                          fit: BoxFit.contain),
                                    ),
                                  );
                                },
                              ),
                            )
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
                            count: widget.item.itemImage.length,
                            effect: const WormEffect(
                                dotHeight: 10,
                                dotWidth: 10,
                                dotColor: Colors.black26,
                                activeDotColor: Colors.white)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  itemDetails(),
                  const SizedBox(height: 10),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Description :',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.item.details,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.white,
                  width: 0,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        backgroundColor: Colors.deepOrange.shade300),
                    onPressed: () async {
                      await payment();
                    },
                    child: const Text(
                      'Buy now',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Consumer<CartProvider>(
                    builder: (context, value, child) => ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          backgroundColor: Colors.deepOrange.shade700),
                      onPressed: () {
                        value.add(widget.item);
                      },
                      child: const Text(
                        'Add to Cart',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  /**/
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container itemDetails() {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 0, color: Colors.white),
          color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.item.title,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                '৳ ',
                style: TextStyle(fontSize: 15, color: Colors.grey[800]),
              ),
              Text(
                '${widget.item.price}',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                '${(widget.item.price + widget.item.price * .2).ceil()} ',
                style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    fontSize: 14,
                    color: Colors.grey[700]),
              ),
              const SizedBox(
                width: 1,
              ),
              Text(
                '-20%',
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Icon(
                Icons.star_border_rounded,
                color: Colors.deepOrange.shade300,
                size: 20,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                '4.6/5.0 (${widget.item.sellCount - 20} Reviews)',
                style:
                    TextStyle(color: Colors.deepOrange.shade300, fontSize: 16),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Icon(
                Icons.warehouse_outlined,
                color: Colors.grey.shade600,
                size: 20,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                widget.item.shopName,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
