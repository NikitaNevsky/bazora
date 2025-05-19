import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class EditingStorePage extends StatelessWidget {
  const EditingStorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;
    final horizontalPadding = isTablet ? 32.0 : 24.0;
    final verticalPadding = isTablet ? 32.0 : 24.0;
    final headerFontSize = isTablet ? 22.0 : 16.0;
    final inputFontSize = isTablet ? 20.0 : 15.0;
    final buttonFontSize = isTablet ? 20.0 : 16.0;
    final actionFontSize = isTablet ? 18.0 : 15.0;
    final iconSize = isTablet ? 28.0 : 18.0;
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 145,
              decoration: const BoxDecoration(
                color: Color(0xFF1D293A),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(24),
                ),
              ),
              padding: EdgeInsets.only(
                left: horizontalPadding,
                right: horizontalPadding,
                top: verticalPadding,
                bottom: verticalPadding * 0.66,
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: iconSize),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  const Spacer(),
                  Text(
                    'Редактирование магазина',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: constraints.maxHeight),
                      child: IntrinsicHeight(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: verticalPadding),
                              child: Center(
                                child: Text(
                                  'Укажите данные магазина',
                                  style: TextStyle(
                                    color: const Color(0xFF1D293A),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 0),
                            // Input fields
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                              child: Column(
                                children: [
                                  TextFormField(
                                    initialValue: 'Оптовик',
                                    style: TextStyle(fontSize: inputFontSize),
                                    decoration: _inputDecoration(inputFontSize),
                                  ),
                                  SizedBox(height: isTablet ? 24 : 7),
                                  TextFormField(
                                    initialValue: 'Москва, Лесная 45',
                                    style: TextStyle(fontSize: inputFontSize),
                                    decoration: _inputDecoration(inputFontSize),
                                  ),
                                  SizedBox(height: isTablet ? 24 : 7),
                                  TextFormField(
                                    initialValue: '+375 44 390 50 48',
                                    style: TextStyle(fontSize: inputFontSize),
                                    decoration: _inputDecoration(inputFontSize),
                                  ),
                                  SizedBox(height: isTablet ? 20 : 7),
                                  TextFormField(
                                    initialValue: '7727563778',
                                    style: TextStyle(fontSize: inputFontSize),
                                    decoration: _inputDecoration(inputFontSize),
                                  ),
                                  
                                  
                                ],
                              ),
                            ),
                            const Spacer(),
                            // Save Button
                            Padding(
                              padding: EdgeInsets.only(
                                left: horizontalPadding,
                                right: horizontalPadding,
                                top: verticalPadding,
                                bottom: 30,
                              ),
                              child: Center(
                                child: SizedBox(
                                  width: 196,
                                  height: isTablet ? 60 : 48,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: const Color(0xFF1D293A),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                    ),
                                    onPressed: () {
                                      // Add your save logic here
                                    },
                                    child: Text(
                                      'Сохранить',
                                      style: TextStyle(
                                        fontSize: buttonFontSize, 
                                        fontWeight: FontWeight.w600, 
                                        color: Colors.white
                                      ),
                                    ),
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
          ],
        ),
      ),
    );
  }
}

InputDecoration _inputDecoration([double fontSize = 15]) {
  return InputDecoration(
    filled: true,
    fillColor: Colors.white,
    contentPadding: EdgeInsets.symmetric(
      horizontal: fontSize, 
      vertical: fontSize * 0.8
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: const BorderSide(color: Color(0xFF1D293A)),
    ),
  );
}

class _ProfileAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final double fontSize;
  final double iconSize;
  final Color? iconColor;
  final Color? textColor;
  
  const _ProfileAction({
    required this.icon, 
    required this.label, 
    this.fontSize = 15, 
    this.iconSize = 18, 
    this.iconColor, 
    this.textColor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: ListTile(
        leading: Icon(
          icon, 
          color: iconColor ?? const Color(0xFF1D293A), 
          size: iconSize
        ),
        title: Text(
          label,
          style: TextStyle(
            fontSize: fontSize, 
            fontWeight: FontWeight.w500, 
            color: textColor
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
