import 'package:bazora/constants/image_constants.dart';
import 'package:bazora/core/utils/app_colors.dart';
import 'package:bazora/core/widgets/bottom_sheet/custom_bottom_sheet.dart';
import 'package:bazora/core/widgets/inputs/custom_text_field.dart';
import 'package:bazora/features/catalog/presentation/widgets/filter_bottom_sheet.dart';
import 'package:bazora/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'dart:math' as math;
import 'package:iconly/iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../orders/presentation/orders_list_right.dart';
import '../../cart/presentation/wholesale_page_right.dart';
import 'product_detail/Productdetails.dart';
import '../../../listofchats.dart';


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

class _CatalogPageState extends State<CatalogPage> {
  final List<Map<String, dynamic>> _products = List.generate(6, (index) => {
    'name': _productNames[index],
    'price': '\$${_productPrices[index]}.99',
    'brand': _productBrands[index],
    'image': 'assets/imagess/top.jpg',
    'isFavorite': false,
  });

  static const _productNames = [
    'Macbook Air M1 (A2337)',
    'iPhone 14 Pro',
    'Samsung Galaxy S23',
    'Sony WH-1000XM5',
    'GoPro Hero 11',
    'Xiaomi Mi Band 7',
  ];

  static const _productPrices = [999, 1199, 899, 399, 499, 49];
  static const _productBrands = ['Apple', 'Apple', 'Samsung', 'Sony', 'GoPro', 'Xiaomi'];

  static const _citiesList = [
    'Москва', 'Санкт-Петербург', 'Новосибирск', 'Екатеринбург', 'Казань',
    'Нижний Новгород', 'Челябинск', 'Самара', 'Омск', 'Ростов-на-Дону',
    'Уфа', 'Красноярск', 'Воронеж', 'Пермь', 'Волгоград',
    'Сан-Паулу', 'Лима', 'Богота', 'Рио-де-Жанейро', 'Сантьяго',
    'Каракас', 'Буэнос-Айрес', 'Салвадор', 'Бразилиа', 'Форталеза',
    'Белу-Оризонти', 'Медельин', 'Гуаякиль', 'Санто-Доминго',
  ];

  String _selectedCity = 'Москва';
  int _selectedIndex = 0;

  void _toggleFavorite(int index) {
    setState(() => _products[index]['isFavorite'] = !_products[index]['isFavorite']);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      final routes = [
        null, // Catalog (stay on same page)
        const OrdersListRight(),
        const WholesalePageRight(),
        const ListOfChatsPage(),
      ];
      if (index > 0 && routes[index] != null) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => routes[index]!));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      backgroundColor: _backgroundColor,
      body: Column(
        children: [
          _buildHeader(isMobile),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
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
                      padding: EdgeInsets.only(left: 3),
                      child: Icon(IconlyLight.location, color: _white, size: 22),
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      width: 90,
                      child: StatefulBuilder(
                        builder: (context, setState) {
                          return DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              dropdownColor: _primaryColor,
                              value: _selectedCity,
                              icon: const Icon(IconlyLight.arrow_down_2, color: _white, size: 20),
                              style: GoogleFonts.inter(color: _white, fontSize: 16, fontWeight: FontWeight.w300),
                              isExpanded: true,
                              items: _citiesList.map<DropdownMenuItem<String>>((String city) {
                                return DropdownMenuItem<String>(
                                  value: city,
                                  child: Text(city, overflow: TextOverflow.ellipsis),
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
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
        boxShadow: [_buildShadow(0.03, 6, const Offset(0, 2))],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 9),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 3),
          itemCount: 4,
          itemBuilder: (_, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: _PromoCard(isMobile: isMobile),
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
              itemCount: 6,
              itemBuilder: (_, index) => Padding(
                padding: const EdgeInsets.only(right: 6),
                child: _CategoryCard(index: index),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductsGrid(bool isMobile) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
      child: Column(
        children: List.generate(3, (row) => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _ProductCard(product: _products[0], index: 0, isMobile: isMobile),
                _ProductCard(product: _products[1], index: 1, isMobile: isMobile),
              ],
            ),
            if (row < 2) const SizedBox(height: 5),
          ],
        )),
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
  
  const _PromoCard({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isMobile ? MediaQuery.of(context).size.width * 0.85 : MediaQuery.of(context).size.width * 0.7,
      height: isMobile ? 150 : 200,
      margin: EdgeInsets.symmetric(horizontal: isMobile ? 4 : 16, vertical: isMobile ? 4 : 8),
      decoration: BoxDecoration(
        color: _white,
        borderRadius: BorderRadius.circular(23),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(23),
              child: Transform(
                alignment: Alignment.centerLeft,
                transform: Matrix4.diagonal3Values(1.4, 1.0, 1.0),
                child: Image.asset('assets/imagess/banner1.jpeg', fit: BoxFit.fill, alignment: Alignment.centerLeft),
              ),
            ),
          ),
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(23),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0x331D1DB5), Color(0x0C1D1DB5)],
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Акция месяца', style: TextStyle(color: _primaryColor, fontWeight: FontWeight.w400, fontSize: 12)),
                SizedBox(height: 8),
                Text('Товары для рисования', style: TextStyle(color: _primaryColor, fontWeight: FontWeight.bold, fontSize: 20)),
                Spacer(),
              ],
            ),
          ),
          const Positioned(bottom: -4, left: -5.6, child: _DiscountCircle(text: '-15%', size: 80, bgColor: _primaryColor)),
          const Positioned(bottom: 23, left: 90, child: _DiscountCircle(text: '-10%', size: 52, bgColor: _white)),
        ],
      ),
    );
  }
}

