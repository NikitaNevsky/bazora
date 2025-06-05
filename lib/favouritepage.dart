import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'Productdetails.dart';
import 'package:iconly/iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'filters.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  final List<Map<String, dynamic>> _products = [
    {
      'name': 'Macbook Air M1 (A2337)',
      'price': '99.99',
      'brand': 'Apple',
      'image': 'assets/imagess/top.jpg',
      'isFavorite': true,
    },
    {
      'name': 'iPhone 14 Pro',
      'price': '199.99',
      'brand': 'Apple',
      'image': 'assets/imagess/top.jpg',
      'isFavorite': true,
    },
    {
      'name': 'Samsung Galaxy S23',
      'price': '99.99',
      'brand': 'Samsung',
      'image': 'assets/imagess/top.jpg',
      'isFavorite': true,
    },
    {
      'name': 'Sony WH-1000XM5',
      'price': '99.99',
      'brand': 'Sony',
      'image': 'assets/imagess/top.jpg',
      'isFavorite': true,
    },
    {
      'name': 'GoPro Hero 11',
      'price': '99.99',
      'brand': 'GoPro',
      'image': 'assets/imagess/top.jpg',
      'isFavorite': true,
    },
    {
      'name': 'Xiaomi Mi Band 7',
      'price': '9.99',
      'brand': 'Xiaomi',
      'image': 'assets/imagess/top.jpg',
      'isFavorite': true,
    },
  ];

  void _toggleFavorite(int index) {
    setState(() {
      _products[index]['isFavorite'] = !_products[index]['isFavorite'];
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: SafeArea(
        child: Column(
          children: [
            // Header Section (match catalogpage.dart)
            Container(
              height: 197,
              constraints: const BoxConstraints(
                minWidth: 360,
                maxWidth: 500,
              ),
              decoration: const BoxDecoration(
                color: Color(0xFF1D293A),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(23),
                  bottomRight: Radius.circular(23),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 55),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 3),
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                              size: 22,
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'Товары для рисования',
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: isTablet ? 24 : 20,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const Spacer(flex: 2),
                      ],
                    ),
                  ),
                  // Search bar and filter container (from catalogpage.dart)
                  Padding(
                    padding: const EdgeInsets.only(top: 32, left: 14, right: 14),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 44,
                            decoration: BoxDecoration(
                              color: const Color(0xFFEFF2F6),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.search, color: Color(0xFFA4ACB6)),
                                hintText: 'Хочу купить…',
                                hintStyle: TextStyle(color: Color(0xFFA4ACB6)),
                                contentPadding: EdgeInsets.symmetric(vertical: 11),
                              ),
                              onChanged: (value) {
                                // Optional: implement search functionality
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Container(
                          width: 46,
                          height: 44,
                          decoration: BoxDecoration(
                            color: const Color(0xFFEFF2F6),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            icon: const Icon(IconlyLight.filter, color: Color(0xFFA4ACB6)),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => FilterPage()),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Products Section (EXACTLY like catalogpage.dart)
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 1),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: _buildProductCard(
                              _products[0]['name'],
                              _products[0]['price'],
                              _products[0]['brand'],
                              _products[0]['image'],
                              0,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: _buildProductCard(
                              _products[1]['name'],
                              _products[1]['price'],
                              _products[1]['brand'],
                              _products[1]['image'],
                              1,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: _buildProductCard(
                              _products[0]['name'],
                              _products[0]['price'],
                              _products[0]['brand'],
                              _products[0]['image'],
                              0,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: _buildProductCard(
                              _products[1]['name'],
                              _products[1]['price'],
                              _products[1]['brand'],
                              _products[1]['image'],
                              1,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: _buildProductCard(
                              _products[0]['name'],
                              _products[0]['price'],
                              _products[0]['brand'],
                              _products[0]['image'],
                              0,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: _buildProductCard(
                              _products[1]['name'],
                              _products[1]['price'],
                              _products[1]['brand'],
                              _products[1]['image'],
                              1,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: _buildProductCard(
                              _products[0]['name'],
                              _products[0]['price'],
                              _products[0]['brand'],
                              _products[0]['image'],
                              0,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: _buildProductCard(
                              _products[1]['name'],
                              _products[1]['price'],
                              _products[1]['brand'],
                              _products[1]['image'],
                              1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(String name, String price, String brand, String imageUrl, int index) {
    bool isFavorite = _products[index]['isFavorite'];
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => ProductDetails()),
        );
      },
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          minHeight: (isMobile ? 205 : 235),
        ),
        margin: EdgeInsets.symmetric(
          vertical: 2, 
          horizontal: isMobile ? 2.5 : 0, 
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: isMobile ? 170 : 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4, left: 4, right: 4), 
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      child: Image.asset(
                        imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 5,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        _products[index]['isFavorite'] = !_products[index]['isFavorite'];
                      });
                    },
                    icon: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: isFavorite
                          ? Icon(IconlyBold.heart, color: Colors.red, size: 18)
                          : Icon(IconlyLight.heart, color: Colors.grey, size: 18),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(isMobile ? 6.0 : 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: isMobile ? 13 : 15,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(IconlyLight.star, color: Colors.amber, size: isMobile ? 13 : 16),
                          SizedBox(width: isMobile ? 2 : 4),
                          Text('4.5', style: TextStyle(fontSize: isMobile ? 10 : 12)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: isMobile ? 2 : 4),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(isMobile ? 2 : 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFB1F0F7),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(IconlyLight.bag_2, size: isMobile ? 13 : 16, color: Color(0xFF1D293A)),
                      ),
                      SizedBox(width: isMobile ? 4 : 8),
                      Expanded(
                        child: Text(
                          brand,
                          style: TextStyle(fontSize: isMobile ? 10 : 12),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: isMobile ? 2 : 4),
                  Text(
                    name,
                    style: TextStyle(fontSize: isMobile ? 10 : 12),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: isMobile ? 6.0 : 8.0,
                right: isMobile ? 6.0 : 8.0,
                bottom: 2,
                top: isMobile ? 2.0 : 4.0,
              ),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1D293A),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: isMobile ? 10 : 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ProductDetails()),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(IconlyLight.buy, color: Colors.white, size: isMobile ? 16 : 20),
                      SizedBox(width: isMobile ? 4 : 8),
                      Flexible(
                        child: Text(
                          'В корзину',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700,
                            fontSize: isMobile ? 12 : 14,
                            color: Colors.white,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
