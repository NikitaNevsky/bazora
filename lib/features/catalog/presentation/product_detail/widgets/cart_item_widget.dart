import 'dart:core';
import 'package:bazora/constants/image_constants.dart';
import 'package:bazora/core/utils/app_colors.dart';
import 'package:bazora/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key, required this.image, required this.name, required this.price});

  final String name;
  final String price;
  final String image;

  @override
  Widget build(BuildContext context) {
    bool isFavorite = true;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                decoration: const BoxDecoration(borderRadius: AppUtils.kBorderRadius8),
                child: ClipRRect(
                  borderRadius: AppUtils.kBorderRadius8,
                  child: Image.asset(image, fit: BoxFit.cover, width: double.infinity, height: 200),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(price, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                        const Row(children: [
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          SizedBox(width: 4),
                          Text('4.5', style: TextStyle(fontSize: 12)),
                        ]),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(color: const Color(0xFFB1F0F7), borderRadius: BorderRadius.circular(12)),
                          child: const Icon(IconlyLight.bag, size: 16, color: Color(0xFF1D293A)),
                        ),
                        const SizedBox(width: 8),
                        Text('Art Supplies', style: TextStyle(fontSize: 12, color: const Color(0xFFA4ACB6))),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400), maxLines: 2, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 30,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF232F3E),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(IconlyLight.buy, color: Colors.white, size: 18),
                            SizedBox(width: 8),
                            Text('В корзину', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 10, right: 10,
            child: GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4, offset: const Offset(0, 2))],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Icon(
                    isFavorite ? IconlyBold.heart : IconlyLight.heart,
                    size: 20,
                    color: isFavorite ? Colors.red : const Color(0xFF1D293A),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
