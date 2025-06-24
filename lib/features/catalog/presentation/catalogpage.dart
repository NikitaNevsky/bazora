import 'package:bazora/constants/image_constants.dart';
import 'package:bazora/core/extension/extension.dart';
import 'package:bazora/core/utils/app_colors.dart';
import 'package:bazora/core/utils/utils.dart';
import 'package:bazora/core/widgets/bottom_sheet/custom_bottom_sheet.dart';
import 'package:bazora/core/widgets/custom_cached_network_image.dart';
import 'package:bazora/core/widgets/inputs/custom_text_field.dart';
import 'package:bazora/features/api/supabase/database/database.dart';
import 'package:bazora/features/api/supabase/database/tables/product_price_stock_view.dart';
import 'package:bazora/features/catalog/model/banners_response.dart';
import 'package:bazora/features/catalog/model/category_response.dart';
import 'package:bazora/features/catalog/model/city_response.dart';
import 'package:bazora/features/catalog/model/product_with_images_response.dart';
import 'package:bazora/features/catalog/presentation/mixin/home_mixin.dart';
import 'package:bazora/features/catalog/presentation/widgets/filter_bottom_sheet.dart';
import 'package:bazora/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'dart:math' as math;
import 'package:iconly/iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


const _primaryColor = Color(0xFF1D293A);
const _secondaryColor = Color(0xFFEFF2F6);
const _textColor = Color(0xFFA4ACB6);
const _backgroundColor = Color(0xFFF7F7F7);
const _white = Colors.white;
const _shadowColor = Colors.black;

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> with HomeMixin {

  String _selectedCity = 'Москва';
  String _selectedCityId = 'Москва';

  void _toggleFavorite(int index) { }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 197),
                      _buildPromoBanner(isMobile),
                      _buildCategoriesSection(),
                      _buildProductsGrid(isMobile),
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).padding.bottom)
            ],
          ),
          _buildHeader(isMobile),
        ],
      ),
    );
  }

  Widget _buildHeader(bool isMobile) {
    return Container(
      height: 197,
      constraints: const BoxConstraints(minWidth: 360, maxWidth: 500),
      decoration: const BoxDecoration(
        color: _primaryColor,
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
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(IconlyLight.location, color: _white, size: 22),
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      width: 120,
                      child: StatefulBuilder(
                        builder: (context, setState) {
                          return DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              dropdownColor: _primaryColor,
                              value: _selectedCity,
                              icon: const Icon(IconlyLight.arrow_down_2, color: _white, size: 20),
                              style: GoogleFonts.inter(color: _white, fontSize: 16, fontWeight: FontWeight.w300),
                              isExpanded: true,
                              items: cityResponse.map<DropdownMenuItem<String>>((CityResponse city) {
                                return DropdownMenuItem<String>(
                                  value: city.nameRu,
                                  child: Text(city.nameRu ?? "", overflow: TextOverflow.ellipsis),
                                  onTap: () {
                                    print(city.id);
                                    localSource.setCityID(city.id ?? "");
                                    updateCityId();
                                  },
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                if (value != null) {
                                  setState(() {
                                    _selectedCity = value;
                                  });
                                }
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(IconlyLight.notification, color: _white),
                  onPressed: () => context.pushNamed(Routes.notificationPage),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 24, right: 24, bottom: 24),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: _secondaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: CustomTextField(
                      autofillHints: const <String>[AutofillHints.newUsername],
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.emailAddress,
                      hintText: "Хочу купить…",
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
                  width: 46,
                  height: 44,
                  decoration: BoxDecoration(
                    color: _secondaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    icon: const Icon(IconlyLight.filter, color: _textColor, size: 20),
                    onPressed: () async {
                      await customModalBottomSheet<void>(
                        context: context,
                        backgroundColor: Colors.transparent,
                        enableDrag: true,
                        isScrollControlled: true,
                        builder: (BuildContext ctx, _) => FilterBottomSheet()
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPromoBanner(bool isMobile) {
    return Container(
      height: 190,
      decoration: BoxDecoration(
        color: _white,
        borderRadius: const BorderRadius.all(Radius.circular(23)),
        boxShadow: [_buildShadow(0.03, 6, const Offset(0, 2))],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 9),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 3),
          itemCount: banners.length,
          itemBuilder: (_, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: _PromoCard(isMobile: isMobile, bannersResponse: banners[index]),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoriesSection() {
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 2),
      padding: const EdgeInsets.fromLTRB(10, 12, 10, 12),
      decoration: BoxDecoration(
        color: _white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [_buildShadow(0.04, 8, const Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(4, 0, 4, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Категории', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
                _ViewAllButton(),
              ],
            ),
          ),
          SizedBox(
            height: 108,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 4, right: 4),
              itemCount: categories.length,
              itemBuilder: (_, index) => Padding(
                padding: const EdgeInsets.only(right: 6),
                child: _CategoryCard(categoryResponse: categories[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductsGrid(bool isMobile) {
    final double screenWidth = MediaQuery.of(context).size.width;
    const int crossAxisCount = 2;
    const double spacing = 5;
    final double itemWidth = (screenWidth - ((crossAxisCount - 1) * spacing)) / crossAxisCount;
    const double itemHeight = 343; // bu siz belgilagan itemning umumiy height
    final double aspectRatio = itemWidth / itemHeight;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child:  FutureBuilder<List<ProductPriceStockViewRow>>(
          future: futureProducts,
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return const Padding(
                padding: EdgeInsets.only(top: 100),
                child: SizedBox(
                  width: 30.0,
                  height: 30.0,
                  child: CircularProgressIndicator(color: AppColors.baseColor, backgroundColor: AppColors.opacity),
                ),
              );
            }

            List<ProductPriceStockViewRow> gridViewProductPriceStockViewRowList = snapshot.data!;
            print("DATA: ${gridViewProductPriceStockViewRowList.length}");

            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(top: 5),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: spacing,
                mainAxisSpacing: spacing,
                childAspectRatio: aspectRatio,
              ),
              itemCount: gridViewProductPriceStockViewRowList.length,
              itemBuilder: (context, index) {
                return _ProductCard(product: gridViewProductPriceStockViewRowList[index], index: index, isMobile: isMobile);
              },
            );
          }
      ),
    );
  }


  BoxShadow _buildShadow(double opacity, double blur, Offset offset) {
    return BoxShadow(color: _shadowColor.withOpacity(opacity), blurRadius: blur, offset: offset);
  }
}

// Extracted Widgets
class _PromoCard extends StatelessWidget {
  final bool isMobile;
  final BannersResponse bannersResponse;
  
  const _PromoCard({required this.isMobile, required this.bannersResponse});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isMobile ? MediaQuery.of(context).size.width * 0.85 : MediaQuery.of(context).size.width * 0.7,
      height: isMobile ? 150 : 200,
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.symmetric(horizontal: isMobile ? 4 : 16, vertical: isMobile ? 6 : 8),
      decoration: BoxDecoration(
        color: _white,
        borderRadius: BorderRadius.circular(23),
      ),
      child: CustomCachedNetworkImage(imageUrl: bannersResponse.image ?? "", fit: BoxFit.cover),
    );
  }
}

class _ViewAllButton extends StatelessWidget {
  const _ViewAllButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 18,
      padding: const EdgeInsets.only(right: 4, left: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFD6E6FC),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 5, bottom: 2),
            child: Text('Все', style: TextStyle(color: _primaryColor, fontWeight: FontWeight.w500, fontSize: 10)),
          ),
          SizedBox(width: 4),
          Icon(IconlyLight.arrow_right_2, size: 12, color: _primaryColor),
        ],
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final CategoryResponse categoryResponse;
  
  const _CategoryCard({required this.categoryResponse});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 108,
      height: 108,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF1F1F1),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            categoryResponse.image != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CustomCachedNetworkImage(
                      width: 60,
                      height: 60,
                      imageUrl: categoryResponse.image ?? "", fit: BoxFit.cover,
                    ),
                  )
                : const SizedBox(
                    width: 60,
                    height: 60,
                    child: Icon(Icons.image_not_supported_outlined, size: 40, color: AppColors.grey,),
                  ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                categoryResponse.name ?? "",
                style: const TextStyle(color: _primaryColor, fontSize: 12, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final ProductPriceStockViewRow product;
  final int index;
  final bool isMobile;
  
  const _ProductCard({required this.product, required this.index, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final _pageController = PageController();
    return GestureDetector(
      onTap: () => context.pushNamed(Routes.productDetails),
      child: Container(
        constraints: BoxConstraints(minHeight: isMobile ? 205 : 235),
        margin: EdgeInsets.symmetric(vertical: 2, horizontal: isMobile ? 2.5 : 0),
        decoration: BoxDecoration(
          color: _white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                      child: (product.productImages?.isNotEmpty ?? false)
                          ? PageView.builder(
                              controller: _pageController,
                              itemCount: product.productImages?.length,
                              itemBuilder: (_, i) => CustomCachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: product.productImages?[i]['image_url'] ?? "",
                              ),
                            )
                          : const Icon(Icons.image_not_supported_outlined, size: 40, color: AppColors.grey,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: SmoothPageIndicator(
                        controller: _pageController,
                        count: product.productImages?.length ?? 0,
                        effect: WormEffect(
                          dotHeight: 5,
                          spacing: 3,
                          dotWidth: 5,
                          activeDotColor: (product.productImages?.isNotEmpty ?? false) ? const Color(0xFF1D293A) : AppColors.opacity,
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
                    onPressed: () => { },
                    icon: Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(color: _white, shape: BoxShape.circle),
                      child: Icon(
                        IconlyLight.heart,
                        color: product.productName == "" ? Colors.red : Colors.grey,
                        size: 18,
                      ),
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
                      Flexible(
                        child: Text(
                          "${product.retailPrice ?? 0} ₽",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: isMobile ? 14 : 15),
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(IconlyLight.star, color: Colors.amber, size: 13),
                          SizedBox(width: isMobile ? 2 : 4),
                          const Text('4.5', style: TextStyle(fontSize: 10)),
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
                        child: const Icon(IconlyLight.bag_2, size: 13, color: _primaryColor),
                      ),
                      SizedBox(width: isMobile ? 4 : 8),
                      Expanded(
                        child: Text(
                            (product.productCategories?.isNotEmpty ?? false) ? (product.productCategories?[0]['name'] ?? "") : "",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: isMobile ? 10 : 12)
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: isMobile ? 2 : 4),
                  Text(
                    product.productName ?? "",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: isMobile ? 14 : 12, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 6.0 : 8.0, vertical: isMobile ? 2.0 : 4.0),
              child: SizedBox(
                height: 30,
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(_primaryColor),
                    foregroundColor: MaterialStateProperty.all(_white),
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: isMobile ? 4 : 12)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(IconlyLight.buy, color: _white, size: 16),
                      SizedBox(width: isMobile ? 4 : 8),
                      const Flexible(child: Text('В корзину', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14))),
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
}