import 'package:flutter/material.dart';
import 'neweditprofilepage.dart';
import 'package:iconly/iconly.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;
    final horizontalPadding = isTablet ? 32.0 : 24.0;
    final verticalPadding = isTablet ? 32.0 : 24.0;
    final avatarRadius = isTablet ? 60.0 : 40.0;
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
                    'Редактирование профиля',
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: verticalPadding),
                            // Profile Image
                            Center(
                              child: CircleAvatar(
                                radius: avatarRadius,
                                backgroundImage: const AssetImage('assets/images/profile picture.png'),
                              ),
                            ),
                            SizedBox(height: verticalPadding),
                            // Input fields
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                              child: Column(
                                children: [
                                  TextFormField(
                                    initialValue: 'Артем',
                                    style: TextStyle(fontSize: inputFontSize),
                                    decoration: _inputDecoration(inputFontSize),
                                  ),
                                  SizedBox(height: isTablet ? 24 : 16),
                                  TextFormField(
                                    initialValue: 'Филатов',
                                    style: TextStyle(fontSize: inputFontSize),
                                    decoration: _inputDecoration(inputFontSize),
                                  ),
                                  SizedBox(height: isTablet ? 24 : 16),
                                  TextFormField(
                                    initialValue: '11.12.2001',
                                    style: TextStyle(fontSize: inputFontSize),
                                    decoration: _inputDecoration(inputFontSize),
                                  ),
                                  SizedBox(height: isTablet ? 32 : 24),
                                  // Actions
                                  _ProfileAction(
                                    icon: IconlyLight.logout,
                                    label: 'Выйти из аккаунта',
                                    fontSize: actionFontSize,
                                    iconSize: iconSize,
                                  ),
                                  SizedBox(height: isTablet ? 20 : 12),
                                  _ProfileAction(
                                    icon: IconlyLight.add_user,
                                    label: 'Удалить аккаунт',
                                    fontSize: actionFontSize,
                                    iconSize: iconSize,
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
                                child: Center(
                                  child: SizedBox(
                                    width: 196,
                                    height: isTablet ? 60 : 48,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor: const Color(0xFF1D293A),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                      ),
                                      onPressed: () => Navigator.push(
                                        context, 
                                        MaterialPageRoute(builder: (_) => NewEditProfilePage())
                                      ),
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
        borderRadius: BorderRadius.circular(12),
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