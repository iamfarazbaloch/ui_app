import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ui_app/widgets/search_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: 350,
            width: double.infinity,
            color: Colors.black,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Location',
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 17,
                      ),
                    ),
                    const Gap(5),
                    const Text(
                      'Dhaka, Bangladesh',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    const Gap(30),
                    const SearchField(),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top:
                230, // Adjust the top value to move the image outside
            left: 16,
            right: 16,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/banner.png',
                height:
                    200, // Increased height for visibility outside
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
