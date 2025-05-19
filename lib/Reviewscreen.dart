import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'chatpage.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                // Header section
                Container(
                  width: double.infinity,
                  height: isTablet ? 200 : 150,
                  decoration: const BoxDecoration(
                    color: Color(0xFF1D293A),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(23),
                      bottomRight: Radius.circular(23),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: isTablet ? 55 : 35),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                IconlyLight.arrowLeft2,
                                color: Colors.white,
                                size: isTablet ? 28 : 20,
                              ),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                            const Spacer(),
                            Text(
                              'Отзывы',
                              style: GoogleFonts.inter(
                                color: const Color(0xFFEFF2F6),
                                fontSize: isTablet ? 22 : 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '250',
                              style: GoogleFonts.inter(
                                color: const Color(0xFFA4ACB6),
                                fontSize: isTablet ? 22 : 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: isTablet ? 160 : 100),
                            Icon(
                              IconlyLight.swap,
                              color: Colors.white,
                              size: isTablet ? 32 : 24,
                            ),
                            SizedBox(width: isTablet ? 24 : 16),
                            SizedBox(width: isTablet ? 32 : 24),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: isTablet ? 35 : 15, top: isTablet ? 40 : 25),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: isTablet ? 23 : 13, bottom: isTablet ? 23 : 13),
                                child: Text(
                                  '4.5',
                                  style: GoogleFonts.inter(
                                    color: const Color(0xFFEFF2F6),
                                    fontSize: isTablet ? 28 : 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: isTablet ? 15 : 5, bottom: isTablet ? 23 : 13),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: List.generate(5, (index) => 
                                        Icon(Icons.star, color: Colors.amber, size: isTablet ? 28 : 18)
                                      ),
                                    ),
                                    SizedBox(height: isTablet ? 8 : 4),
                                    Row(
                                      children: [
                                        Text(
                                          'Мнение покупателей',
                                          style: GoogleFonts.inter(
                                            color: const Color(0xFFA4ACB6),
                                            fontSize: isTablet ? 16 : 10,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(context, '/reviews');
                                          },
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: const Color(0xFF1D293A),
                                            size: isTablet ? 16 : 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: isTablet ? 24 : 16),
                // Photos section
                Padding(
                  padding: EdgeInsets.all(isTablet ? 16 : 8),
                  child: Container(
                    width: double.infinity,
                    height: isTablet ? 200 : 141,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(23),
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: isTablet ? 24 : 12, top: isTablet ? 8 : 4),
                            child: Text(
                              'Фото и видео товара',
                              style: TextStyle(
                                fontSize: isTablet ? 20 : 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: isTablet ? 20 : 10),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(6, (index) => 
                              Padding(
                                padding: EdgeInsets.only(left: index == 0 ? (isTablet ? 20 : 10) : (isTablet ? 8 : 4)),
                                child: Container(
                                  width: isTablet ? 100 : 63,
                                  height: isTablet ? 120 : 77,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10),
                                    image: const DecorationImage(
                                      image: NetworkImage(
                                        'https://s3-alpha-sig.figma.com/img/ea03/12e5/abf0c1e2a0cddffdc702022b52f2f0f4?Expires=1745798400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=VQC6mgBHrmfKcXjlFj3yznl~~u~lUdC~lt~jBZeab6OWupIzRzggLFG6QcMVeq-lAWGWJfqeCYbiYcidZIvj8cXT~980ojSbdK8dEX7UDoPdVgaHbe0bWbzBDR-OcWce-CT~TzrGvQOagOJ0owktgJmA6xX9~Bgf-hhqnGUZpEzZf9TqqWwYRzgS-ow9YDALNWuSZwj6KuIpOdrfWvk-XRzox4RZpzLh4lDSc5FsuNmSYkSlpcqDsoa5g1x-xnHkrtEMzYcLYjK45sM481DdeYVBoHZPDdhE1GIYHN3Ozjj4yogEabcLPMqELQdlRGTUOs3gyO6dEc4vOGfxi8wiuw__'
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Icon(
                                        index < 2 ? Icons.play_circle_outline : Icons.camera_alt,
                                        color: Colors.white,
                                        size: isTablet ? 24 : 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Reviews list
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(3, (index) => 
                        Padding(
                          padding: EdgeInsets.only(top: index == 0 ? 0 : (isTablet ? 16 : 8)),
                          child: _buildReviewCard(isTablet, context),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Add to cart button
            Positioned(
              bottom: isTablet ? 30 : 15,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: isTablet ? 280 : 196,
                  height: isTablet ? 80 : 56,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1D293A),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(IconlyLight.buy, color: Colors.white, size: isTablet ? 28 : 20),
                      SizedBox(width: isTablet ? 20 : 10),
                      Text(
                        'В корзину',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: isTablet ? 20 : 16,
                          fontWeight: FontWeight.bold,
                        ),
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

  Widget _buildReviewCard(bool isTablet, BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: isTablet ? 16 : 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(23),
      ),
      child: Padding(
        padding: EdgeInsets.all(isTablet ? 20 : 12),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFEFF2F6),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.all(isTablet ? 16 : 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Row(
                      children: List.generate(5, (index) => 
                        Icon(Icons.star, color: Colors.amber, size: isTablet ? 28 : 18)
                      ),
                    ),
                    SizedBox(width: isTablet ? 8 : 4),
                    Text(
                      '25 февраля 2025',
                      style: GoogleFonts.inter(
                        color: const Color(0xFFA4ACB6),
                        fontSize: isTablet ? 16 : 10,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: isTablet ? 12 : 4),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: isTablet ? 24 : 15,
                      backgroundImage: const AssetImage('assets/images/profile.jpg'),
                    ),
                    SizedBox(width: isTablet ? 16 : 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: isTablet ? 20 : 10),
                        Text(
                          'Антон Киривлянов',
                          style: GoogleFonts.inter(
                            color: const Color(0xFF1D293A),
                            fontSize: isTablet ? 20 : 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: isTablet ? 16 : 8),
                Text(
                  'Комментарии',
                  style: GoogleFonts.urbanist(
                    color: const Color(0xFF1D293A),
                    fontSize: isTablet ? 18 : 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: isTablet ? 16 : 8),
                Text(
                  'Отличное качество товара, полностью доволен сервисом и скоростью доставки, рекомендую! Отличное качество товара, полностью доволен... еще',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.urbanist(
                    color: const Color(0xFF1D293A),
                    fontSize: isTablet ? 18 : 12,
                    height: 1.2,
                  ),
                ),
                SizedBox(height: isTablet ? 20 : 9),
                Text(
                  'Вам помог этот отзыв?',
                  style: GoogleFonts.inter(
                    color: const Color(0xFFA4ACB6),
                    fontSize: isTablet ? 16 : 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: isTablet ? 14 : 7),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const ChatPage()),
                        );
                      },
                      child: _buildHelpButton('Да', '16', isTablet),
                    ),
                    SizedBox(width: isTablet ? 12 : 6),
                    _buildHelpButton('Нет', '2', isTablet),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHelpButton(String text, String count, bool isTablet) {
    return Container(
      width: isTablet ? 80 : 50,
      height: isTablet ? 36 : 23,
      decoration: BoxDecoration(
        color: const Color(0xFFDFE5ED),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text),
          SizedBox(width: isTablet ? 4 : 1),
          Text(
            count,
            style: const TextStyle(color: Color(0xFFA4ACB6)),
          ),
        ],
      ),
    );
  }
}