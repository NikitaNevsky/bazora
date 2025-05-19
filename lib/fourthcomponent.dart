import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'storedetails.dart'; // Store details screen
import 'catalogpage.dart'; // Catalog screen
// Riverpod state provider

class FourthComponentWidget extends ConsumerWidget {
  final bool hasShop;

  const FourthComponentWidget({
    super.key,
    required this.hasShop,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get screen width and height for responsiveness
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // Use the passed hasShop value
    print('FourthComponentWidget - hasShop value: $hasShop');

    return Scaffold(
      backgroundColor: const Color(0xff42424566), // Background color
      body: Center(
        child: Container(
          width: width * 0.9, // 90% of screen width
          height: height * 0.4, // 40% of screen height
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: height * 0.05),
                    child: const Text(
                      'Данные на проверке',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: Color(0xFF1D293A),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: height * 0.04),
                  child: const Text(
                    'Администратор проверит ваш запрос на оптовую закупку в течение 24 часов',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Color(0xFF1D293A),
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                // The "Ok" button
                ElevatedButton(
                  onPressed: () {
                    if (hasShop) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const StoreDetailsScreen(),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CatalogPage(),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xFF1D293A),
                    padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                    minimumSize: Size(width * 0.9, 52),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                      side:
                          const BorderSide(color: Color(0xFF1D293A), width: 1),
                    ),
                  ),
                  child: const Text(
                    'Ок',
                    style: TextStyle(
                      fontFamily: 'Inter Tight',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