class _DiscountCircle extends StatelessWidget {
  final String text;
  final double size;
  final Color bgColor;
  
  const _DiscountCircle({required this.text, required this.size, required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      margin: const EdgeInsets.only(right: 7),
      decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
      child: Center(
        child: Transform.rotate(
          angle: text == '-15%' ? 350 * (math.pi / 180) : 15 * (math.pi / 180),
          child: Text(
            text,
            style: TextStyle(
              color: bgColor == _white ? _primaryColor : _white,
              fontSize: text == '-15%' ? 24 : 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
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
  final int index;
  
  const _CategoryCard({required this.index});

  static const _categories = [
    {'name': 'Гаджеты', 'image': 'assets/imagess/category1.jpeg.png'},
    {'name': 'Экшн-камеры', 'image': 'assets/imagess/category2.jpeg.png'},
    {'name': 'Гейминг', 'image': 'assets/imagess/category3.jpeg.png'},
    {'name': 'Гаджеты', 'image': 'assets/imagess/category1.jpeg.png'},
    {'name': 'Экшн-камеры', 'image': 'assets/imagess/category2.jpeg.png'},
    {'name': 'Гейминг', 'image': 'assets/imagess/category3.jpeg.png'}
  ];

  @override
  Widget build(BuildContext context) {
    final item = _categories[index % 6];
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
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(item['image']!, width: 65, height: 65),
            ),
            Text(
              item['name']!,
              style: const TextStyle(color: _primaryColor, fontSize: 12, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final int index;
  final bool isMobile;
  
  const _ProductCard({required this.product, required this.index, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
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
                  Container(
                    height: isMobile ? 230 : 200,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: _white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4, left: 4, right: 4),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                        child: Image.asset(
                          'assets/imagess/Paint.png',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 3,
                    right: 1,
                    child: IconButton(
                      onPressed: () => (context.findAncestorStateOfType<_CatalogPageState>()?._toggleFavorite(index)),
                      icon: Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(color: _white, shape: BoxShape.circle),
                        child: Icon(
                          product['isFavorite'] ? IconlyBold.heart : IconlyLight.heart,
                          color: product['isFavorite'] ? Colors.red : Colors.grey,
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
                        Text(product['price'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: isMobile ? 13 : 15)),
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
                          child: Text(product['brand'], style: TextStyle(fontSize: isMobile ? 10 : 12), maxLines: 1),
                        ),
                      ],
                    ),
                    SizedBox(height: isMobile ? 2 : 4),
                    Text(product['name'], style: TextStyle(fontSize: isMobile ? 14 : 12, fontWeight: FontWeight.w400), maxLines: 2),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: isMobile ? 6.0 : 8.0, vertical: isMobile ? 2.0 : 4.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(_primaryColor),
                      foregroundColor: MaterialStateProperty.all(_white),
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: isMobile ? 10 : 12)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
                    ),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ProductDetails())),
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
      ),
    );
  }
}