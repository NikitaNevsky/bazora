import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'favouritepage.dart';
import 'listofchats.dart';
import 'new_image_pages/wholesale_page_right.dart';
import 'new_image_pages/orders_list_right.dart';
import 'profilepage.dart';
import 'info1.dart' as info1;
import 'info2.dart' as info2;
import 'switchvalue2.dart';
import 'fourthcomponent.dart';

class NewEditProfilePage extends StatelessWidget {
  const NewEditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header - now 145px height
              Container(
                width: double.infinity,
                height: 145,
                decoration: const BoxDecoration(
                  color: Color(0xFF1D293A),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
                padding: const EdgeInsets.only(
                    top: 24, left: 16, right: 16, bottom: 16),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage(
                          'assets/images/profile picture.png'),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Артем Филатов',
                        style: GoogleFonts.inter(
                          color: const Color(0xFFDFE5ED),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(IconlyLight.edit, color: Colors.white),
                      onPressed: () {
                        Navigator.pushNamed(context, '/profile');
                      },
                    ),
                  ],
                ),
              ),
              // Top Card Row
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(23),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 6,
                        child: AspectRatio(
                          aspectRatio: 1.5,
                          child: _TopStatCard(
                            icon: IconlyBold.heart,
                            label: 'Избранное',
                            value: '231 товар',
                            iconColor: Color(0xFFA4ACB6),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        flex: 6,
                        child: AspectRatio(
                          aspectRatio: 1.5,
                          child: _TopStatCard(
                            icon: IconlyBold.buy,
                            label: 'Заказы',
                            value: '8 заказов',
                            iconColor: Color(0xFFA4ACB6),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        flex: 6,
                        child: AspectRatio(
                          aspectRatio: 1.5,
                          child: _TopStatCard(
                            icon: IconlyBold.star,
                            label: 'Отзывы',
                            value: '60 отзывов',
                            iconColor: Color(0xFFE9D32C),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Cashback & Referral Row
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(23),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Row(
                    children: [
                      // Cashback container with navigation to Info2
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => info2.Info2()),
                            );
                          },
                          child: SizedBox(
                            height: 92,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: const Color(0xFFA4ACB6),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Transform.rotate(
                                        angle: 0.0,
                                        child: Icon(IconlyLight.discount,
                                            size: 16, color: Color(0xFFEFF2F6)),
                                      ),
                                      const SizedBox(width: 4),
                                      Text('Кэшбэк баллы, ₽',
                                          style: GoogleFonts.inter(
                                              fontSize: 12,
                                              color: Color(0xFFEFF2F6))),
                                    ],
                                  ),
                                  const SizedBox(height: 6),
                                  Text('680',
                                      style: GoogleFonts.inter(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFFEFF2F6))),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Referral container with navigation to Info1
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => info1.Info1()),
                            );
                          },
                          child: SizedBox(
                            height: 92,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: const Color(0xFFEFF2F6),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  Positioned(
                                    right: -10,
                                    bottom: -10,
                                    child: Image.asset(
                                      'assets/images/children.png',
                                      width: 57,
                                      height: 38,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Transform.rotate(
                                                  angle: -0.785398,
                                                  child: Icon(Icons.link,
                                                      size: 16.8,
                                                      color: Color(0xFF1D293A)),
                                                ),
                                                const SizedBox(width: 4),
                                                Text(
                                                  'Реферальный код',
                                                  style: GoogleFonts.inter(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                        const Color(0xFF7B7B7B),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 6),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '37493659',
                                                  style: GoogleFonts.inter(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                const SizedBox(width: 4),
                                                Icon(Icons.copy,
                                                    size: 14,
                                                    color: Color(0xFF7B7B7B)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 7),
              // Profile Options List
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    // Group 1: first two tiles
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(23),
                      ),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => SwitchValueScreen2(hasShop: false),
                                  fullscreenDialog: true,
                                ),
                              );
                            },
                            child: _ProfileListTile(
                              icon: IconlyLight.location,
                              label: 'Мои адреса',
                            ),
                          ),
                          const Divider(height: 1, indent: 16, endIndent: 16),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => FourthComponentWidget(hasShop: false),
                                ),
                              );
                            },
                            child: _ProfileListTile(
                              icon: IconlyLight.buy,
                              label: 'Формат закупки',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 7),
                    // Group 2: next three tiles
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(23)),
                      child: Column(
                        children: [
                          _ProfileListTile(
                              icon: IconlyLight.heart, label: 'Избранные (24)'),
                          const Divider(height: 1, indent: 16, endIndent: 16),
                          _ProfileListTile(
                            icon: IconlyBold.star,
                            label: 'Отзывы (8)',
                            iconColor: Color(0xFFE9D32C),
                          ),
                          const Divider(height: 1, indent: 16, endIndent: 16),
                          _ProfileListTile(
                              icon: IconlyLight.time_circle,
                              label: 'Заказы (8)'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 7),
                    // Group 3: last two tiles
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(23)),
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Column(
                        children: [
                          _ProfileListTile(
                              icon: IconlyLight.calling,
                              label: 'Служба поддержки'),
                          const Divider(height: 1, indent: 16, endIndent: 16),
                          _ProfileListTile(
                              icon: IconlyLight.info_square,
                              label: 'Справочная информация'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }
}

class _TopStatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color? iconColor;
  const _TopStatCard(
      {required this.icon,
      required this.label,
      required this.value,
      this.iconColor});

  @override
  Widget build(BuildContext context) {
    final Color resolvedIconColor = iconColor ??
        (label == 'Избранное'
            ? const Color(0xFFA4ACB6)
            : const Color(0xFF1D293A));
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF2F6),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Icon(
              icon,
              color: resolvedIconColor,
              size: 18,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                label,
                style: GoogleFonts.inter(
                    fontSize: 12, fontWeight: FontWeight.w500),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                softWrap: false,
              ),
              Text(
                value,
                style: GoogleFonts.inter(fontSize: 8, color: Color(0xFF7B7B7B)),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                softWrap: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProfileListTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? iconColor;
  const _ProfileListTile(
      {required this.icon, required this.label, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(23),
      ),
      child: SizedBox(
        height: 32,
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          leading:
              Icon(icon, color: iconColor ?? const Color(0xFF1D293A), size: 20),
          title: Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          trailing: const Icon(Icons.chevron_right,
              color: Color(0xFFB0B0B0), size: 18),
          onTap: () {},
          minVerticalPadding: 0,
          dense: true,
        ),
      ),
    );
  }
}

