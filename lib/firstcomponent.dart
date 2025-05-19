import 'package:flutter/material.dart';

class FirstComponent extends StatelessWidget {
  const FirstComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 355,
      height: 331,
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 40),
            const Text(
              'Зарегистрируйтесь, чтобы открыть оптовый раздел',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                color: Color(0xFF1D293A),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Просмотр и покупка товаров в оптовом разделе доступны только для зарегистрированных пользователей',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                color: Color(0xFF1D293A),
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {
                    // Add your back action here
                    print('Back button pressed');
                  },
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(113, 52),
                    side: const BorderSide(color: Color(0xFF1D293A), width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    backgroundColor: const Color(0xFFFAFAFA),
                  ),
                  child: const Text(
                    'Вернуться',
                    style: TextStyle(
                      fontFamily: 'Inter Tight',
                      color: Color(0xFF1D293A),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Add your register action here
                    print('Register button pressed');
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(190, 52),
                    backgroundColor: const Color(0xFF1D293A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                      side: const BorderSide(
                        color: Color(0xFF1D293A),
                        width: 1,
                      ),
                    ),
                  ),
                  child: const Text(
                    'Зарегестрироваться',
                    style: TextStyle(
                      fontFamily: 'Inter Tight',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
