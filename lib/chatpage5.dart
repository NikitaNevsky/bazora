import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart' show IconlyOutline, IconlyLight;
import 'package:bazora/features/catalog/presentation/catalogpage.dart';
import 'package:bazora/componentcamera.dart';

class ChatPage5 extends StatelessWidget {
  const ChatPage5({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Order number header
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: isTablet ? 24 : 16,
                  vertical: isTablet ? 16 : 12,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: const Color(0xFF1D293A),
                        size: isTablet ? 34 : 24,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    const Spacer(),
                    Text(
                      '№ 236706',
                      style: GoogleFonts.inter(
                        color: const Color(0xFF1D293A),
                        fontSize: isTablet ? 24 : 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: Icon(
                        IconlyLight.more_square,
                        color: const Color(0xFF1D293A),
                        size: isTablet ? 34 : 24,
                      ),
                      onPressed: () {
                        // Add menu functionality here
                      },
                    ),
                  ],
                ),
              ),
              // Order info container
              Container(
                width: double.infinity,
                height: isTablet ? 57 : 57,
                decoration: const BoxDecoration(
                  color: Color(0xFFDFE5ED),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: isTablet ? 24 : 16),
                      child: Text(
                        '2 товара',
                        style: GoogleFonts.inter(
                          color: const Color(0xFF1D293A),
                          fontSize: isTablet ? 16 : 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: 130,
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFF1D293A),
                          width: 1,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'ожидание оплаты',
                          style: GoogleFonts.urbanist(
                            color: const Color(0xFF1D293A),
                            fontSize: isTablet ? 16 : 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: isTablet ? 24 : 16),
                      child: Text(
                        '220 000 ₽',
                        style: GoogleFonts.inter(
                          color: const Color(0xFF1D293A),
                          fontSize: isTablet ? 16 : 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
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
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 319,
                        height: 154,
                        decoration: BoxDecoration(
                          color: const Color(0xFFDFE5ED),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
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
                                'Здравствуйте! Ваш заказ находится в статусе "Ожидание оплаты". Как только платеж будет подтвержден, мы продолжим обработку. Если у вас есть какие-то вопросы или уточнения, вы можете отправить мне фото и файлы',
                                style: GoogleFonts.inter(
                                  color: const Color(0xFF1D293A),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
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
                                    child: Center(
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.attach_file,
                                          size: isTablet ? 20 : 15,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => const ComponentCamera()),
                                          );
                                        },
                                        padding: EdgeInsets.zero,
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
                                'Спасибо за информацию! Я как раз хотел отправить вам документы с подтверждением оплаты ',
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
                                      'assets/imagess/documents.png',
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
                                      IconlyLight.voice,
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
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const ComponentCamera()),
                                      );
                                    },
                                    child: Container(
                                      width: isTablet ? 40 : 30,
                                      height: isTablet ? 40 : 30,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF1D293A),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.attach_file,
                                          color: Colors.white,
                                          size: isTablet ? 20 : 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Напишите сообщение...',
                                      hintStyle: GoogleFonts.inter(
                                        color: const Color(0xFFA4ACB6),
                                        fontSize: isTablet ? 16 : 14,
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
                                      fontSize: isTablet ? 16 : 14,
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
                              IconlyLight.send,
                              size: isTablet ? 32 : 24,
                              color: const Color(0xFFA4ACB6),
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