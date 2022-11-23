import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class AboutUs extends StatelessWidget {
  static const routeName = 'about-us';
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 1,
                width: MediaQuery.of(context).size.width,
                child: const RiveAnimation.asset(
                  'assets/images/flying_car.riv',
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 1,
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        "About us",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        "\nHmara naam hee kaafi hai xD",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const Expanded(child: SizedBox()),
                      const Text("product of RIPESEED.IO"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
