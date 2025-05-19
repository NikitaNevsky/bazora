import 'package:flutter/material.dart';

class Info2 extends StatelessWidget {
  const Info2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x42424566),
      body: Column(
        children: [
          const SizedBox(height: 54),
          Container(
            height: 116,
            margin: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Кэшбэк баллы',
                    style: TextStyle(
                      color: Color(0xFF1D293A),
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Urbanist',
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Вы можете использовать баллы для оплаты заказов из расчета 1 балл = 1 рубль. Оплата оптового заказа возможна до 10% от итоговой суммы, розничного заказа - до 5%',
                    style: TextStyle(
                      color: Color(0xFF1D293A),
                      fontSize: 12,
                      fontFamily: 'Urbanist',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
