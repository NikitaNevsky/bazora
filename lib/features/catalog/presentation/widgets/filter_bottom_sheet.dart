import "dart:async";
import "dart:math" as math;

import "package:bazora/core/utils/app_colors.dart";
import "package:bazora/core/utils/utils.dart";
import "package:flutter/material.dart";


class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterBottomSheet> {
  RangeValues _priceRangeValues = const RangeValues(0, 50000);
  final double _maxPrice = 200000;
  final List<String> _categoryImages = [
    'assets/imagess/category1.jpeg.png',
    'assets/imagess/category2.jpeg.png',
    'assets/imagess/category3.jpeg.png',
  ];
  final List<String> _randomImages = [
    'assets/imagess/random1.png',
    'assets/imagess/random2.png',
  ];

  final List<Map<String, String>> _categories = [];
  int? _selectedCategory;

  final List<String> _sortOptions = [
    'Дешевле', 'Дороже', 'С высоким рейтингом'
  ];
  final Set<String> _selectedSortOptions = {};

  @override
  void initState() {
    super.initState();
    // Russian store category names
    final List<String> russianCategories = [
      'Электроника', 'Одежда', 'Обувь',
      'Дом и сад', 'Красота', 'Детские товары',
      'Продукты', 'Авто', 'Книги',
      'Игрушки', 'Спорт', 'Зоотовары',
    ];
    // Initialize categories with Russian names and random imagess
    _categories.clear();
    _categories.addAll(
      List.generate(
        12,
            (index) => {
          'name': russianCategories[index],
          'image': math.Random().nextBool()
              ? _randomImages[math.Random().nextInt(_randomImages.length)]
              : _categoryImages[math.Random().nextInt(_categoryImages.length)],
        },
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 100),
        // Header
        // Padding(
        //   padding: EdgeInsets.all(isTablet ? 32 : 16),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.end,
        //     children: [
        //       const Spacer(),
        //     ],
        //   ),
        // ),

        Flexible(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32))
            ),
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: isTablet ? 32 : 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 45,
                      height: 5,
                      margin: const EdgeInsets.only(top: 10),
                      decoration: const BoxDecoration(
                        color: Color(0xffDFE5ED),
                        borderRadius: AppUtils.kBorderRadius12
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: isTablet ? 32 : 18, bottom: isTablet ? 16 : 10),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Фильтры',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1D293A),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _buildSectionTitle('Категория товаров', isTablet),
                  _buildCategoryGrid(isTablet),
                  _buildFiltersContent(isTablet),
                  // Цена section in its own white container
                  Container(
                    width: double.infinity,

                    margin: EdgeInsets.only(top: isTablet ? 6 : 3, bottom: isTablet ? 6 : 3),
                    padding: EdgeInsets.all(isTablet ? 12.8 : 8), // Reduced by 20%
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(23),
                      border: Border.all(
                        color: Color(0xFFE3E3E3),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildSectionTitle('Цена', isTablet),
                            Row(
                              children: [
                                const Text('от', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Color(0xFF1D293A))),
                                SizedBox(width: 8),
                                Container(
                                  width: 80,
                                  height: isTablet ? 25 : 19,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                      color: Color(0xFFE3E3E3),
                                      width: 1.1,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Text(
                                    '', // Placeholder for value
                                    style: TextStyle(fontSize: 15, color: Color(0xFF1D293A)),
                                  ),
                                ),
                                SizedBox(width: 12),
                                const Text('до', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Color(0xFF1D293A))),
                                SizedBox(width: 8),
                                Container(
                                  width: 76,
                                  height: isTablet ? 25 : 19,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                      color: Color(0xFFE3E3E3),
                                      width: 1.1,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Text(
                                    '', // Placeholder for value
                                    style: TextStyle(fontSize: 15, color: Color(0xFF1D293A)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: isTablet ? 9.6 : 6.4), // Reduced by 20%
                        _buildPriceSlider(isTablet),
                      ],
                    ),
                  ),
                  // Buttons
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: isTablet ? 36 : 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildActionButton('Сбросить', Colors.white, const Color(0xFF1D293A), () {
                          setState(() {
                            _selectedSortOptions.clear();
                            _priceRangeValues = const RangeValues(0, 50000);
                          });
                          Navigator.pushNamed(context, '/catalog');
                        }, isTablet),
                        _buildActionButton('Применить', const Color(0xFF1D293A), Colors.white, () {
                          Navigator.pushNamed(context, '/catalog');
                        }, isTablet),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title, bool isTablet) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: isTablet ? 18 : 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: isTablet ? 22 : 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildCategoryGrid(bool isTablet) {
    return Container(
      padding: EdgeInsets.all(isTablet ? 24 : 12),
      margin: EdgeInsets.symmetric(vertical: isTablet ? 16 : 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(isTablet ? 24 : 12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1,
        ),
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedCategory = index;
              });
            },
            child: Container(
              width: 108,
              height: 108,
              decoration: BoxDecoration(
                color: _selectedCategory == index
                    ? const Color(0xFF1D293A).withOpacity(0.1)
                    : const Color(0xFFF1F1F1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: _selectedCategory == index
                      ? const Color(0xFF1D293A)
                      : const Color(0xFFE3E3E3),
                  width: 1,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_categories[index]['image'] != null)
                    Image.asset(
                      _categories[index]['image']!,
                      width: 48,
                      height: 48,
                      fit: BoxFit.contain,
                    ),
                  const SizedBox(height: 8),
                  Text(
                    _categories[index]['name'] ?? 'Category',
                    style: const TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF1D293A),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFiltersContent(bool isTablet) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Товары section in its own white container
        Container(
          padding: EdgeInsets.symmetric(vertical: isTablet ? 8 : 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(23),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: isTablet ? 16 : 8, bottom: isTablet ? 4 : 2),
                  child: const Text(
                    'Товары',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                _buildChipsGrid(isTablet),
              ],
            ),
          ),
        ),
        SizedBox(height: isTablet ? 20 : 12),
        // Сортировка section in its own white container
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 0, vertical: isTablet ? 8 : 4),
          padding: EdgeInsets.all(isTablet ? 16 : 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(23),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Сортировка', isTablet),
              _buildSortOptions(isTablet),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildChipsGrid(bool isTablet) {
    final chips = [
      // Row 1: same icon/text
      {'label': 'Телефоны', 'icon': Icons.smartphone},
      {'label': 'Телефоны', 'icon': Icons.smartphone},
      {'label': 'Телефоны', 'icon': Icons.smartphone},
      // Row 2: same icon/text
      {'label': 'Планшеты', 'icon': Icons.tablet_mac},
      {'label': 'Планшеты', 'icon': Icons.tablet_mac},
      {'label': 'Планшеты', 'icon': Icons.tablet_mac},
      // Row 3: just 1 product chip
      {'label': 'Компьютеры', 'icon': Icons.computer},
      {},
      {},
    ];
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      crossAxisSpacing: isTablet ? 8 : 4,
      mainAxisSpacing: isTablet ? 8 : 4,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: isTablet ? 2.8 : 2.3, // Make height smaller so chips are closer to text
      children: chips.map((chip) {
        if (chip.isEmpty) {
          // Empty spot in grid
          return const SizedBox.shrink();
        }
        return Container(
          decoration: BoxDecoration(
            color: const Color(0xFFDFE5ED),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(horizontal: isTablet ? 8 : 4, vertical: isTablet ? 8 : 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(chip['icon'] as IconData, color: Color(0xFF1D293A), size: isTablet ? 22 : 16),
              SizedBox(width: 4),
              Flexible(child: Text(chip['label'] as String, style: TextStyle(fontSize: isTablet ? 14 : 11))),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSortOptions(bool isTablet) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildCheckboxOption(_sortOptions[0], isTablet),
            _buildCheckboxOption(_sortOptions[2], isTablet),
          ],
        ),
        SizedBox(height: isTablet ? 16 : 8),
        _buildCheckboxOption(_sortOptions[1], isTablet),
      ],
    );
  }

  Widget _buildCheckboxOption(String option, bool isTablet) {
    double baseSize = isTablet ? 32 : 24;
    double checkboxSize = baseSize * 1.1; // 20% bigger
    return InkWell(
      onTap: () {
        setState(() {
          if (_selectedSortOptions.contains(option)) {
            _selectedSortOptions.remove(option);
          } else {
            _selectedSortOptions.add(option);
          }
        });
      },
      child: Row(
        children: [
          Transform.scale(
            scale: 1.0,
            child: SizedBox(
              width: checkboxSize,
              height: checkboxSize,
              child: Checkbox(
                value: _selectedSortOptions.contains(option),
                onChanged: (bool? value) {
                  setState(() {
                    if (value == true) {
                      _selectedSortOptions.add(option);
                    } else {
                      _selectedSortOptions.remove(option);
                    }
                  });
                },
                activeColor: const Color(0xFF1D293A),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                  side: BorderSide(
                    color: Color(0xFFE3E3E3),
                    width: 1.1,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: 23,
            decoration: BoxDecoration(
              color: const Color(0xFFDFE5ED),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                option,
                style: TextStyle(
                  fontSize: isTablet ? 14 : 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceSlider(bool isTablet) {
    return Column(
      children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            thumbColor: Colors.white,
            overlayColor: Colors.white.withOpacity(0.16),
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 13),
            trackHeight: 4,
            activeTrackColor: const Color(0xFF1D293A),
            inactiveTrackColor: Colors.white,
          ),
          child: RangeSlider(
            values: _priceRangeValues,
            min: 0,
            max: _maxPrice,
            onChanged: (RangeValues values) {
              setState(() {
                _priceRangeValues = RangeValues(
                  values.start.round().toDouble(),
                  values.end.round().toDouble(),
                );
              });
            },
            activeColor: const Color(0xFF1D293A),
            inactiveColor: Colors.white,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${_priceRangeValues.start.round()}₽',
                style: TextStyle(color: const Color(0xFFA4ACB6), fontSize: 14)),
            Text('${_priceRangeValues.end.round()}₽',
                style: TextStyle(color: const Color(0xFFA4ACB6), fontSize: 14)),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButton(String text, Color bgColor, Color textColor, VoidCallback onPressed, bool isTablet) {
    return SizedBox(
      width: isTablet ? 220 : 150,
      height: isTablet ? 68 : 52,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: textColor,
          side: BorderSide(color: textColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(isTablet ? 32 : 18),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: isTablet ? 18 : 14,
          ),
        ),
      ),
    );
  }
}