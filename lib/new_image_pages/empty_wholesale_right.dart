import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import '../catalogpage.dart';
import '../listofchats.dart';
import '../neweditprofilepage.dart';
import 'orders_list_right.dart';

class EmptyWholesaleRight extends StatefulWidget {
  const EmptyWholesaleRight({Key? key}) : super(key: key);

  @override
  State<EmptyWholesaleRight> createState() => _EmptyWholesaleRightState();
}

class _EmptyWholesaleRightState extends State<EmptyWholesaleRight> {
  int _currentIndex = 2; // Default to Cart tab

  @override
  Widget build(BuildContext context) {
    final isLargeScreen = MediaQuery.of(context).size.width > 600;
    
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F3),
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
        title: const Text('Корзина', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/bigboy.png', width: 220),
            const SizedBox(height: 20),
            const Text(
              'Ваша корзина пуста',
              style: TextStyle(color: Color(0xFF1D293A), fontSize: 18),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
            }
            if (index == 1) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const OrdersListRight()),
              );
            }
            if (index == 2) {
              // Cart (this page)
            }
            if (index == 3) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const ListOfChatsPage()),
              );
            }
            if (index == 4) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const NewEditProfilePage()),
              );
            }
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.category),
            label: 'Каталог',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.document),
            label: 'Заказы',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyBold.buy),
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
      ),
    );
  }
}
