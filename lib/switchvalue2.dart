import 'package:bazora/core/utils/app_colors.dart';
import 'package:bazora/core/utils/utils.dart';
import 'package:bazora/core/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'namedetails.dart'; // Import the NameDetailsScreen
import 'thirdcomponent.dart'; // Import the ThirdComponent screen
import 'fourthcomponent.dart'; // Import the FourthComponent screen
// Import the hasShopProvider

class SwitchValueScreen2 extends ConsumerStatefulWidget {
  final bool hasShop;

  const SwitchValueScreen2({
    super.key,
    required this.hasShop,
  });

  @override
  ConsumerState<SwitchValueScreen2> createState() => _SwitchValueScreenState2();
}

class _SwitchValueScreenState2 extends ConsumerState<SwitchValueScreen2> {
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
      appBar: AppBar(
        title: Text(
          'Формат закупки',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: AppColors.baseColor,
        leading: BackButton(color: AppColors.white,),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              height: 30,
              decoration: const BoxDecoration(
                color: Color(0xFF1D293A),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(23),
                ),
              ),
            ),

            SizedBox(height: height * 0.05),

            const Text(
              'Выберите формат закупки',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),

            SizedBox(height: height * 0.04),

            Padding(
              padding: EdgeInsets.only(left: width * 0.08),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: const Text(
                      'для магазина',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF1D293A),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    height: 30,
                    width: 125,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1D293A),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButton<String>(
                      value: isWholesaleSelected ? 'Оптовик' : 'Розничный',
                      dropdownColor: const Color(0xFF1D293A),
                      items: const [
                        DropdownMenuItem(
                          value: 'Оптовик',
                          child: Text(
                            'Оптовик',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'Розничный',
                          child: Text(
                            'Розничный',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                      onChanged: (String? newValue) {
                        if (newValue == 'Оптовик') {
                          _handleWholesaleSwitch(true);
                        } else {
                          _handleRetailSwitch(true);
                        }
                      },
                      icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
                      style: const TextStyle(color: Colors.white),
                      underline: Container(),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: height * 0.04),

            // Оптовый (Wholesale)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.08),
              child: Container(
                height: 40,
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
                height : 40,
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
            CustomButton(
              width: 200,
              onPressed: isButtonEnabled
                  ? () {
                    // if (isWholesaleSelected) {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => FourthComponentWidget(
                    //         hasShop: widget.hasShop,
                    //       ),
                    //     ),
                    //   );
                    // } else if (isRetailSelected) {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => ThirdComponent(
                    //         hasShop: widget.hasShop,
                    //       ),
                    //     ),
                    //   );
                    // } else {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => const NameDetailsScreen(),
                    //     ),
                    //   );
                    // }
                  }
                  : null,
              shadowEnabled: false,
              borderRadius: AppUtils.kBorderRadius18,
              backgroundColor:isButtonEnabled
                  ? const Color(0xFF1D293A)
                  : const Color(0xFFA4ACB6),
              label: const Text(
                'Сохранить',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
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
