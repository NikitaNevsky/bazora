import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import '../features/catalog/presentation/catalogpage.dart';
import '../listofchats.dart';
import '../features/profile/presentation/my_profile_page.dart';
import '../features/orders/presentation/orders_list_right.dart';

class EmptyWholesaleRight extends StatefulWidget {
  const EmptyWholesaleRight({Key? key}) : super(key: key);

  @override
  State<EmptyWholesaleRight> createState() => _EmptyWholesaleRightState();
}

class _EmptyWholesaleRightState extends State<EmptyWholesaleRight> {

  @override
  Widget build(BuildContext context) {
    final isLargeScreen = MediaQuery.of(context).size.width > 600;
    
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F3),
      appBar: AppBar(
        toolbarHeight: 145,
        backgroundColor: const Color(0xFF1D293A),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(23),
            bottomRight: Radius.circular(23),
          ),
        ),
        title: const Text('Корзина', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/imagess/bigboy.png', width: 220),
            const SizedBox(height: 20),
            const Text(
              'Ваша корзина пуста',
              style: TextStyle(color: Color(0xFF1D293A), fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
