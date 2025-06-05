import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../features/catalog/presentation/catalogpage.dart';
import '../features/profile/presentation/my_profile_page.dart';
import '../features/cart/presentation/wholesale_page_right.dart';

class EmptyNotificationsRight extends StatefulWidget {
  const EmptyNotificationsRight({Key? key}) : super(key: key);

  @override
  State<EmptyNotificationsRight> createState() => _EmptyNotificationsRightState();
}

class _EmptyNotificationsRightState extends State<EmptyNotificationsRight> {
  int _currentIndex = 1; // Default to Orders tab

  Widget _buildBottomNavBar() {
    final isLargeScreen = MediaQuery.of(context).size.width > 600;
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      backgroundColor: Colors.white,
      selectedItemColor: const Color(0xFF1D293A),
      unselectedItemColor: const Color(0xFFA4ACB6),
      selectedFontSize: isLargeScreen ? 14 : 12,
      unselectedFontSize: isLargeScreen ? 12 : 10,
      iconSize: isLargeScreen ? 28 : 24,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
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
          }
        });
      },
      items: [
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
    return Scaffold(
      backgroundColor: Color(0xFFF0F0F3),
      appBar: AppBar(
        toolbarHeight: 145,
        backgroundColor: const Color(0xFF1D293A),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(23),
            bottomRight: Radius.circular(23),
          ),
        ),
        title: const Text('Заказы', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/imagess/bigboy.png', width: 220),
            const SizedBox(height: 20),
            const Text(
              'У вас еще нет активных заказов',
              style: TextStyle(color: Color(0xFF1D293A), fontSize: 18),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }
}
