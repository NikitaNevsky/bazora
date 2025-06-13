import 'package:bazora/core/utils/app_colors.dart';
import 'package:bazora/core/utils/utils.dart';
import 'package:bazora/core/widgets/buttons/custom_button.dart';
import 'package:bazora/features/catalog/presentation/product_detail/widgets/cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        toolbarHeight: 100,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(23),
            bottomRight: Radius.circular(23),
          ),
        ),
        leading: const BackButton(color: AppColors.white),
        backgroundColor: const Color(0xFF1D293A),
        title: const Text(
          'Избранное',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: GridView.builder(
          padding: EdgeInsets.only(top: 30),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Har bir qatorga nechta element
            crossAxisSpacing: 5, // Gorizontal bo‘shliq
            mainAxisSpacing: 5, // Vertikal bo‘shliq
            childAspectRatio: 0.624,
          ),
          itemCount: 4,
          itemBuilder: (context, index) {
            return CartItemWidget(image: "assets/imagess/Brush (1).png", name: "Brush", price: "1 500 ₽");
          },
        ),
      ),
    );
  }
}
