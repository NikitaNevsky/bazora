import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart'; // Add this import
import 'package:google_fonts/google_fonts.dart';
import '../catalogpage.dart';
import '../profilepage.dart';
import '../chatpage.dart';
import '../listofchats.dart';
import '../neweditprofilepage.dart';
import 'orders_list_right.dart'; // Add this import at the top with other imports

class WholesalePageRight extends StatefulWidget {
  const WholesalePageRight({Key? key}) : super(key: key);

  @override
  State<WholesalePageRight> createState() => _WholesalePageRightState();
}

class _WholesalePageRightState extends State<WholesalePageRight> {
  bool selectAll = true;
  List<bool> selectedItems = [true, true, true]; // Example: 3 items
  int _currentIndex = 2; // Default to Cart tab
  bool usePoints = false; // toggles using points
  int quantity =
      2; // Add this at the top of the class with other state variables

  @override
  Widget build(BuildContext context) {
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
          child: Center(
            child: Text(
              'Корзина',
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 0, left: 16, right: 16, bottom: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // Custom styled checkbox
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF232A36),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      width: 25,
                      height: 26,
                      child: Checkbox(
                        value: selectAll,
                        onChanged: (value) {
                          setState(() {
                            selectAll = value ?? false;
                            for (int i = 0; i < selectedItems.length; i++) {
                              selectedItems[i] = selectAll;
                            }
                          });
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                        side: const BorderSide(color: Colors.white, width: 2),
                        checkColor: Colors.white,
                        activeColor: const Color(0xFF232A36),
                      ),
                    ),
                    const SizedBox(width: 2),
                    Text(
                      'Выбрать все',
                      style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Удалить выбранные',
                    style: TextStyle(
                      color: Color(0xFFEA5A47),
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: selectedItems.length,
              itemBuilder: (context, index) {
                // merge last two sections
                if (index == selectedItems.length - 2) {
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Магазин: Apple Store',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 12),
                              width: double.infinity,
                              height: 1.2,
                              color: const Color(0xFFA4ACB6),
                            ),
                            _cartItem(index),
                            const SizedBox(height: 8),
                            _cartItem(index + 1),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  );
                }
                // skip last section since merged above
                if (index == selectedItems.length - 1)
                  return const SizedBox.shrink();
                // default individual sections
                final section = _storeSection('Store $index', index);
                return Column(
                  children: [
                    section,
                    const SizedBox(height: 17),
                  ],
                );
              },
            ),
          ),
          _summarySection(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _storeSection(String store, int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Магазин: App Store',
              style: const TextStyle(fontWeight: FontWeight.bold)),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            width: double.infinity,
            height: 1.2,
            color: const Color(0xFFA4ACB6),
          ),
          _cartItem(index),
          const SizedBox(height: 25),
        ],
      ),
    );
  }

  Widget _cartItem(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: 88,
                    height: 95,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFF2F6),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/random1.png',
                        width: 40,
                        height: 40,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF232A36),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      width: 16.89,
                      height: 16.89,
                      child: Checkbox(
                        value: selectedItems[index],
                        onChanged: (value) {
                          setState(() {
                            selectedItems[index] = value ?? false;
                            selectAll = selectedItems.every((e) => e);
                          });
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                        side: const BorderSide(color: Colors.white, width: 2),
                        checkColor: Colors.white,
                        activeColor: const Color(0xFF232A36),
                        splashRadius: 0,
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Row(
                      children: [
                        Container(
                          width: 27.2,
                          height: 26,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xFFA4ACB6),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Icon(IconlyLight.heart,
                              size: 16, color: const Color(0xFFDFE5ED)),
                        ),
                        const SizedBox(width: 4),
                        Container(
                          width: 25,
                          height: 26,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xFFA4ACB6),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Icon(IconlyLight.delete,
                              size: 16, color: const Color(0xFFDFE5ED)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('1 650 000 ₽',
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    const SizedBox(height: 4),
                    Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE3F4FF),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Discount icon
                          Icon(
                            IconlyLight.discount,
                            size: 14,
                            color: Colors.black,
                          ),
                          const SizedBox(width: 4),
                          const Text(
                            '3 550 ₽ кешбэк',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                const Text('Macbook Air M1 (A2337)',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      width: 22,
                      height: 22,
                      decoration: const BoxDecoration(
                        color: Color(0xFF232A36),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    _chip('8 ГБ'),
                    const SizedBox(width: 6),
                    _chip('SSD 512 ГБ'),
                  ],
                ),
                const SizedBox(height: 8),
                _quantitySelector(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _chip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF1D293A)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text, style: const TextStyle(fontSize: 12)),
    );
  }

  Widget _quantitySelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _qtyButton(Icons.remove, () {
          setState(() {
            if (quantity > 1) quantity--;
          });
        }),
        const SizedBox(width: 4),
        Container(
          width: 34,
          height: 23,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFFDFE5ED),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            '$quantity',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        const SizedBox(width: 4),
        _qtyButton(Icons.add, () {
          setState(() {
            quantity++;
          });
        }),
      ],
    );
  }

  Widget _qtyButton(IconData icon, VoidCallback onPressed) {
    final bool isPlus = icon == Icons.add;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: isPlus ? const Color(0xFF1D293A) : const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(icon,
            size: 14, color: isPlus ? Colors.white : const Color(0xFFA4ACB6)),
      ),
    );
  }

  Widget _summarySection() {
    return Container(
      height: 138,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            Colors.white,
            Color(0xFFF2F2F2), // lighter gray for softer fade
          ],
          stops: [0.0, 0.95, 1.0], // fade in bottom 5%
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Использовать баллы',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  width: 44,
                  height: 21.6, // reduced from 24 by 10%
                  child: Switch(
                    value: usePoints,
                    onChanged: (value) => setState(() => usePoints = value),
                    activeColor: Colors.white,
                    activeTrackColor: const Color(0xFF1D293A),
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: const Color(0xFFEFF2F6),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    trackOutlineColor:
                        MaterialStateProperty.all(Colors.transparent),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 27.5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('3 050 000 ₽',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 20)),
                    Text('3 товара *15,2 кг',
                        style: TextStyle(
                          color: Color(0xFFA4ACB6),
                          fontSize: 12,
                        ))
        ,
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF232A36),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    fixedSize: const Size(180, 47),
                  ),
                  child: const Text('Оформить заказ',
                      style: TextStyle(color: Colors.white, fontSize: 14)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

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
      elevation: 0,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
          if (index == 0)
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => CatalogPage()));
          if (index == 1)
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => const OrdersListRight()));
          if (index == 2) {/* Cart (this page) */}
          if (index == 3)
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => ListOfChatsPage()));
          if (index == 4)
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => NewEditProfilePage()));
        });
      },
      items: const [
        BottomNavigationBarItem(
            icon: Icon(IconlyLight.category), label: 'Каталог'),
        BottomNavigationBarItem(
            icon: Icon(IconlyLight.document), label: 'Заказы'),
        BottomNavigationBarItem(icon: Icon(IconlyBold.buy), label: 'Корзина'),
        BottomNavigationBarItem(icon: Icon(IconlyLight.chat), label: 'Чаты'),
        BottomNavigationBarItem(
            icon: Icon(IconlyLight.profile), label: 'Профиль'),
      ],
    );
  }
}
