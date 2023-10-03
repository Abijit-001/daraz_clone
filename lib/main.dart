import 'package:daraz_clone/provider/cart_provider.dart';
import 'package:daraz_clone/screens/onboarding_screen.dart';
import 'package:daraz_clone/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/item_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;

  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  Stripe.publishableKey =
      "pk_test_51Njh5MBrgg9vq6KSHqVET8jncwNv4sg1D8NazRCfEzYS8NratKjt58twODtdXPybLOOz1lBxashUicm8rYApCw3p00OUCfqGWD";

  runApp(
    MyApp(
      showHome: showHome,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.showHome}) : super(key: key);

  final bool showHome;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: showHome ? const SignInScreen() : const OnBoardingScreen(),
      ),
    );
  }
}
