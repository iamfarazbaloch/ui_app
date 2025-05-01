import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ui_app/pages/coffee_detail_page.dart';
import 'package:ui_app/widgets/search_field.dart';
import '../model/coffee_model.dart' show listOfCoffee;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const _categories = [
    'All Coffee',
    'Machiato',
    'Latte',
    'Americano',
    'Cappuccino',
  ];
  static const _padding = EdgeInsets.symmetric(
    horizontal: 16,
  );
  static const _cardPadding = EdgeInsets.all(10);
  static const _borderRadius = BorderRadius.all(
    Radius.circular(16),
  );
  static const _textBold = TextStyle(
    fontWeight: FontWeight.bold,
  );

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildBanner(),
            _buildCategories(),
            _buildCoffeeGrid(),
            const Gap(30),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 300,
      color: Colors.black,
      padding: _padding.copyWith(top: 20, bottom: 20),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            const Gap(30),
          ],
        ),
      ),
    );
  }

  Widget _buildBanner() {
    return Transform.translate(
      offset: const Offset(0, -50),
      child: Padding(
        padding: _padding,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(40),
          ),
          child: Image.asset(
            'assets/images/banner.png',
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildCategories() {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: _padding,
        itemCount: _categories.length,
        itemBuilder:
            (context, index) => _buildCategoryChip(index),
      ),
    );
  }

  Widget _buildCategoryChip(int index) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? Colors.brown.shade400
                  : Colors.grey.shade200,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Text(
          _categories[index],
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.brown,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
      ),
    );
  }

  Widget _buildCoffeeGrid() {
    return Padding(
      padding: _padding,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: listOfCoffee.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.7,
            ),
        itemBuilder:
            (context, index) =>
                _buildCoffeeCard(listOfCoffee[index]),
      ),
    );
  }

  Widget _buildCoffeeCard(coffee) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: _borderRadius,
      ),
      padding: _cardPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCoffeeImage(coffee),
          const Gap(8),
          Text(
            coffee.name,
            style: _textBold.copyWith(fontSize: 18),
          ),
          Text(
            coffee.type,
            style: TextStyle(color: Colors.grey.shade600),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${coffee.price.toStringAsFixed(2)}',
                style: _textBold.copyWith(fontSize: 18),
              ),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.brown.shade300,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCoffeeImage(coffee) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (_) =>
                          CoffeeDetailPage(coffee: coffee),
                ),
              );
            },
            child: Image.asset(
              coffee.image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 150,
            ),
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: Colors.brown.shade300,
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: Text(
              '${coffee.rate} ⭐',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
