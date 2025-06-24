import 'package:bazora/core/utils/app_colors.dart';
import 'package:bazora/core/widgets/buttons/custom_button.dart';
import 'package:bazora/features/others/dialogs/thirdcomponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SwitchValueScreen extends ConsumerStatefulWidget {

  const SwitchValueScreen({super.key});

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
    print('SwitchValueScreen - hasShop value:');

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        leading: const BackButton(color: AppColors.white),
        backgroundColor: const Color(0xFF1D293A),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.only(bottom: 38),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.baseColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(23),
                  bottomRight: Radius.circular(23),
                ),
              ),
              child: const Center(
                child: Text(
                  'BAZORA',
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                  ),
                ),
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
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: width * 0.08),
            //   child: ElevatedButton(
            //     onPressed: isButtonEnabled
            //         ? () {
            //             if (isWholesaleSelected) {
            //               showDialog(
            //                 context: context,
            //                 builder: (context) => Dialog(
            //                   backgroundColor: Colors.transparent,
            //                   insetPadding: const EdgeInsets.symmetric(horizontal: 24),
            //                   child: FourthComponentWidget(
            //                     hasShop: widget.hasShop,
            //                   ),
            //                 ),
            //               );
            //             } else if (isRetailSelected) {
            //               showDialog(
            //                 context: context,
            //                 builder: (context) => Dialog(
            //                   backgroundColor: Colors.transparent,
            //                   insetPadding: const EdgeInsets.symmetric(horizontal: 24),
            //                   child: ThirdComponent(
            //                     hasShop: widget.hasShop,
            //                   ),
            //                 ),
            //               );
            //             } else {
            //               Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                   builder: (context) => const NameDetailsScreen(),
            //                 ),
            //               );
            //             }
            //           }
            //         : null,
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: isButtonEnabled
            //           ? const Color(0xFF1D293A)
            //           : const Color(0xFFA4ACB6),
            //       foregroundColor: Colors.white,
            //       minimumSize: const Size(195, 52),
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(18),
            //       ),
            //     ),
            //     child: const Text(
            //       'Продолжить',
            //       style: TextStyle(
            //         fontSize: 18,
            //         fontWeight: FontWeight.w600,
            //         color: Colors.white,
            //       ),
            //     ),
            //   ),
            // ),

          ],
        ),
      ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 100, right: 100, bottom: 40),
          child: CustomButton(
            width: 200,
            shadowEnabled: false,
            onPressed: () async {
              await showDialog<void>(barrierDismissible: false, context: context, builder: (_) => const ThirdComponent());
            },
            borderRadius: BorderRadius.circular(18),
            backgroundColor: isButtonEnabled
                ? const Color(0xFF1D293A)
                : const Color(0xFF101828).withOpacity(0.2),
            label: const Text(
              'Продолжить',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
    );
  }
}