Widget _buildBottomNavBar(BuildContext context) {
  final isLargeScreen = MediaQuery.of(context).size.width > 600;
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    currentIndex: 4,
    backgroundColor: Colors.white,
    selectedItemColor: const Color(0xFF1D293A),
    unselectedItemColor: const Color(0xFFA4ACB6),
    selectedFontSize: isLargeScreen ? 14 : 12,
    unselectedFontSize: isLargeScreen ? 12 : 10,
    iconSize: isLargeScreen ? 28 : 24,
    onTap: (index) {
      switch (index) {
        case 0:
          Navigator.pushReplacementNamed(context, '/catalog');
          break;
        case 1:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const OrdersListRight()),
          );
          break;
        case 2:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const WholesalePageRight()),
          );
          break;
        case 3:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => ListOfChatsPage()),
          );
          break;
      }
    },
    items: [
      BottomNavigationBarItem(
        icon: Icon(IconlyLight.category),
        label: 'Каталог',
      ),
      BottomNavigationBarItem(
        icon: Icon(IconlyLight.document),
        label: 'Заказы',
      ),
      BottomNavigationBarItem(
        icon: Icon(IconlyLight.buy),
        label: 'Корзина',
      ),
      BottomNavigationBarItem(
        icon: Icon(IconlyLight.chat),
        label: 'Чаты',
      ),
      BottomNavigationBarItem(
        icon: Icon(IconlyBold.profile, color: Color(0xFF1D293A)),
        label: 'Профиль',
      ),
    ],
  );
}