import 'dart:convert';

import 'package:daraz_clone/models/item_model.dart';
import 'package:daraz_clone/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_stripe/flutter_stripe.dart' as stripe;
import '../widgets/cart_item.dart';
import 'home_screen.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Map<String, dynamic>? paymentIntent;

  int totalPrice = 00;

  @override
  void initState() {
    super.initState();
  }

  int _calculateTotal(List<Item> list) {
    list.forEach((item) {
      setState(() {
        totalPrice += item.price;
      });
    });
    return totalPrice;
  }

  Future<void> payment(List<Item> list) async {
    _calculateTotal(list);
    try {
      Map<String, dynamic> body = {
        'amount': "${totalPrice}00",
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
    var screenSize = MediaQuery.of(context).size;
    return Consumer<CartProvider>(builder: (context, value, child) {
      // _calculateTotal(value.list);
      return Scaffold(
        appBar: AppBar(
          title: Text('My Cart'),
        ),
        body: Column(children: [
          Container(
            color: Colors.grey[200],
            // margin: EdgeInsets.only(bottom: 50),
            height: screenSize.height * .80,
            child: ListView.builder(

              itemCount: value.list.length ?? 3,
              itemBuilder: (context, index) {

                return Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.horizontal,
                  background: Container(
                    color: Colors.red,
                  ),
                  onDismissed: (direction) {
                    value.del(index);
                    _calculateTotal(value.list);
                  },
                  child: CartItem(
                    screenSize: screenSize,
                    item: value.list[index],
                  ),
                );
              },
            ),
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.white,
                    offset: Offset(0, -1),
                    blurRadius: 0,
                    spreadRadius: 3)
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text('Total: '),
              Consumer<CartProvider>(
                  builder: (context, value, child) => Text(
                        '৳${value.list.fold(0, (sum, item) => sum + item.price)}',
                        style:
                            TextStyle(fontSize: 17, color: Colors.deepOrange),
                      ),),
              const SizedBox(width: 10,),
              Consumer<CartProvider>(
                builder: (context, value, child) => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      backgroundColor: Colors.deepOrange.shade700),
                  onPressed: () async {
                    await payment(value.list);
                  },
                  child: Text(
                    'Check out(${value.list.length})',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
                  const SizedBox(width: 10,),
            ]),
          ),
        ]),
      );
    });
  }
}
