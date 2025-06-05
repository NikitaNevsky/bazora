import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart' show IconlyOutline, IconlyLight;
import 'package:bazora/features/catalog/presentation/catalogpage.dart';
import 'package:bazora/componentcamera.dart';
import 'package:bazora/new_image_pages/edit_order_modal_right.dart';
import 'package:bazora/new_image_pages/cancel_order_dialog_right.dart';

class ChatPage2 extends StatelessWidget {
  const ChatPage2({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Top chat header
              Container(
                width: double.infinity,
                height: isTablet ? 150 : 110,
                decoration: const BoxDecoration(
                  color: Color(0xFF1D293A),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(23),
                    bottomRight: Radius.circular(23),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: isTablet ? 36 : 20),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_rounded,
                          color: const Color(0xFFEFF2F6),
                          size: isTablet ? 36 : 24,
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      SizedBox(width: isTablet ? 40 : 20),
                      Container(
                        width: isTablet ? 42 : 25,
                        height: isTablet ? 42 : 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(isTablet ? 20 : 12),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(isTablet ? 20 : 12),
                          child: Image.asset(
                            'assets/imagess/top.jpg',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Container(
                              color: Colors.grey[300],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: isTablet ? 12 : 4),
                      Text(
                        'Магазин Apple Store',
                        style: GoogleFonts.inter(
                          color: const Color(0xFFEFF2F6),
                          fontSize: isTablet ? 24 : 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      PopupMenuButton<String>(
                        icon: Icon(
                          IconlyLight.more_square,
                          color: const Color(0xFFEFF2F6),
                          size: isTablet ? 34 : 24,
                        ),
                        onSelected: (value) {
                          if (value == 'cancel') {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const CancelOrderDialogRight();
                              },
                            );
                          } else if (value == 'edit') {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (BuildContext context) {
                                return const EditOrderModalRight();
                              },
                            );
                          }
                        },
                        itemBuilder: (BuildContext context) => [
                          PopupMenuItem(
                            value: 'cancel',
                            child: Text('Отменить заказ'),
                          ),
                          PopupMenuItem(
                            value: 'edit',
                            child: Text('Изменить заказ'),
                          ),
                        ],
                        offset: Offset(0, 50),
                        color: Colors.white,
                        elevation: 2,
                      ),
                    ],
                  ),
                ),
              ),
              // White container below app bar with padding
              Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 30,
                ),
                child: Container(
                  child: Container(
                    width: double.infinity,
                    height: isTablet ? 94 : 94,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(23),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '№ 236706',
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w700,
                                  fontSize: isTablet ? 20 : 16,
                                  color: const Color(0xFF1D293A),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '220 000 ₽',
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w400,
                                  fontSize: isTablet ? 20 : 16,
                                  color: const Color(0xFF1D293A),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '2 товара',
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w400,
                                  fontSize: isTablet ? 16 : 10,
                                  color: const Color(0xFFA4ACB6),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                IconlyLight.time_square,
                                color: const Color(0xFF1D293A),
                                size: isTablet ? 28.8 : 24,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Посмотреть заказ',
                                style: GoogleFonts.inter(
                                  color: const Color(0xFF1D293A),
                                  fontSize: isTablet ? 14 : 12,
                                  fontWeight: FontWeight.w500,
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
              SizedBox(height: isTablet ? 36 : 20),
              Align(
                alignment: const AlignmentDirectional(0, -1),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, isTablet ? 18 : 10, 0, 0),
                  child: Text(
                    '11 августа',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.normal,
                      fontSize: isTablet ? 18 : 12,
                      color: const Color(0xFFA4ACB6),
                    ),
                  ),
                ),
              ),
              SizedBox(height: isTablet ? 120 : 74),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: 285,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1D293A),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(isTablet ? 20 : 10),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Здравствуйте! Хотел бы уточнить комплектацию товара',
                                style: GoogleFonts.inter(
                                  color: const Color(0xFFEFF2F6),
                                  fontSize: isTablet ? 20 : 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              SizedBox(height: isTablet ? 8 : 4),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0, isTablet ? 16 : 8, isTablet ? 4 : 2, isTablet ? 20 : 10),
                                    child: Text(
                                      '09:50',
                                      style: GoogleFonts.inter(
                                        color: const Color(0xFFA4ACB6),
                                        fontSize: isTablet ? 14 : 10,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(isTablet ? 4 : 2, 0, isTablet ? 20 : 10, 0),
                                    child: Icon(
                                      Icons.check,
                                      color: const Color(0xFFA4ACB6),
                                      size: isTablet ? 20 : 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: isTablet ? 18 : 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 319,
                        height: 90,
                        decoration: BoxDecoration(
                          color: const Color(0xFFDFE5ED),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                          border: Border.all(color: const Color(0xFFDFE5ED), width: 1),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(isTablet ? 20 : 10),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Добрый день, сейчас проверю и сообщю',
                                style: GoogleFonts.inter(
                                  color: const Color(0xFF1D293A),
                                  fontSize: isTablet ? 20 : 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, isTablet ? 8 : 4, isTablet ? 20 : 10, isTablet ? 20 : 10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        '09:50',
                                        style: GoogleFonts.inter(
                                          color: const Color(0xFFA4ACB6),
                                          fontSize: isTablet ? 14 : 10,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      SizedBox(width: isTablet ? 4 : 2),
                                      Icon(
                                        Icons.check,
                                        color: const Color(0xFFA4ACB6),
                                        size: isTablet ? 20 : 12,
                                      ),
                                      Icon(
                                        Icons.done_all,
                                        color: const Color(0xFF1D293A),
                                        size: isTablet ? 20 : 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: isTablet ? 18 : 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 234,
                        height: 90,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEFF2F6),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  // Pause icon in circle
                                  Container(
                                    width: 40,
                                    height: 40,
                                    margin: const EdgeInsets.only(top: 11),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color(0xFFA4ACB6),
                                        width: 2,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.pause,
                                        size: 18,
                                        color: Color(0xFFA4ACB6),
                                      ),
                                    ),
                                  ),

                                  const SizedBox(width: 10),

                                  // Image and 0:15 time
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'assets/imagess/radio.jpg',
                                        width: 168,
                                        height: 30,
                                        fit: BoxFit.contain,
                                      ),
                                      const SizedBox(height: 3), // 30% reduced spacing
                                      Text(
                                        '0:15',
                                        style: GoogleFonts.inter(
                                          color: const Color(0xFFA4ACB6),
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              const SizedBox(height: 4),

                              // Row with 09:50 and two check icons AFTER it
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    '09:50',
                                    style: GoogleFonts.inter(
                                      color: const Color(0xFFA4ACB6),
                                      fontSize: 10,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Icon(
                                    Icons.check,
                                    size: 6,
                                    color: Color(0xFF51CBCD),
                                  ),
                                  const SizedBox(width: 2),
                                  Icon(
                                    Icons.check,
                                    size: 6,
                                    color: Color(0xFF51CBCD),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    
                    SizedBox(height: isTablet ? 48 : 24),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, isTablet ? 16 : 8, 0, 0),
                        child: Container(
                          width: 140,
                          height: 150,
                          decoration: BoxDecoration(
                            color: const Color(0xFF1D293A),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      'assets/imagess/middle.png',
                                      width: 116,
                                      height: 116,
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                right: 8,
                                bottom: 2,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '10:30',
                                      style: GoogleFonts.inter(
                                        color: const Color(0xFFA4ACB6),
                                        fontSize: 10,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    const SizedBox(width: 2),
                                    Icon(
                                      Icons.access_time,
                                      color: const Color(0xFFA4ACB6),
                                      size: 5,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: isTablet ? 18 : 10),
                    const SizedBox(height: 24),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: 181,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1D293A),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: isTablet ? 20 : 10,
                            left: isTablet ? 20 : 10,
                            right: isTablet ? 20 : 10,
                            bottom: 20,
                          ),
                          child: Stack(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/imagess/pdf.png',
                                    width: 48,
                                    height: 48,
                                    fit: BoxFit.contain,
                                    errorBuilder: (context, error, stackTrace) {
                                      print('Image load error: $error');
                                      return Container(
                                        width: 48,
                                        height: 48,
                                        color: Colors.red,
                                        child: Center(
                                          child: Text(
                                            'pdf',
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Документ.pdf',
                                        style: GoogleFonts.inter(
                                          color: const Color(0xFFEFF2F6),
                                          fontSize: isTablet ? 16 : 12,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      Text(
                                        '3.0 MB',
                                        style: GoogleFonts.inter(
                                          color: const Color(0xFFA4ACB6),
                                          fontSize: isTablet ? 14 : 10,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Positioned(
                                right: 8,
                                bottom: 2,
                                child: Text(
                                  '10:30',
                                  style: GoogleFonts.inter(
                                    color: const Color(0xFFA4ACB6),
                                    fontSize: isTablet ? 14 : 10,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 100),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 20, left: 0, right: 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: isTablet ? 88 : 90,
                  decoration: BoxDecoration(
                    color: const Color(0xFFDFE5ED),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(isTablet ? 24 : 12, 0, isTablet ? 24 : 12, 15),
                          child: Container(
                            width: 297,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(isTablet ? 15 : 10, 0, isTablet ? 15 : 10, 0),
                                  child: Container(
                                    width: isTablet ? 40 : 30,
                                    height: isTablet ? 40 : 30,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF1D293A),
                                      shape: BoxShape.circle,
                                    ),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.attach_file,
                                        size: isTablet ? 20 : 15,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          builder: (BuildContext context) {
                                            return const ComponentCamera();
                                          },
                                        );
                                      },
                                      padding: EdgeInsets.zero,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Напишите сообщение...',
                                      hintStyle: GoogleFonts.inter(
                                        color: const Color(0xFFA4ACB6),
                                        fontSize: isTablet ? 18 : 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: isTablet ? 24 : 12,
                                        vertical: isTablet ? 16 : 8,
                                      ),
                                    ),
                                    style: GoogleFonts.inter(
                                      color: const Color(0xFF1D293A),
                                      fontSize: isTablet ? 18 : 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(isTablet ? 10 : 0, 0, isTablet ? 20 : 10, 15),
                        child: Container(
                          width: isTablet ? 56 : 40,
                          height: isTablet ? 56 : 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Icon(
                              Icons.keyboard_voice_outlined,
                              size: isTablet ? 32 : 24,
                              color: const Color(0xFF1D293A),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}