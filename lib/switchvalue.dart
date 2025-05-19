import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'namedetails.dart'; // Import the NameDetailsScreen
import 'thirdcomponent.dart'; // Import the ThirdComponent screen
import 'fourthcomponent.dart'; // Import the FourthComponent screen
import 'package:iconly/iconly.dart'; // Import the Iconly package
// Import the hasShopProvider

class SwitchValueScreen extends ConsumerStatefulWidget {
  final bool hasShop;

  const SwitchValueScreen({
    super.key,
    required this.hasShop,
  });

  @override
  ConsumerState<SwitchValueScreen> createState() => _SwitchValueScreenState();
}

class _SwitchValueScreenState extends ConsumerState<SwitchValueScreen> {
  bool isWholesaleSelected = false;
  bool isRetailSelected = false;

  void _handleWholesaleSwitch(bool value) {
    setState(() {
      isWholesaleSelected = value;
      if (value) {
        isRetailSelected = false;
      }
    });
  }

  void _handleRetailSwitch(bool value) {
    setState(() {
      isRetailSelected = value;
      if (value) {
        isWholesaleSelected = false;
      }
    });
  }

  bool get isButtonEnabled => isWholesaleSelected || isRetailSelected;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // Use the passed hasShop value
    print('SwitchValueScreen - hasShop value: ${widget.hasShop}');

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              height: 197,
              decoration: const BoxDecoration(
                color: Color(0xFF1D293A),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(23),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 20,
                    left: 20,
                    child: IconButton(
                      icon: const Icon(IconlyLight.arrow_left, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  Center(
                    child: Text(
                      'BAZORA',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: height * 0.05),

            const Text(
              'Выберите формат закупки',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: height * 0.04),

            // Оптовый (Wholesale)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.08),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Оптовый',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1D293A),
                        fontFamily: 'Inter',
                      ),
                    ),
                    Switch(
                      value: isWholesaleSelected,
                      onChanged: _handleWholesaleSwitch,
                      activeColor: Colors.white,
                      inactiveThumbColor: Colors.white,
                      activeTrackColor: const Color(0xFF1D293A),
                      inactiveTrackColor: const Color(0xFFA4ACB6),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: height * 0.02),

            // Розничный (Retail)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.08),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Розничный',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1D293A),
                        fontFamily: 'Inter',
                      ),
                    ),
                    Switch(
                      value: isRetailSelected,
                      onChanged: _handleRetailSwitch,
                      activeColor: Colors.white,
                      inactiveThumbColor: Colors.white,
                      activeTrackColor: const Color(0xFF1D293A),
                      inactiveTrackColor: const Color(0xFFA4ACB6),
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),

            // Continue Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.08),
              child: ElevatedButton(
                onPressed: isButtonEnabled
                    ? () {
                        if (isWholesaleSelected) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FourthComponentWidget(
                                hasShop: widget.hasShop,
                              ),
                            ),
                          );
                        } else if (isRetailSelected) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ThirdComponent(
                                hasShop: widget.hasShop,
                              ),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NameDetailsScreen(),
                            ),
                          );
                        }
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isButtonEnabled
                      ? const Color(0xFF1D293A)
                      : const Color(0xFFA4ACB6),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(195, 52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: const Text(
                  'Продолжить',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            SizedBox(height: height * 0.03),
          ],
        ),
      ),
    );
  }
}
