import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:iconly/iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'features/catalog/presentation/catalogpage.dart';
import 'listofchats.dart';
import 'reviewscreen.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final _pageController = PageController();
  bool isFavorite = false, isSubscribed = false;
  int _counter = 1;

  @override
  Widget build(BuildContext context) {
    final isLargeScreen = MediaQuery.of(context).size.width > 600;
    final padding = isLargeScreen ? 32.0 : 16.0;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: const Color(0xFFF7F7F7), 
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  _buildAppBar(context, isLargeScreen),
                  const SizedBox(height: 16),
                  _buildImageSlider(isLargeScreen),
                  _buildPromoTags(isLargeScreen),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    child: _buildProductInfo(isLargeScreen),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: _buildMiniBigOptRow(isLargeScreen),
                  ),
                  _buildPriceOptions(isLargeScreen),
                  _buildSectionTitle('Похожие товары'),
                  _buildSimilarProductsGrid(),
                  _buildReviews(isLargeScreen),
                  const SizedBox(height: 16),
                  _buildComplaintWidget(),
                  const SizedBox(height: 39),
                  _buildBottomBar(context, isLargeScreen),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // App Bar
  Widget _buildAppBar(BuildContext context, bool isLargeScreen) {
    return Padding(
      padding: EdgeInsets.all(isLargeScreen ? 32 : 16),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back, size: isLargeScreen ? 32 : 24),
            onPressed: () => Navigator.pop(context),
          ),
          const Spacer(),
          Text('Арт.: USX1223u3', style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: isLargeScreen ? 18 : 12)),
          IconButton(icon: Icon(Icons.copy, color: Colors.grey[600], size: 20), onPressed: () {}),
          const Spacer(),
          IconButton(
            icon: Icon(isFavorite ? IconlyBold.heart : IconlyLight.heart, size: 24, color: isFavorite ? Colors.red : Colors.black),
            onPressed: () => setState(() => isFavorite = !isFavorite),
          ),
          IconButton(icon: const Icon(IconlyLight.upload, size: 24), onPressed: () {}),
        ],
      ),
    );
  }

  // Image Slider
  Widget _buildImageSlider(bool isLargeScreen) {
    final images = ['assets/imagess/random1.png', 'assets/imagess/random2.png', 'assets/imagess/top.jpg'];
    
    return Column(
      children: [
        Container(
          width: double.infinity,
          color: const Color(0xFFEFF2F6),
          height: isLargeScreen ? 400 : 273,
          child: PageView.builder(
            controller: _pageController,
            itemCount: images.length,
            itemBuilder: (_, i) => Image.asset(images[i], fit: BoxFit.cover, errorBuilder: (_, __, ___) => 
              Center(child: Icon(Icons.error_outline, size: isLargeScreen ? 60 : 40))),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: SmoothPageIndicator(
            controller: _pageController,
            count: images.length,
            effect: WormEffect(
              dotHeight: isLargeScreen ? 14 : 8,
              dotWidth: isLargeScreen ? 14 : 8,
              activeDotColor: const Color(0xFF1D293A),
              dotColor: const Color(0xFFA4ACB6),
            ),
          ),
        ),
      ],
    );
  }

  // Promo Tags
  Widget _buildPromoTags(bool isLargeScreen) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isLargeScreen ? 16 : 8),
      child: Container(
        height: 34,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(23)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTag('Кэшбэк', IconlyLight.discount, isLargeScreen),
            SizedBox(width: isLargeScreen ? 32 : 16),
            _buildTag('Баллы за отзывы', IconlyLight.star, isLargeScreen),
            SizedBox(width: isLargeScreen ? 32 : 16),
            _buildTag('Бесплатная', IconlyLight.paper_upload, isLargeScreen),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String text, IconData icon, bool isLargeScreen) {
    return Container(
      constraints: const BoxConstraints(minWidth: 72, maxWidth: 150),
      height: 20,
      decoration: BoxDecoration(
        color: const Color(0xFF1D293A),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: const Color(0xFFEFF2F6), size: isLargeScreen ? 22 : 16),
          const SizedBox(width: 4),
          Text(text, style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 10, color: const Color(0xFFEFF2F6))),
        ],
      ),
    );
  }

 // Product Info
