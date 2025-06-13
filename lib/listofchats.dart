import 'package:bazora/constants/image_constants.dart';
import 'package:bazora/core/utils/app_colors.dart';
import 'package:bazora/core/widgets/inputs/custom_text_field.dart';
import 'package:bazora/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'features/catalog/presentation/catalogpage.dart';
import 'features/profile/presentation/my_profile_page.dart';
import 'features/profile/presentation/edit_profile/profilepage.dart';
import 'chatpage.dart';
import 'chatpage2.dart';
import 'chatpage3.dart';
import 'features/cart/presentation/wholesale_page_right.dart';
import 'features/orders/presentation/orders_list_right.dart';

class ListOfChatsPage extends StatefulWidget {
  const ListOfChatsPage({super.key});

  @override
  State<ListOfChatsPage> createState() => _ListOfChatsPageState();
}

class _ListOfChatsPageState extends State<ListOfChatsPage> {
  int _currentIndex = 3; // Default to Chats tab


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
          bottomLeft: Radius.circular(23),
          bottomRight: Radius.circular(23),
        ),
      ),
      padding: EdgeInsetsDirectional.fromSTEB(0, isLargeScreen ? 80 : 60, 0, isLargeScreen ? 24 : 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Чаты',
            style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 24, right: 24, bottom: 24),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 44,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: CustomTextField(
                      autofillHints: const <String>[AutofillHints.newUsername],
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.emailAddress,
                      hintText: "Поиск по чатам",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                        const BorderSide(color: Colors.transparent),
                      ),
                      cursorColor: AppColors.black,
                      cursorHeight: 17,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset(SvgIcons.icSearch),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                        const BorderSide(color: Colors.transparent),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Container(
                  height: searchBarHeight,
                  width: searchBarHeight,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFF2F6),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    icon: const Icon(IconlyLight.filter, color: Color(0xFFA4ACB6), size: 20,),
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
    // Removed unused variable
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 200), // Add 200px space at the bottom
      itemCount: 4,
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
        if (index < 2) {
          context.pushNamed(Routes.chatPage3);
        }
      },
      child: Container(
        height: 148, // Set to 101px
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
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/imagess/top.jpg',
                      width: imageWidth,
                      height: imageHeight,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 4,
                    right: 4,
                    child: Container(
                      width: 21,
                      height: 18,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          '+2',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
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
                    padding: EdgeInsetsDirectional.only(top: isLargeScreen ? 10 : 6),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Добрый день, по поводу…',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFFA4ACB6),
                            fontSize: 14,
                          ),
                        ),
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
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: const Color(0xFF1D293A)),
                        ),
                        child: index < 2
                            ? Text(
                                'Есть действующие заказы',
                                style: TextStyle(
                                  color: const Color(0xFF1D293A),
                                  fontSize: isLargeScreen ? 14 : 12,
                                ),
                              )
                            : Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    IconlyLight.send,
                                    size: isLargeScreen ? 16 : 14,
                                    color: const Color(0xFF1D293A),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    'В чат',
                                    style: TextStyle(
                                      color: const Color(0xFF1D293A),
                                      fontSize: isLargeScreen ? 14 : 12,
                                    ),
                                  ),
                                ],
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
