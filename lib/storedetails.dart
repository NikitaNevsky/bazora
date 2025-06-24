import 'package:flutter/material.dart';
import 'features/auth/presentation/choose_country/choosecountry.dart';

class StoreDetailsScreen extends StatefulWidget {
  const StoreDetailsScreen({super.key});

  @override
  State<StoreDetailsScreen> createState() => _StoreDetailsScreenState();
}

class _StoreDetailsScreenState extends State<StoreDetailsScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController innController = TextEditingController();

  bool isButtonEnabled() {
    return nameController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        innController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final padding = screenWidth * 0.05;

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
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
                            const Center(
                              child: Text(
                                'BAZORA',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 30,
                              left: 10,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.chevron_left,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        'Укажите данные вашего магазина',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 30),

                      // Form Fields
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: padding),
                        child: Column(
                          children: [
                            _buildTextField(nameController, 'Название'),
                            const SizedBox(height: 20),
                            _buildTextField(addressController, 'Адрес'),
                            const SizedBox(height: 20),
                            _buildTextField(
                                phoneController, 'Контактный номер'),
                            const SizedBox(height: 20),
                            _buildTextField(
                                innController, 'ИНН юридического лица'),
                          ],
                        ),
                      ),

                      // This expanded will push the button to the bottom
                      const Expanded(
                        child: SizedBox(),
                      ),

                      // Continue Button
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 30,
                          left: 20,
                          right: 20,
                        ),
                        child: ElevatedButton(
                          onPressed: isButtonEnabled()
                              ? () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ChooseCountryScreen(),
                                    ),
                                  );
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(195, 52),
                            backgroundColor: isButtonEnabled()
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
                              fontFamily: 'Inter',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          fontFamily: 'Inter',
          fontSize: 16,
          color: Color(0xFFA4ACB6),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      onChanged: (_) => setState(() {}),
    );
  }
}