Widget _buildProductInfo(bool isLargeScreen) {
  return Padding(
    padding: const EdgeInsets.only(top: 15),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(23),
      ),
      padding: EdgeInsets.all(isLargeScreen ? 32 : 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Macbook Air M1 (A2337)', 
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w700, 
              fontSize: 24, 
              color: const Color(0xFF1D293A)
            )
          ),
          const SizedBox(height: 7),
          Row(
            children: [
              _buildRatingContainer('4.5', '4 000 отзывов'),
              const SizedBox(width: 7),
              Container(
                width: 92, height: 43,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            'https://imagess.unsplash.com/photo-1546868871-7041f2a55e12?w=200&h=200&fit=crop',
                            width: 45,
                            height: 45,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 28,
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            'https://imagess.unsplash.com/photo-1523275335684-37898baf30?w=200&h=200&fit=crop',
                            width: 45,
                            height: 45,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 46,
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            'https://imagess.unsplash.com/photo-1511707171634-5f897ff02aa9?w=200&h=200&fit=crop',
                            width: 45,
                            height: 45,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          Text(
            'Ультратонкий и легкий ноутбук от Apple с процессором M1, обеспечивающим невероятную производительность и энергоэффективность. Оснащен 13,3-дюймовым Retina дисплеем с высоким разрешением, что обеспечивает четкое изображение и яркие цвета.',
            style: GoogleFonts.urbanist(
              fontWeight: FontWeight.w400, 
              fontSize: 12, 
              color: const Color(0xFF1D293A)
            ),
          ),
          const SizedBox(height: 7),
          _buildOptionRow('Цвет', [
            _buildColorOption(const Color(0xFFD5D5D5), true),
            const SizedBox(width: 7),
            _buildColorOption(const Color(0xFFF2E0EA)),
            const SizedBox(width: 7),
            _buildColorOption(const Color(0xFF0F2444)),
            const SizedBox(width: 7),
            _buildColorOption(const Color(0xFF141313)),
          ], isLargeScreen),
          const SizedBox(height: 7),
          _buildOptionRow('Оперативная память', [
            _buildMemoryOption('8 ГБ', true, isLargeScreen),
            const SizedBox(width: 7),
            _buildMemoryOption('16 ГБ', false, isLargeScreen),
          ], isLargeScreen),
          const SizedBox(height: 7),
          _buildOptionRow('Объем накопителя', [
            _buildMemoryOption('SSD 256', false, isLargeScreen),
            const SizedBox(width: 7),
            _buildMemoryOption('SSD 512', true, isLargeScreen),
          ], isLargeScreen),
        ],
      ),
    ),
  );
}

// Keep all the helper methods unchanged:
Widget _buildRatingContainer(String rating, String reviews) {
  return Container(
    width: 108, height: 43,
    decoration: BoxDecoration(
      color: const Color(0xFFF1F1F1), 
      borderRadius: BorderRadius.circular(15)
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            const Icon(IconlyBold.star, color: Colors.amber, size: 12),
            const SizedBox(width: 4),
            Text(rating, style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 12)),
          ]
        ),
        const SizedBox(height: 2),
        Text(
          reviews, 
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w400,
            fontSize: 12, 
            color: const Color(0xFFA4ACB6)
          ),
        ),
      ],
    ),
  );
}

Widget _buildOptionRow(String title, List<Widget> options, bool isLargeScreen) {
  return Row(
    children: [
      Text(
        '$title:', 
        style: TextStyle(
          fontWeight: FontWeight.w500, 
          fontSize: isLargeScreen ? 18 : 14)
        ),
      SizedBox(width: isLargeScreen ? 18 : 8),
      ...options,
    ],
  );
}

