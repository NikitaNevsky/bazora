import 'package:flutter/material.dart';
import 'storedetails.dart'; // Store details screen
import 'catalogpage.dart'; // Catalog screen

class ThirdComponent extends StatelessWidget {
  final bool hasShop;

  const ThirdComponent({
    super.key,
    required this.hasShop,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0x66424245), // semi-transparent dark background
      body: Center(
        child: Container(
          width: 355,
          height: 225,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Text(
                  'Профиль создан!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1D293A),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Text(
                  'Вы можете приступить к покупкам',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF1D293A),
                  ),
                ),
              ),
              SizedBox(
                width: 315,
                height: 52,
                child: ElevatedButton(
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
                    backgroundColor: const Color(0xFF1D293A),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                      side: const BorderSide(
                        color: Color(0xFF1D293A),
                        width: 1,
                      ),
                    ),
                    textStyle: const TextStyle(
                      fontFamily: 'Inter Tight',
                      fontWeight: FontWeight.bold,
                    ),
                    elevation: 0,
                  ),
                  child: const Text('Ок'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
