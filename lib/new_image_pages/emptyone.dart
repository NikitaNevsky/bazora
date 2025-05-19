import 'package:flutter/material.dart';

class EmptyOne extends StatefulWidget {
  const EmptyOne({Key? key}) : super(key: key);

  @override
  State<EmptyOne> createState() => _EmptyOneState();
}

class _EmptyOneState extends State<EmptyOne> {
  int _currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    final isLargeScreen = MediaQuery.of(context).size.width > 600;
    
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(145),
        child: Container(
          height: 145,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(23),
              bottomRight: Radius.circular(23),
            ),
            child: Container(
              color: const Color(0xFF1D293A),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 18),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  const SizedBox(width: 75),
                  const Text(
                    'Уведомления',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 78),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/boy.png', width: 220),
            const SizedBox(height: 20),
            const Text(
              'Уведомлений нет',
              style: TextStyle(color: Color(0xFF1D293A), fontSize: 18),
            ),
          ],
        ),
      ),

    );
  }
}
