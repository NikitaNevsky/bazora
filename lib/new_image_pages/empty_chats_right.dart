import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../features/catalog/presentation/catalogpage.dart';
import '../features/profile/presentation/my_profile_page.dart';
import '../features/cart/presentation/wholesale_page_right.dart';
import '../features/orders/presentation/orders_list_right.dart';

class EmptyChatsRight extends StatefulWidget {
  const EmptyChatsRight({Key? key}) : super(key: key);

  @override
  State<EmptyChatsRight> createState() => _EmptyChatsRightState();
}

class _EmptyChatsRightState extends State<EmptyChatsRight> {
  int _currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    final isLargeScreen = MediaQuery.of(context).size.width > 600;
    
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(23),
            bottomRight: Radius.circular(23),
          ),
          child: AppBar(
            backgroundColor: const Color(0xFF1D293A),
            elevation: 0,
            centerTitle: true,
            flexibleSpace: Center(
              child: Container(
                margin: const EdgeInsets.only(top: 30),
                child: const Text(
                  'Чаты',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 60),
          Center(
            child: Column(
              children: [
                Image.asset('assets/imagess/emptychat.png', width: 220),
                const SizedBox(height: 32),
                const Text(
                  'Чат с сотрудником сервиса появится после\nоформления заказа',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFF1D293A), fontSize: 14),
                ),
              ],
            ),
          ),
        ],
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
            } else if (index == 1) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const OrdersListRight()),
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
            icon: Icon(IconlyLight.document),
            label: 'Заказы',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.buy),
            label: 'Корзина',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyBold.chat),
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
