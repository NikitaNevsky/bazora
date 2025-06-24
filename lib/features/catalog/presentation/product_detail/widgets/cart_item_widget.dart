import 'dart:core';
import 'package:bazora/constants/image_constants.dart';
import 'package:bazora/core/utils/app_colors.dart';
import 'package:bazora/core/utils/utils.dart';
import 'package:bazora/core/widgets/custom_cached_network_image.dart';
import 'package:bazora/features/api/supabase/database/tables/favorite_products_view_catalog.dart';
import 'package:bazora/features/catalog/model/product_with_images_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key, required this.name, required this.price, this.favoriteData});

  final String name;
  final String price;
  final FavoriteProductsViewCatalogRow? favoriteData;

  @override
  Widget build(BuildContext context) {
    bool isFavorite = true;
    final _pageController = PageController();
    final List<ImagesResponse> images = [];
    final imagesJson = favoriteData?.data['images'] as List? ?? [];
    for (var a in imagesJson) {
      images.add(ImagesResponse(
        imageId: a['image_id'],
        imageUrl: a['image_url']
      ));
    }
    print("LENFG _ ${images.length}");
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    margin: const EdgeInsets.all(6),
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(
                        color: Color(0xFFEFF2F6),
                        borderRadius: AppUtils.kBorderRadius8
                    ),
                    child: (images.isNotEmpty)
                        ? PageView.builder(
                            controller: _pageController,
                            itemCount: images.length,
                            itemBuilder: (_, i) => CustomCachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: images[i].imageUrl ?? "",
                            ),
                          )
                        : const Icon(Icons.image_not_supported_outlined, size: 40, color: AppColors.grey,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: images.length,
                      effect: WormEffect(
                        dotHeight: 5,
                        spacing: 3,
                        dotWidth: 5,
                        activeDotColor: images.isNotEmpty ? const Color(0xFF1D293A) : AppColors.opacity,
                        dotColor: const Color(0xFFA4ACB6),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 3,
                right: 1,
                child: IconButton(
                  onPressed: () {},
                  icon: Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                    child: const Icon(
                      IconlyLight.heart,
                      color: Colors.grey,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        price,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
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
                Text(name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400), maxLines: 1, overflow: TextOverflow.ellipsis),
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
    );
  }
}
