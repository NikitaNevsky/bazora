import 'package:bazora/core/utils/app_colors.dart';
import 'package:bazora/core/utils/utils.dart';
import 'package:bazora/core/widgets/buttons/custom_button.dart';
import 'package:bazora/features/api/supabase/database/tables/favorite_products_view_catalog.dart';
import 'package:bazora/features/catalog/presentation/product_detail/widgets/cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';


class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key, required this.favoriteData});
  final List<FavoriteProductsViewCatalogRow> favoriteData;
  @override
  State<FavoritePage> createState() => _PageState();
}

class _PageState extends State<FavoritePage> {


  @override
  Widget build(BuildContext context) {

    final double screenWidth = MediaQuery.of(context).size.width;
    const int crossAxisCount = 2;
    const double spacing = 5;
    final double itemWidth = (screenWidth - ((crossAxisCount - 1) * spacing)) / crossAxisCount;
    const double itemHeight = 370; // bu siz belgilagan itemning umumiy height
    final double aspectRatio = itemWidth / itemHeight;

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
          padding: const EdgeInsets.only(top: 30),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: spacing,
            mainAxisSpacing: spacing,
            childAspectRatio: aspectRatio,
          ),
          itemCount: widget.favoriteData.length,
          itemBuilder: (context, index) {
            return CartItemWidget(
              name: widget.favoriteData[index].data['product_translations'][1]['name'],
              price: "${widget.favoriteData[index].data['price_retail'] ?? 0} ₽",
              favoriteData: widget.favoriteData[index],
            );
          },
        ),
      ),
    );
  }
}