Widget _buildColorOption(Color color, [bool hasBorder = false]) {
  return Container(
    margin: const EdgeInsets.only(right: 8),
    width: 25, height: 25,
    decoration: BoxDecoration(
      color: color,
      shape: BoxShape.circle,
      border: hasBorder ? Border.all(color: Colors.black, width: 2.0) : null,
    ),
  );
}

Widget _buildMemoryOption(String text, bool selected, bool isLargeScreen) {
  return Container(
    margin: const EdgeInsets.only(right: 8),
    padding: EdgeInsets.symmetric(
      horizontal: isLargeScreen ? 18 : 10, 
      vertical: isLargeScreen ? 10 : 6
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(isLargeScreen ? 16 : 10),
      border: Border.all(
        color: selected ? const Color(0xFF1D293A) : Colors.grey.shade300, 
        width: 1.0
      ),
    ),
    child: Text(
      text, 
      style: TextStyle(
        fontSize: isLargeScreen ? 16 : 12, 
        color: selected ? const Color(0xFF1D293A) : Colors.black
      )
    ),
  );
}

  // Mini/Big Options
  Widget _buildMiniBigOptRow(bool isLargeScreen) {
    return Padding(
      padding: const EdgeInsets.only(left: 7, right: 7, top: 10, bottom: 8),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
                child: _buildOptContainer('MINI опт', 'от 5 шт', '110 000 ₽', true),
              ),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                child: _buildOptContainer('BIG опт', 'от 100 шт', '110 000 ₽', false),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptContainer(String title, String subtitle, String price, bool isDark) {
    return Container(
      height: 65, // Increased by 5px
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF232F3E) : Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4, offset: const Offset(0, 2))],
        border: isDark ? null : Border.all(color: const Color(0xFF232F3E), width: 1.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: TextStyle(color: isDark ? Colors.white : const Color(0xFF232F3E), fontWeight: FontWeight.w400, fontSize: 14)),
          Text(subtitle, style: TextStyle(color: const Color(0xFFB1C0D1), fontWeight: FontWeight.w400, fontSize: 10)),
          Text(price, style: GoogleFonts.inter(color: isDark ? Colors.white : const Color(0xFF232F3E), fontWeight: FontWeight.w700, fontSize: 16)),
        ],
      ),
    );
  }

  // Price Options
  Widget _buildPriceOptions(bool isLargeScreen) {
    return Container(
      width: double.infinity,
      height: 108,
      margin: EdgeInsets.symmetric(horizontal: isLargeScreen ? 0 : 8),
      padding: EdgeInsets.all(isLargeScreen ? 24 : 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildStoreInfo(),
              Column(
                children: [
                  _buildSubscribeButton(),
                  const SizedBox(height: 8),
                  _buildChatAndRating(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStoreInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Магазин', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w700)),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(radius: 22.5, backgroundImage: AssetImage('assets/imagess/random1.png')),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Apple Store', style: GoogleFonts.inter(
                  color: const Color(0xFF1D293A), 
                  fontWeight: FontWeight.w500, 
                  fontSize: 14
                )),
                const SizedBox(height: 2),
                Text('Перейти в магазин', style: GoogleFonts.inter(color: const Color(0xFFA4ACB6), fontWeight: FontWeight.w500, fontSize: 10)),
              ],
            ),
        
          ],
        ),
      ],
    );
  }

  Widget _buildSubscribeButton() {
    return Container(
      width: 88,
      height: 20,
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(IconlyLight.heart, size: 12, color: Color(0xFFA4ACB6)),
            const SizedBox(width: 4),
            Text('Подписаться', 
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 8,
                color: const Color(0xFFA4ACB6),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatAndRating() {
    return Row(
      children: [
        _buildIconButton(IconlyBold.star, '4.5'),
        const SizedBox(width: 4),
        _buildIconButton(IconlyLight.chat, 'Чат'),
      ],
    );
  }

  Widget _buildIconButton(IconData icon, String text) {
    return Container(
      width: 44, height: 44,
      decoration: BoxDecoration(
        color: const Color(0xFFF1F1F1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: icon == IconlyBold.star ? const Color(0xFFE9D32C) : const Color(0xFF1D293A), size: 12),
          Text(text, style: TextStyle(fontWeight: FontWeight.w600, fontSize: text == 'Чат' ? 12 : 14)),
        ],
      ),
    );
  }

  Widget _buildIconButtonWithNavigation(IconData icon, String text) {
    return Container(
      width: 44, height: 44,
      decoration: BoxDecoration(
        color: const Color(0xFFF1F1F1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: icon == IconlyBold.star ? const Color(0xFFE9D32C) : const Color(0xFF1D293A), size: 12),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListOfChatsPage()),
              );
            },
            child: Text(text, style: TextStyle(fontWeight: FontWeight.w600, fontSize: text == 'Чат' ? 12 : 14)),
          ),
        ],
      ),
    );
  }

  // Similar Products
  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 18, 2, 8),
        child: Text(title, style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 16, color: const Color(0xFF1D293A))),
      ),
    );
  }

  Widget _buildSimilarProductsGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: List.generate(2, (i) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            children: [
              Expanded(child: _buildProductCard('Paint', '3 000 ₽', 'assets/imagess/Paint.png')),
              const SizedBox(width: 12),
              Expanded(child: _buildProductCard('Brush', '1 500 ₽', 'assets/imagess/Brush (1).png')),
            ],
          ),
        )),
      ),
    );
  }

  Widget _buildProductCard(String name, String price, String image) {
    bool isFavorite = false;
    
    return StatefulBuilder(
      builder: (context, setState) => GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 8, offset: const Offset(0, 2))],
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 170,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFF2F6),
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Image.asset(image, fit: BoxFit.cover, width: double.infinity, height: double.infinity),
                      ),
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
                        Row(children: [
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(color: const Color(0xFFB1F0F7), borderRadius: BorderRadius.circular(12)),
                            child: const Icon(IconlyLight.bag, size: 16, color: Color(0xFF1D293A)),
                          ),
                          const SizedBox(width: 8),
                          Text('Art Supplies', style: TextStyle(fontSize: 12, color: const Color(0xFFA4ACB6))),
                        ]),
                        const SizedBox(height: 8),
                        Text(name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400), maxLines: 2, overflow: TextOverflow.ellipsis),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF232F3E),
                              padding: const EdgeInsets.symmetric(vertical: 8),
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
                  onTap: () => setState(() => isFavorite = !isFavorite),
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
        ),
      ),
    );
  }

  // Reviews
  Widget _buildReviews(bool isLargeScreen) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(23)),
      padding: const EdgeInsets.symmetric(vertical: 23),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(19, 10, 0, 0),
            child: Row(
              children: [
                const Text('Отзывы', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const Spacer(),
                const Text('4.5', style: TextStyle(color: Color(0xFF1A8357))),
                const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                  child: Icon(Icons.star, color: Colors.amber, size: 18),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: const Text('(13 отзывов)', style: TextStyle(color: Color(0xFF1A8357))),
                ),
              ],
            ),
          ),
          _buildReviewCard('Антон Киривлянов', '3 дня назад', 5, 'Отличное качество товара, полностью доволен сервисом и скоростью доставки, рекомендую!', spacing: 5),
          _buildReviewCard('Ирина Куленкова', 'неделю назад', 4, 'В целом всё хорошо! Но были нюансы из-за которых 5 звезд ставить не хочется.', spacing: 5),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ReviewsScreen()),
              );
            },
            child: const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
              child: Text('Просмотреть все', style: TextStyle(color: Color(0xFF00526A), fontSize: 12)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewCard(String name, String time, int rating, String comment, {double spacing = 13}) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(19, 12, 19, 0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        constraints: BoxConstraints(
          minWidth: 300,
          maxWidth: 500,
        ),
        height: rating == 5 ? 130 : 113,
        decoration: BoxDecoration(color: const Color(0xFFEFF2F6), borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),  
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(13, 4, 0, 5),  
                    child: Container(
                      width: 30, height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: const DecorationImage(image: AssetImage('assets/imagess/profile picture.png')),
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 5),  
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name, style: GoogleFonts.inter(fontWeight: FontWeight.w600, color: const Color(0xFF1D293A))),
                        Text(time, style: GoogleFonts.inter(color: const Color(0xFFA4ACB6), fontSize: 10)),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Row(children: List.generate(5, (i) => 
                    Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: Icon(Icons.star, size: 18, color: i < rating ? const Color(0xFFE9D32C) : Colors.grey[300]),
                    ))),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(50, 0, 20, 16),
              child: Text(comment, style: GoogleFonts.inter(color: const Color(0xFF1D293A), fontSize: 12)),
            ),
          ],
        ),
      ),
    );
  }

  // Complaint Widget
  Widget _buildComplaintWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(23),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14), // Reduced from 16
        child: Row(
          children: [
            Text('Пожаловаться на товар', style: GoogleFonts.inter(fontWeight: FontWeight.w600, color: Colors.black)),
            const Spacer(),
            Container(
              width: 100, height: 20, // Reduced from 32
              decoration: BoxDecoration(
                color: const Color(0xFFF7F7F7),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.only(left: 5, right: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(IconlyLight.send, size: 16, color: Color(0xFF1D293A)),
                  const SizedBox(width: 8),
                  Text('Отправить', style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 8, color: const Color(0xFF1D293A))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Bottom Bar
  Widget _buildBottomBar(BuildContext context, bool isLargeScreen) {
    return Container(
      height: 130,
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8, offset: const Offset(0, -2))],
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 3, 16, 10),
            child: Row(
              children: [
                Text('220 000 ₽', style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 18)),
                const Spacer(),
                _buildCounter(),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildBottomButton('Чат', false, isLargeScreen),
              const SizedBox(width: 12),
              _buildBottomButton('В корзину', true, isLargeScreen),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCounter() {
    return StatefulBuilder(
      builder: (context, setState) => Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: GestureDetector(
              onTap: () => setState(() => _counter = _counter > 1 ? _counter - 1 : 1),
              child: Container(
                width: 24, height: 24,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF1D293A), width: 1.0),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.remove, size: 16, color: Colors.black),
              ),
            ),
          ),
          const SizedBox(width: 5),
          Container(
            width: 35, height: 24,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF1D293A), width: 1.0),
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: Text('$_counter', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
          ),
          const SizedBox(width: 5),
          GestureDetector(
            onTap: () => setState(() => _counter++),
            child: Container(
              width: 24, height: 24,
              decoration: BoxDecoration(
                color: const Color(0xFF1D293A),
                border: Border.all(color: const Color(0xFF1D293A), width: 1.0),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.add, size: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButton(String text, bool isDark, bool isLargeScreen) {
    return ElevatedButton(
      onPressed: text == 'Чат' ? () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ListOfChatsPage()),
        );
      } : () {},
      style: ElevatedButton.styleFrom(
        minimumSize: Size(151.5, 52),
        backgroundColor: isDark ? const Color(0xFF1D293A) : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: BorderSide(color: const Color(0xFF1D293A), width: 1.0),
        ),
      ),
      child: Text(text, style: GoogleFonts.interTight(
        fontWeight: FontWeight.bold,
        color: isDark ? Colors.white : const Color(0xFF1D293A),
      )),
    );
  }
}