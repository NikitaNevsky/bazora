import 'package:bazora/core/utils/app_colors.dart';
import 'package:bazora/core/widgets/buttons/custom_button.dart';
import 'package:bazora/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:go_router/go_router.dart';
import '../select_nearest_delivery/selectnearestdelivery.dart'; // Make sure this import path is correct

class ChooseCountryScreen extends StatefulWidget {
  const ChooseCountryScreen({super.key});

  @override
  State<ChooseCountryScreen> createState() => _ChooseCountryScreenState();
}

class _ChooseCountryScreenState extends State<ChooseCountryScreen> {
  String? selectedCountry;

  final List<String> countries = [
    // Азия
    'Китай', 'Индия', 'Япония', 'Южная Корея', 'Казахстан', 'Узбекистан',
    'Таджикистан', 'Туркменистан', 'Афганистан', 'Пакистан',
    // Европа
    'Россия', 'Германия', 'Франция', 'Италия', 'Испания', 'Польша',
    'Нидерланды', 'Швеция', 'Норвегия', 'Финляндия',
    // Америка
    'США', 'Канада', 'Мексика', 'Бразилия', 'Аргентина', 'Чили', 'Колумбия',
    'Перу', 'Венесуэла'
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        leading: const BackButton(color: AppColors.white),
        backgroundColor: const Color(0xFF1D293A),
      ),
      body: SafeArea(
        child: Column(
          children: [
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
            SizedBox(height: screenHeight * 0.03),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
              child: const Text(
                'Выберите страну для вашего магазина',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                softWrap: true,
                maxLines: 2,
              ),
            ),
            SizedBox(height: screenHeight * 0.04),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.01),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        icon: const Icon(IconlyLight.arrowDown2, color: Color(0xFF1D293A)),
                        isExpanded: true,
                        value: selectedCountry,
                        hint: const Text('Страна'),
                        dropdownColor: Colors.white,
                        items: countries.map((String country) {
                          return DropdownMenuItem<String>(
                            value: country,
                            child: Text(
                              country,
                              style: const TextStyle(
                                color: Color(0xFF1D293A),
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedCountry = value;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.only(bottom: screenHeight * 0.04),
            //   child: ElevatedButton(
            //     onPressed: selectedCountry != null
            //         ? () {
            //             Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                 builder: (context) => const SelectNearestDelivery(),
            //               ),
            //             );
            //           }
            //         : null,
            //     style: ElevatedButton.styleFrom(
            //       minimumSize: const Size(195, 52),
            //       backgroundColor: selectedCountry != null
            //           ? const Color(0xFF1D293A)
            //           : const Color(0xFFA4ACB6),
            //       foregroundColor: Colors.white,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(18),
            //       ),
            //     ),
            //     child: const Text(
            //       'Продолжить',
            //       style: TextStyle(
            //         fontSize: 18,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 100, right: 100, bottom: 40),
        child: CustomButton(
          width: 200,
          shadowEnabled: false,
          onPressed: () async {
            // context.pushNamed(Routes.selectNearestDelivery);
          },
          borderRadius: BorderRadius.circular(18),
          backgroundColor: selectedCountry != null
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
