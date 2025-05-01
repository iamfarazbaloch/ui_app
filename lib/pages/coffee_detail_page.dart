import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ui_app/model/coffee_model.dart';

class CoffeeDetailPage extends StatefulWidget {
  final Coffee coffee;
  const CoffeeDetailPage({super.key, required this.coffee});

  @override
  State<CoffeeDetailPage> createState() =>
      _CoffeeDetailPageState();
}

class _CoffeeDetailPageState
    extends State<CoffeeDetailPage> {
  int quantity = 1;

  void increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final coffee = widget.coffee;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          'Details',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
            letterSpacing: 1,
          ),
        ),
        actions: const [
          Icon(
            Icons.favorite_outline_rounded,
            size: 30,
            color: Colors.black,
          ),
          Gap(20),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                coffee.image,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            const Gap(20),
            Text(
              coffee.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              coffee.type,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 16,
              ),
            ),
            const Gap(12),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.orange.shade400,
                  size: 20,
                ),
                const Gap(4),
                Text(
                  '${coffee.rate} (${coffee.review} reviews)',
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
            const Gap(20),
            Text(
              coffee.description,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey.shade800,
              ),
            ),
            const Gap(24),

            // Quantity Selector
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Quantity:",
                  style: TextStyle(fontSize: 18),
                ),
                const Gap(12),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.brown.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.brown.shade200,
                    ),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: decreaseQuantity,
                        icon: const Icon(Icons.remove),
                        color: Colors.brown,
                        splashRadius: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                        ),
                        child: Text(
                          '$quantity',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: increaseQuantity,
                        icon: const Icon(Icons.add),
                        color: Colors.brown,
                        splashRadius: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const Spacer(),

            // Price + Add to Cart
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${(coffee.price * quantity).toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 60,
                      vertical: 20,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                    ),
                  ),
                  child: const Text(
                    'Add to Cart',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
