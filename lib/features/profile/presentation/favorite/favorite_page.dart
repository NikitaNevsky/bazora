import 'package:bazora/constants/image_constants.dart';
import 'package:bazora/core/utils/app_colors.dart';
import 'package:bazora/core/utils/utils.dart';
import 'package:bazora/core/widgets/buttons/custom_button.dart';
import 'package:bazora/core/widgets/inputs/custom_text_field.dart';
import 'package:bazora/features/api/supabase/database/tables/favorite_products_view_catalog.dart';
import 'package:bazora/features/catalog/presentation/product_detail/widgets/cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_svg/flutter_svg.dart';


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
    final isLargeScreen = MediaQuery.of(context).size.width > 600;
    final searchBarHeight = isLargeScreen ? 54.0 : 44.0;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
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
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF1D293A),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(23),
                bottomRight: Radius.circular(23),
              ),
            ),
            padding: EdgeInsetsDirectional.fromSTEB(0, isLargeScreen ? 30 : 0, 0, isLargeScreen ? 24 : 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 24, right: 24, bottom: 24),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 44,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: CustomTextField(
                            autofillHints: const <String>[AutofillHints.newUsername],
                            textInputAction: TextInputAction.next,
                            textInputType: TextInputType.emailAddress,
                            hintText: "Поиск",
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                              const BorderSide(color: Colors.transparent),
                            ),
                            cursorColor: AppColors.black,
                            cursorHeight: 17,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(12),
                              child: SvgPicture.asset(SvgIcons.icSearch),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                              const BorderSide(color: Colors.transparent),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Container(
                        height: searchBarHeight,
                        width: searchBarHeight,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEFF2F6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          icon: const Icon(IconlyLight.filter, color: Color(0xFFA4ACB6), size: 20,),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: (widget.favoriteData.isNotEmpty) ? GridView.builder(
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
            ) : SizedBox(),
          ),
        ],
      ),
    );
  }
}
