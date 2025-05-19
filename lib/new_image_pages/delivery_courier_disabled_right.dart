import 'package:flutter/material.dart';

class DeliveryCourierDisabledRight extends StatelessWidget {
  const DeliveryCourierDisabledRight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 600;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(110),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF232A36),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(23),
              bottomRight: Radius.circular(23),
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            leading: const BackButton(color: Colors.white),
            centerTitle: true,
            toolbarHeight: 100,
            title: const Text(
              'Способ доставки',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: isLargeScreen ? 50 : 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Самовывоз со склада',
                      style: TextStyle(
                        fontSize: isLargeScreen ? 16 : 14,
                        color: const Color(0xFF1D293A),
                      ),
                    ),
                    Transform.scale(
                      scale: isLargeScreen ? 1.0 : 0.8,
                      child: Switch(
                        value: false,
                        onChanged: null,
                        activeColor: Colors.white,
                        activeTrackColor: const Color(0xFF1D293A),
                        inactiveThumbColor: Colors.white,
                        inactiveTrackColor: const Color(0xFFEFF2F6),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: isLargeScreen ? 50 : 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Доставка курьером',
                      style: TextStyle(
                        fontSize: isLargeScreen ? 16 : 14,
                        color: const Color(0xFF1D293A),
                      ),
                    ),
                    Transform.scale(
                      scale: isLargeScreen ? 1.0 : 0.8,
                      child: Switch(
                        value: true,
                        onChanged: null,
                        activeColor: Colors.white,
                        activeTrackColor: const Color(0xFF1D293A),
                        inactiveThumbColor: Colors.white,
                        inactiveTrackColor: const Color(0xFFEFF2F6),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Введите адрес доставки',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: 'Адрес',
                hintStyle: const TextStyle(color: Color(0xFFA4ACB6)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(color: Color(0xFFA4ACB6)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(color: Color(0xFFA4ACB6)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(color: Color(0xFFA4ACB6)),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'ИЛИ',
              style: TextStyle(
                color: Color(0xFF1D293A),
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              'Выберите адрес магазина',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            _storeTile('Магазин №1', 'Оптовик, Москва, Лесная 45', false),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                border: Border.all(color: const Color(0xFF1D293A), width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Магазин №2',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1D293A),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Технолаб, Москва, Дружбы 37',
                    style: TextStyle(color: Color(0xFF1D293A)),
                  ),
                ],
              ),
            ),
            const Spacer(),
            _confirmButton(false),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _storeTile(String title, String address, bool enabled) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFA4ACB6))),
          const SizedBox(height: 4),
          Text(address, style: const TextStyle(color: Color(0xFFA4ACB6))),
        ],
      ),
    );
  }

  Widget _confirmButton(bool enabled) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Center(
        child: SizedBox(
          width: 196,
          child: ElevatedButton(
            onPressed: null,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFA4ACB6),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(vertical: 18),
            ),
            child: const Text(
              'Подтвердить',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
