import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'catalogpage.dart';
import 'neweditprofilepage.dart';
import 'chatpage.dart';
import 'new_image_pages/wholesale_page_right.dart';
import 'new_image_pages/orders_list_right.dart';

class ListOfChatsPage extends StatefulWidget {
  const ListOfChatsPage({super.key});

  @override
  State<ListOfChatsPage> createState() => _ListOfChatsPageState();
}

class _ListOfChatsPageState extends State<ListOfChatsPage> {
  int _currentIndex = 3; // Default to Chats tab

  Widget _buildBottomNavBar() {
    final isLargeScreen = MediaQuery.of(context).size.width > 600;
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      backgroundColor: Colors.white,
      selectedItemColor: const Color(0xFF1D293A),
      unselectedItemColor: const Color(0xFFA4ACB6),
      selectedFontSize: isLargeScreen ? 14 : 12,
      unselectedFontSize: isLargeScreen ? 12 : 10,
      iconSize: isLargeScreen ? 28 : 24,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => CatalogPage()),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const OrdersListRight()),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const WholesalePageRight()),
            );
          } else if (index == 4) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const NewEditProfilePage()),
            );
          }
        });
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
          icon: Icon(IconlyBold.chat),
          label: 'Чаты',
        ),
        BottomNavigationBarItem(
          icon: Icon(IconlyLight.profile),
          label: 'Профиль',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLargeScreen = MediaQuery.of(context).size.width > 600;
    final padding = isLargeScreen ? 32.0 : 16.0;
    final itemSpacing = isLargeScreen ? 24.0 : 16.0;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          _ChatHeader(),
          SizedBox(height: itemSpacing),
          Expanded(
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.5),
              child: _ChatList(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }
}

class _ChatHeader extends StatelessWidget {
  const _ChatHeader();

  @override
  Widget build(BuildContext context) {
    final isLargeScreen = MediaQuery.of(context).size.width > 600;
    final horizontalPadding = isLargeScreen ? 48.0 : 20.0;
    final searchBarHeight = isLargeScreen ? 54.0 : 44.0;
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF1D293A),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      padding: EdgeInsetsDirectional.fromSTEB(
          0, isLargeScreen ? 80 : 60, 0, isLargeScreen ? 24 : 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Center(
                    child: Text(
                      'Чаты',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: isLargeScreen ? 20 : 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: isLargeScreen ? 24 : 18),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: searchBarHeight,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFF2F6),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 14.0),
                          child: Icon(Icons.search, color: Color(0xFFA4ACB6)),
                        ),
                        Expanded(
                          child: TextField(
                            style: GoogleFonts.inter(
                                color: const Color(0xFF1D293A),
                                fontSize: isLargeScreen ? 18 : 14),
                            decoration: const InputDecoration(
                              hintText: 'Поиск по чатам',
                              hintStyle: TextStyle(color: Color(0xFFA4ACB6)),
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  height: searchBarHeight,
                  width: searchBarHeight,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFF2F6),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    icon: const Icon(IconlyLight.filter,
                        color: Color(0xFFA4ACB6)),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatList extends StatelessWidget {
  const _ChatList();

  @override
  Widget build(BuildContext context) {
    final isLargeScreen = MediaQuery.of(context).size.width > 600;
    final verticalSpacing = isLargeScreen ? 18.0 : 13.0;
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: _ChatListItem(index: index),
      ),
    );
  }
}

class _ChatListItem extends StatelessWidget {
  final int index;
  const _ChatListItem({required this.index});

  @override
  Widget build(BuildContext context) {
    final isLargeScreen = MediaQuery.of(context).size.width > 600;
    final imageWidth = isLargeScreen ? 110.0 : 94.0;
    final imageHeight = isLargeScreen ? 96.0 : 82.0;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => ChatPage()),
        );
      },
      child: Container(
        height: 120, // Set to 101px
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: imageWidth,
              height: imageHeight,
              decoration: BoxDecoration(
                color: const Color(0xFFEFF2F6),
                borderRadius: BorderRadius.circular(16),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/top.jpg',
                  width: imageWidth,
                  height: imageHeight,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: isLargeScreen ? 18 : 10),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Apple Store',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1D293A),
                          fontSize: isLargeScreen ? 20 : 16,
                          letterSpacing: 0.0,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '7 минут назад',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.normal,
                          color: const Color(0xFFA4ACB6),
                          fontSize: isLargeScreen ? 12 : 10,
                          letterSpacing: 0.0,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.only(top: isLargeScreen ? 10 : 6),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1, -1),
                          child: Row(
                            children: [
                              Text(
                                'Добрый день, по поводу…',
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFFA4ACB6),
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                width: isLargeScreen ? 28 : 20,
                                height: isLargeScreen ? 28 : 20,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFBE364E),
                                  shape: BoxShape.circle,
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  '2',
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: isLargeScreen ? 16 : 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 30),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color(0xFF1D293A)),
                      ),
                      child: Text(
                        'Есть действующие заказы',
                        style: TextStyle(
                          color: const Color(0xFF1D293A),
                          fontSize: isLargeScreen ? 14 : 12,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(1, 1),
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(
                          top: isLargeScreen ? 12 : 8,
                          start: isLargeScreen ? 120 : 80),
                      child: SizedBox(
                        width: isLargeScreen ? 210 : 178,
                        height: isLargeScreen ? 32 : 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
