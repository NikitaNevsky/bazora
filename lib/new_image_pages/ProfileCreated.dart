import 'package:flutter/material.dart';

class ReviewSentDialogRight extends StatelessWidget {
  const ReviewSentDialogRight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFAEB0B4),
      body: Center(
        child: Container(
          width: 355,
          height: 185,
          decoration: BoxDecoration(
            color: const Color(0xFFF7F7F7),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    // Adjusted padding based on FlutterFlow code
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 32),
                    child: Text(
                      'Отзыв отправлен!',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFF1D293A),
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                          side: const BorderSide(color: Color(0xFF1D293A), width: 1),
                        ),
                        elevation: 0,
                        minimumSize: const Size(315, 52),
                      ).copyWith(
                        backgroundColor: MaterialStateProperty.all(const Color(0xFF1D293A)),
                      ),
                      child: const Text(
                        'Ок',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
