import 'package:bazora/core/utils/app_colors.dart';
import 'package:bazora/core/widgets/buttons/custom_button.dart';
import 'package:bazora/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/inputs/custom_text_field.dart';

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
      appBar: AppBar(
        leading: const BackButton(color: AppColors.white),
        backgroundColor: const Color(0xFF1D293A),
      ),
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
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 34),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          'Укажите данные вашего магазина',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Form Fields
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: padding),
                        child: Column(
                          children: [
                            _buildTextField(nameController, 'Название'),
                            const SizedBox(height: 12),
                            _buildTextField(addressController, 'Адрес'),
                            const SizedBox(height: 12),
                            _buildTextField(phoneController, 'Контактный номер'),
                            const SizedBox(height: 12),
                            _buildTextField(innController, 'ИНН юридического лица'),
                          ],
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 100, right: 100, bottom: 40),
        child: CustomButton(
          width: 200,
          shadowEnabled: false,
          onPressed: () {
            context.pushNamed(Routes.chooseCountryScreen);
          },
          borderRadius: BorderRadius.circular(18),
          backgroundColor: isButtonEnabled()
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

  Widget _buildTextField(TextEditingController controller, String hint) {
    return SizedBox(
      height: 50,
      child: CustomTextField(
        hintText: hint,
        controller: controller,
        onChanged: (value) { setState(() {}); },
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: Color(0xFFA4ACB6)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: Color(0xFF1D293A)),
        ),
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15 * 0.8,
        ),
        cursorColor: AppColors.baseColor,
      ),
    );
  }
}
