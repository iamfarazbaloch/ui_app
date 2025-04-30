import 'package:flutter/material.dart';
import 'package:ui_app/pages/home_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SizedBox(
            height: size.height,
            width: size.width,
            child: Image.asset(
              'assets/images/bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 230,
            child: Text(
              'Fall in love with\nCoffee is blissful\nDelight',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 150,
            child: Text(
              'Welcome to our cozy coffee corner, where\nevery cup is a delightful for you',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.shade100,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 40,
            child: _button(context),
          ),
        ],
      ),
    );
  }

  Widget _button(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => HomePage()),
        );
      },
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.brown.shade500,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Center(
          child: Text(
            'Get started',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
