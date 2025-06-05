import 'package:bazora/core/utils/utils.dart';
import 'package:bazora/core/widgets/buttons/custom_button.dart';
import 'package:bazora/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'features/profile/presentation/my_profile_page.dart';
import 'package:iconly/iconly.dart';
import 'logout_confirmation_page.dart';
import 'logout_confirmation2.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;
    final fullWidth = size.width;
    final horizontalPadding = isTablet ? 32.0 : 24.0;
    final verticalPadding = isTablet ? 32.0 : 24.0;
    final avatarRadius = isTablet ? 60.0 : 40.0;
    final headerFontSize = isTablet ? 22.0 : 16.0;
    final inputFontSize = isTablet ? 20.0 : 15.0;
    final buttonFontSize = isTablet ? 20.0 : 16.0;
    final actionFontSize = isTablet ? 18.0 : 15.0;
    final iconSize = isTablet ? 28.0 : 18.0;

    final baseWidth = fullWidth * 0.80;
    final extendedWidth = baseWidth * 1.10;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        toolbarHeight: 145,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(23),
            bottomRight: Radius.circular(23),
          ),
        ),
        backgroundColor: const Color(0xFF1D293A),
        title: const Text(
          'Редактирование профиля',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: verticalPadding),
                    // Profile Image
                    CircleAvatar(
                      radius: avatarRadius,
                      backgroundImage: const AssetImage(
                          'assets/imagess/profile picture.png'),
                    ),
                    SizedBox(height: verticalPadding),

                    // Input fields
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        initialValue: 'Артем',
                        style: TextStyle(fontSize: inputFontSize),
                        decoration: _inputDecoration(inputFontSize),
                      ),
                    ),
                    SizedBox(height: isTablet ? 24 : 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        initialValue: 'Филатов',
                        style: TextStyle(fontSize: inputFontSize),
                        decoration: _inputDecoration(inputFontSize),
                      ),
                    ),
                    SizedBox(height: isTablet ? 24 : 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                          initialValue: '11.12.2001',
                          style: TextStyle(fontSize: inputFontSize),
                          decoration: _inputDecoration(inputFontSize),
                        ),
                    ),
                    SizedBox(height: isTablet ? 32 : 24),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: CustomButton(
                          borderRadius: AppUtils.kBorderRadius18,
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        height: 44,
                        width: double.infinity,
                          backgroundColor: Colors.white,
                          shadowEnabled: false,
                          label: Row(
                            children: [
                              Text(
                                "Выйти из аккаунта",
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                          onPressed: () async {
                            final shouldLogout = await showDialog<bool>(
                              context: context,
                              builder: (context) => Center(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 20),
                                  child: const Material(
                                    color: Colors.transparent,
                                    child: LogoutConfirmationSheet(),
                                  ),
                                ),
                              ),
                            );
                            if (shouldLogout == true) {
                              // Handle logout
                              localSource.box.clear();
                              context.goNamed(Routes.auth);
                            }
                          }
                      ),
                    ),
                    SizedBox(height: 7),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: CustomButton(
                          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                          height: 44,
                          width: double.infinity,
                          backgroundColor: Colors.white,
                          shadowEnabled: false,
                          borderRadius: AppUtils.kBorderRadius18,
                          label: Row(
                            children: [
                              Text(
                                "Удалить аккаунт",
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                          onPressed: () async {
                            final shouldLogout = await showDialog<bool>(
                              context: context,
                              builder: (context) => Center(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 20),
                                  child: const Material(
                                    color: Colors.transparent,
                                    child: LogoutConfirmation2(),
                                  ),
                                ),
                              ),
                            );
                            if (shouldLogout == true) {
                              // Handle logout
                            }
                          }
                      ),
                    ),

                    SizedBox(height: verticalPadding),

                    // Save Button (10% wider)
                    Center(
                      child: Container(
                        width: extendedWidth,
                        height: 44, // Fixed height of 44px
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Material(
                          color: const Color(0xFF1D293A),
                          borderRadius: BorderRadius.circular(18),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(18),
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            child: Container(
                              height: 44,
                              alignment: Alignment.center,
                              child: Text(
                                'Сохранить',
                                style: TextStyle(
                                  fontSize: buttonFontSize,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  InputDecoration _inputDecoration([double fontSize = 15]) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      isDense: true,
      contentPadding: EdgeInsets.symmetric(
        horizontal: fontSize,
        vertical: fontSize * 0.8,
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
  final VoidCallback? onTap;

  const _ProfileAction({
    this.onTap,
    required this.icon,
    required this.label,
    this.fontSize = 15,
    this.iconSize = 18,
    this.iconColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.transparent,
            width: 1,
          ),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: onTap,
          child: SizedBox(
            height: 44, // Fixed height of 44px
            child: Center(
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                dense: true,
                visualDensity: const VisualDensity(vertical: -2),
                leading: Icon(
                  icon,
                  color: iconColor ?? const Color(0xFF1D293A),
                  size: iconSize,
                ),
                title: Text(
                  label,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w500,
                    color: textColor ?? const Color(0xFF1D293A),
                    height: 1.2,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
