import 'package:flutter/material.dart';
import 'storedetails.dart';
import 'catalogpage.dart';

class ThirdComponent extends StatelessWidget {
  final bool hasShop;

  const ThirdComponent({
    super.key,
    required this.hasShop,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 24), // Padding from screen edges
      child: Container(
        width: screenWidth, // Take full width minus padding
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32), // Inner padding
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Профиль создан!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1D293A),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Вы можете приступить к покупкам',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Color(0xFF1D293A),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      if (hasShop) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const StoreDetailsScreen()),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CatalogPage()),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1D293A),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: const Text(
                      'Ок',
                      style: TextStyle(
                        fontFamily: 'Inter Tight',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
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
