import 'package:flutter/material.dart';

class AddFileModalRight extends StatelessWidget {
  const AddFileModalRight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF48484B),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Top container with 4 buttons
            Container(
              width: 327,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12)), // All sides rounded
              ),
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'Добавить фото или файл',
                      style: TextStyle(
                        color: Color(0xFFA4ACB6),
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const Divider(height: 1),
                  _modalButton('Загрузить файл'),
                  const Divider(height: 1),
                  _modalButton('Сделать фото с камеры'),
                  const Divider(height: 1),
                  _modalButton('Добавить фото из галереи'),
                ],
              ),
            ),

            // Spacer with color
            Container(
              width: 327,
              height: 16,
              color: const Color(0xFF48484B),
            ),

            // Cancel button container with full border radius
            Container(
              width: 327,
              margin: const EdgeInsets.only(bottom: 30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12)), // All sides rounded
              ),
              child: _modalButton('Отмена', isCancel: true),
            ),
          ],
        ),
      ),
    );
  }

  Widget _modalButton(String text, {bool isCancel = false}) {
    return InkWell(
      onTap: () {
        // Add your logic here
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 18),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: const Color(0xFF232A36),
            fontWeight: isCancel ? FontWeight.bold : FontWeight.normal,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
