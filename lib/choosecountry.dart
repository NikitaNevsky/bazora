import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'selectnearestdelivery.dart'; // Make sure this import path is correct

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
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 197,
              width: screenWidth,
              decoration: const BoxDecoration(
                color: Color(0xFF1D293A),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(23),
                ),
              ),
              child: Stack(
                children: [
                  const Center(
                    child: Text(
                      'BAZORA',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    top: screenHeight * 0.03,
                    left: 10,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 24,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
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
                        hint: const Text('страну'),
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
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.04),
              child: ElevatedButton(
                onPressed: selectedCountry != null
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SelectNearestDelivery(),
                          ),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(195, 52),
                  backgroundColor: selectedCountry != null
                      ? const Color(0xFF1D293A)
                      : const Color(0xFFA4ACB6),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: const Text(
                  'Продолжить',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
