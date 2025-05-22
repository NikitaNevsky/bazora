import 'package:flutter/material.dart';

class ReviewSentDialogRight extends StatelessWidget {
  const ReviewSentDialogRight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFAEB0B4),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 19, vertical: 19),
          width: double.infinity,
          height: 185,
          decoration: BoxDecoration(
            color: Colors.white,
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        elevation: 0,
                        backgroundColor: const Color(0xFF1D293A),
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
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
