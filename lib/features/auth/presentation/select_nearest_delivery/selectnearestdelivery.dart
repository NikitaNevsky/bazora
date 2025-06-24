library bazora.selectnearestdelivery;
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../../../seeyourstores.dart';

class SelectNearestDelivery extends StatefulWidget {
  const SelectNearestDelivery({super.key});

  @override
  State<SelectNearestDelivery> createState() => _SelectNearestDeliveryState();
}

class _SelectNearestDeliveryState extends State<SelectNearestDelivery> {
  String? selectedCountry;
  int? selectedWarehouseIndex;

  final List<String> countries = [
    'Китай',
    'Индия',
    'Япония',
    'Южная Корея',
    'Казахстан',
    'Узбекистан',
    'Таджикистан',
    'Туркменистан',
    'Афганистан',
    'Пакистан',
    'Россия',
    'Германия',
    'Франция',
    'Италия',
    'Испания',
    'Польша',
    'Нидерланды',
    'Швеция',
    'Норвегия',
    'Финляндия',
    'США',
    'Канада',
    'Мексика',
    'Бразилия',
    'Аргентина',
    'Чили',
    'Колумбия',
    'Перу',
    'Венесуэла'
  ];

  final List<Map<String, String>> warehouses = [
    {
      'name': 'Склад № 1',
      'address': 'Москва, Куйбышева 120',
      'hours': '09:00-20:00'
    },
    {
      'name': 'Склад № 2',
      'address': 'Москва, Ленина 45',
      'hours': '08:00-19:00'
    },
    {
      'name': 'Склад № 3',
      'address': 'Москва, Гагарина 15',
      'hours': '10:00-21:00'
    },
    {
      'name': 'Склад № 4',
      'address': 'Москва, Пушкина 33',
      'hours': '09:30-20:30'
    },
    {
      'name': 'Склад № 5',
      'address': 'Москва, Толстого 12',
      'hours': '08:30-19:30'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header section with back button and title in a Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(
                    child: Text(
                      'Выберите ближайший склад выдачи',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1D293A),
                      ),
                      softWrap: true,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),

            // Main content area with scrolling
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    // Country dropdown
                    Container(
                      height: 44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color(0xFFA4ACB6)),
                      ),
                      child: Theme(
                        data: ThemeData(
                          canvasColor: Colors.white, // Background of dropdown
                        ),
                        child: DropdownButton<String>(
                          icon: Padding(
                            padding: const EdgeInsets.only(left: 7),
                            child: const Icon(IconlyLight.arrowDown2,
                                color: Color(0xFF1D293A)),
                          ),
                          isExpanded: true,
                          value: selectedCountry,
                          hint: const Padding(
                            padding: EdgeInsets.only(left: 12),
                            child: Text('Россия'),
                          ),
                          items: countries.map((String country) {
                            return DropdownMenuItem<String>(
                              value: country,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Text(
                                  country,
                                  style: const TextStyle(
                                    color: Color(0xFF1D293A),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) =>
                              setState(() => selectedCountry = value),
                          underline: const SizedBox(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Warehouses list
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: warehouses.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final warehouse = warehouses[index];
                        final isSelected = selectedWarehouseIndex == index;

                        return GestureDetector(
                          onTap: () =>
                              setState(() => selectedWarehouseIndex = index),
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFF1D293A)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: const Color(0xFFA4ACB6),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  warehouse['name']!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: isSelected
                                        ? Colors.white
                                        : const Color(0xFF1D293A),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        warehouse['address']!,
                                        style: TextStyle(
                                          color: isSelected
                                              ? Colors.white
                                              : const Color(0xFF1D293A),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      warehouse['hours']!,
                                      style: TextStyle(
                                        color: isSelected
                                            ? const Color(0xFFECE3E3)
                                            : const Color(0xFFA4ACB6),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Continue button (fixed at bottom)
            Padding(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: selectedWarehouseIndex != null
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SeeYourStores()),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1D293A),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Продолжить',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
