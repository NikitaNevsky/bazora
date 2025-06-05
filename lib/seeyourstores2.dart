import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:iconly/iconly.dart';
import 'features/catalog/presentation/catalogpage.dart'; // Import CatalogPage
import 'storedetails.dart'; // Import StoreDetailsPage

class SeeYourStores2 extends StatefulWidget {
  const SeeYourStores2({super.key});

  @override
  State<SeeYourStores2> createState() => _SeeYourStores2State();
}

class _SeeYourStores2State extends State<SeeYourStores2> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: Column(
          children: [
            // Responsive header
            Container(
              height: 145,
              decoration: const BoxDecoration(
                color: Color(0xFF1D293A),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(23)),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: screenHeight * 0.076,  // Moved down 15px
                    left: screenWidth * 0.05,
                    child: IconButton(
                      icon: const Icon(CupertinoIcons.back,
                          color: Colors.white, size: 20),  // Reduced size by 30% from default 28px
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'Мои магазины',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                ],
              ),
            ),

            // Add store button
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.02),
              child: Center(
                child: GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StoreDetailsScreen(),
                    ),
                  ),
                  child: Container(
                    width: 195,
                    height: screenHeight * 0.045,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1D293A),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Добавить магазин',
                          style: TextStyle(
                            color: Color(0xFFEFF2F6),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(IconlyLight.plus,
                              color: Colors.grey, size: 20),
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const StoreDetailsScreen(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            
            // Stores list
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildStoreCard(context, 'Магазин №1'),
                    _buildStoreCard(context, 'Магазин №2'),
                  ],
                ),
              ),
            ),

            // Continue button
            Padding(
              padding: EdgeInsets.only(bottom: 20, top: 10),
              child: SizedBox(
                width: 196,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1D293A),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CatalogPage(),
                    ),
                  ),
                  child: const Text(
                    'Продолжить',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
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

  Widget _buildStoreCard(BuildContext context, String storeName) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Container(
        width: screenWidth,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(23),
        ),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.02),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFFAFAFA),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                // Store header with edit/delete
                Padding(
                  padding: EdgeInsets.all(screenWidth * 0.03),
                  child: Row(
                    children: [
                      Text(
                        storeName,
                        style: const TextStyle(
                          color: Color(0xFF1D293A),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(IconlyBold.edit,
                            color: Color(0xFFA4ACB6), size: 20),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const StoreDetailsScreen()),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(IconlyLight.delete,
                            color: Color(0xFFA4ACB6), size: 20),
                        onPressed: () => _deleteStore(storeName),
                      ),
                    ],
                  ),
                ),

                // Store details sections
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Название и контакты with journal icon
                      Row(
                        children: [
                          Icon(IconlyLight.document,
                              color: Color(0xFF1D293A), size: 18),
                          SizedBox(width: 8),
                          Text(
                            'Название и контакты',
                            style: TextStyle(
                              color: Color(0xFFA4ACB6),
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 22),
                            child: Text(
                              'Оптовик, Москва, Лесная 45',
                              style: TextStyle(
                                color: Color(0xFF1D293A),
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 26),
                            child: Text(
                              '+375 44 390 50 48, ИНН: 7727563778',
                              style: TextStyle(
                                color: Color(0xFF1D293A),
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Divider(
                        color: Color(0xFFE0E0E0),
                        thickness: 1,
                      ),
                      SizedBox(height: 8),

                      // Ближайший склад выдачи with location icon
                      Row(
                        children: [
                          Icon(IconlyLight.location,
                              color: Color(0xFF1D293A), size: 18),
                          SizedBox(width: 8),
                          Text(
                            'Ближайший склад выдачи',
                            style: TextStyle(
                              color: Color(0xFFA4ACB6),
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Padding(
                        padding: EdgeInsets.only(left: 26),
                        child: Text(
                          'Склад №3, Москва, Лесная 12',
                          style: TextStyle(
                            color: Color(0xFF1D293A),
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Divider(
                        color: Color(0xFFE0E0E0),
                        thickness: 1,
                      ),
                      SizedBox(height: 8),

                      // Формат закупки with cart icon
                      Row(
                        children: [
                          Icon(IconlyLight.buy,
                              color: Color(0xFF1D293A), size: 18),
                          SizedBox(width: 8),
                          Text(
                            'Формат закупки',
                            style: TextStyle(
                              color: Color(0xFFA4ACB6),
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Padding(
                        padding: EdgeInsets.only(left: 26, bottom: 24),
                        child: Text(
                          'Розничный',
                          style: TextStyle(
                            color: Color(0xFF1D293A),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _deleteStore(String storeName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Подтверждение'),
          content: Text('Вы уверены, что хотите удалить $storeName?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Отмена'),
            ),
            TextButton(
              onPressed: () {
                // Perform deletion here
                Navigator.of(context).pop();
              },
              child: const Text('Удалить'),
            ),
          ],
        );
      },
    );
  }
}
