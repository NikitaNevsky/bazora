import 'package:flutter/material.dart';

class OrdersListRight2 extends StatelessWidget {
  const OrdersListRight2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF232A36),
        elevation: 0,
        title: const Text('Заказы', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 16, left: 0, right: 0, bottom: 0),
        children: [
          _orderCard(
            status: 'доставлен',
            statusColor: const Color(0xFF6DE5C5),
            statusTextColor: Color(0xFF10C48B),
            button: true,
            confirm: true,
          ),
          _orderCard(
            status: 'нет оплаты',
            statusColor: Colors.transparent,
            statusTextColor: Color(0xFFFFC700),
            button: true,
            confirm: false,
            statusBorder: Border.all(color: Color(0xFFFFC700)),
          ),
          _orderCard(
            status: 'отменен',
            statusColor: Colors.transparent,
            statusTextColor: Color(0xFFFF6680),
            button: false,
            confirm: false,
            statusBorder: Border.all(color: Color(0xFFFF6680)),
          ),
          _orderCard(
            status: 'в доставке',
            statusColor: Colors.transparent,
            statusTextColor: Color(0xFF00B6F0),
            button: false,
            confirm: false,
            statusBorder: Border.all(color: Color(0xFF00B6F0)),
          ),
        ],
      ),
      bottomNavigationBar: _bottomBar(),
    );
  }

  Widget _orderCard({
    required String status,
    required Color statusColor,
    required Color statusTextColor,
    bool button = false,
    bool confirm = false,
    Border? statusBorder,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('App Store', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(width: 8),
              const Text('№ 236706', style: TextStyle(color: Color(0xFFA4ACB6), fontSize: 12)),
              const SizedBox(width: 6),
              const Icon(Icons.info_outline, size: 15, color: Color(0xFFA4ACB6)),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(12),
                  border: statusBorder,
                ),
                child: Text(status, style: TextStyle(color: statusTextColor, fontSize: 13, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Stack(
                children: [
                  Image.asset('assets/images/macbook.png', width: 54, height: 54, fit: BoxFit.cover),
                  if (!confirm)
                    Positioned(
                      left: 36,
                      top: 0,
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 2)],
                        ),
                        child: Center(
                          child: Text('+1', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('1 товара - 220 000 ₽', style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 2),
                    Text('250 ₽ кэшбэк', style: TextStyle(color: Color(0xFF36B37E))),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              if (button)
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFF232A36)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  ),
                  child: const Text('Перейти в чат', style: TextStyle(color: Color(0xFF232A36), fontWeight: FontWeight.bold)),
                ),
              if (confirm)
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF232A36),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                    ),
                    child: const Text('Подтвердить', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              if (!button)
                Row(
                  children: [
                    const Icon(Icons.chat_bubble_outline, color: Color(0xFF232A36)),
                    const SizedBox(width: 6),
                    const Text('Перейти в чат', style: TextStyle(color: Color(0xFF232A36), fontWeight: FontWeight.bold)),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _bottomBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: const Color(0xFF232A36),
      unselectedItemColor: const Color(0xFFA4ACB6),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.storefront), label: 'Каталог'),
        BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'Заказы'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Корзина'),
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Чаты'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
      ],
      currentIndex: 1,
      onTap: (_) {},
    );
  }
}
