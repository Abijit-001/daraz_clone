import 'package:daraz_clone/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 70),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (index) {
                  setState(() => isLastPage = index == 4);
                },
                children: [
                  Container(
                    child: Image.asset('demo_images/onboarding_1.jpg',fit: BoxFit.fill),
                  ),
                  Container(
                    child: Image.asset('demo_images/onboarding_2.jpg',fit: BoxFit.fill),
                  ),
                  Container(
                    child: Image.asset('demo_images/onboarding_3.jpg',fit: BoxFit.fill),
                  ),
                  Container(
                    child: Image.asset('demo_images/onboarding_4.jpg',fit: BoxFit.fill),
                  ),
                  Container(
                    child: Image.asset('demo_images/onboarding_5.jpg',fit: BoxFit.fill),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
          height: 80,
          color: const Color.fromRGBO(47, 53, 75, 1),
          child: Center(
              child: Column(
            children: [
              SmoothPageIndicator(
                  controller: controller,
                  count: 5,
                  effect: const SwapEffect(
                      dotWidth: 12,
                      dotHeight: 12,
                      dotColor: Colors.black26,
                      activeDotColor: Colors.white)),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                child: const Text('SKIP TO THE APP >',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600)),
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool('showHome', true);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const SignInScreen(),
                  ));
                },
              ),
            ],
          ))),
    ));
  }
}
