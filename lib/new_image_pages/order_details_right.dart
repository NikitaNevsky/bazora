import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import '../catalogpage.dart';
import '../listofchats.dart';
import '../neweditprofilepage.dart';
import 'orders_list_right.dart';
import 'wholesale_page_right.dart';

class OrderDetailsRight extends StatefulWidget {
  const OrderDetailsRight({Key? key}) : super(key: key);

  @override
  State<OrderDetailsRight> createState() => _OrderDetailsRightState();
}

class _OrderDetailsRightState extends State<OrderDetailsRight> {
  bool usePoints = false; // toggles using points
  int _selectedIndex = 1; // Since this is the orders page

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const CatalogPage()),
        );
      } else if (index == 2) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const WholesalePageRight()),
        );
      } else if (index == 3) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const ListOfChatsPage()),
        );
      } else if (index == 4) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const NewEditProfilePage()),
        );
      }
    });
  }

  Widget _buildBottomNavBar() {
    final isLargeScreen = MediaQuery.of(context).size.width > 600;
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      backgroundColor: Colors.white,
      selectedItemColor: const Color(0xFF1D293A),
      unselectedItemColor: const Color(0xFFA4ACB6),
      selectedFontSize: isLargeScreen ? 14 : 12,
      unselectedFontSize: isLargeScreen ? 12 : 10,
      iconSize: isLargeScreen ? 28 : 24,
      onTap: _onItemTapped,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(IconlyLight.category),
          label: 'Каталог',
        ),
        BottomNavigationBarItem(
          icon: Icon(IconlyBold.document),
          label: 'Заказы',
        ),
        BottomNavigationBarItem(
          icon: Icon(IconlyLight.buy),
          label: 'Корзина',
        ),
        BottomNavigationBarItem(
          icon: Icon(IconlyLight.chat),
          label: 'Чаты',
        ),
        BottomNavigationBarItem(
          icon: Icon(IconlyLight.profile),
          label: 'Профиль',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isLargeScreen = screenWidth > 600;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(145),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF232A36),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(23),
              bottomRight: Radius.circular(23),
            ),
          ),
          child: Row(
            children: [
              const SizedBox(width: 12), // Keep the same left spacing for alignment
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 0), // Remove right padding since we don't need to account for the back button anymore
                    child: Text(
                      'Детали заказа',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: isLargeScreen ? 28 : 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          // Scrollable content
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
              child: Column(
                children: [
                  // Top container (now scrollable with the rest)
                  Container(
                    margin: EdgeInsets.only(
                      left: screenWidth * 0.03,
                      right: screenWidth * 0.03,
                      top: 12,
                      bottom: 0,
                    ),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(23),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '№ 236706',
                              style: TextStyle(
                                color: const Color(0xFFA4ACB6),
                                fontSize: isLargeScreen ? 14 : 12,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Icon(
                              Icons.copy,
                              color: const Color(0xFFA4ACB6),
                              size: 16,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'AppStore',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: isLargeScreen ? 16 : 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'оформлен 16.08.2024 10:30',
                                  style: TextStyle(
                                    color: const Color(0xFFA4ACB6),
                                    fontSize: isLargeScreen ? 12 : 10,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black, width: 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                'ожидание оплаты',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: isLargeScreen ? 12 : 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  // Middle scrollable list
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: screenHeight * 0.02),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.015,
                              horizontal: screenWidth * 0.025),
                          child: _cartItem(index),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          // Bottom fixed summary section
          _summarySection(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _cartItem(int index) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isLargeScreen = screenWidth > 600;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              width: isLargeScreen ? 110 : 88,
              height: isLargeScreen ? 120 : 95,
              decoration: BoxDecoration(
                color: const Color(0xFFEFF2F6),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/random1.png',
                  width: isLargeScreen ? 50 : 40,
                  height: isLargeScreen ? 50 : 40,
                ),
              ),
            ),
            
          ],
        ),
        SizedBox(width: screenWidth * 0.025),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('1 650 000 ₽',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: isLargeScreen ? 16 : 14)),
                      const Spacer(),
                      Container(
                        width: 37,
                        height: 26,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEFF2F6),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: Text(
                            'x2',
                            style: TextStyle(
                              fontSize: isLargeScreen ? 12 : 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.02,
                        vertical: screenHeight * 0.002),
                    decoration: BoxDecoration(
                      color: const Color(0xFF92D3F5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          IconlyLight.discount,
                          size: isLargeScreen ? 16 : 14,
                          color: Colors.black,
                        ),
                        SizedBox(width: screenWidth * 0.01),
                        Text(
                          '3 550 ₽ кешбэк',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: isLargeScreen ? 14 : 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.008),
              Text('Macbook Air M1 (A2337)',
                  style: TextStyle(
                    fontSize: isLargeScreen ? 14 : 12,
                    color: Colors.black,
                  )),
              
              SizedBox(height: screenHeight * 0.008),
              Row(
                children: [
                  Container(
                    width: isLargeScreen ? 26 : 22,
                    height: isLargeScreen ? 26 : 22,
                    decoration: const BoxDecoration(
                      color: Color(0xFF232A36),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.015),
                  _chip('8 ГБ'),
                  SizedBox(width: screenWidth * 0.015),
                  _chip('SSD 512 ГБ'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
    
  }

  Widget _chip(String text) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 600;

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.02, vertical: screenWidth * 0.005),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF1D293A)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text, style: TextStyle(fontSize: isLargeScreen ? 14 : 12)),
    );
  }

  Widget _summarySection() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isLargeScreen = screenWidth > 600;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Container(
        height: 187,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(23),
            topRight: Radius.circular(23),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          screenWidth * 0.045,
          screenHeight * 0.02,
          screenWidth * 0.045,
          screenHeight * 0.015,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Оплата бонусами',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFFA4ACB6),
                  ),
                ),
                Text(
                  '3 050 000 ₽',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFFA4ACB6),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.015),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Скидка',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFFA4ACB6),
                  ),
                ),
                Text(
                  '-100000₽',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFFA4ACB6),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.015),
            Divider(
              color: const Color(0xFFDFE5ED),
              height: 1,
              thickness: 1,
              indent: screenWidth * 0.02,
              endIndent: screenWidth * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Итого',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF1D293A),
                  ),
                ),
                Text(
                  '2 950 000 ₽',
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF1D293A),
                  ),
                ),
              ],
            ),
            
            SizedBox(height: screenHeight * 0.015),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Доставка',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF1D293A),
                  ),
                ),
                Text(
                  'Самовывоз',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1D293A),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF1D293A),
                  ),
                ),
                Text(
                  'Склад №3, Москва, Лесная 12',
                  style: GoogleFonts.urbanist(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF1D293A),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      ),
    );
  }
}
