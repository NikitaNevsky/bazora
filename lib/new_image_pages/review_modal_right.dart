import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import '../features/orders/presentation/orders_list_right.dart';
import 'ProfileCreated.dart';
import '../../componentcamera.dart';

class ReviewModalRight extends StatelessWidget {
  const ReviewModalRight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFAEB0B4),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: const EdgeInsets.only(top: 50),  // 50px space from top
          width: double.infinity,
          height: 700,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
          padding: const EdgeInsets.fromLTRB(24, 30, 24, 32),
          child: SingleChildScrollView(  // Wrap the Column inside SingleChildScrollView
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 44,
                  height: 6,
                  margin: const EdgeInsets.only(bottom: 18),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE6E8EB),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                const Text('Оценить', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Color(0xFF1D293A))),
                const SizedBox(height: 18),
                Container(
                  width: 88,
                  height: 88,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Image.asset('assets/imagess/random1.png', fit: BoxFit.contain),
                ),
                const SizedBox(height: 12),
                const Text('Macbook Air M1', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                const SizedBox(height: 18),
                const Text('Насколько вам понравилось качество товара?', style: TextStyle(color: Color(0xFF232A36), fontSize: 16)),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, color: Color(0xFFFFC700), size: 32),
                    Icon(Icons.star, color: Color(0xFFFFC700), size: 32),
                    Icon(Icons.star, color: Color(0xFFFFC700), size: 32),
                    Icon(Icons.star, color: Color(0xFFFFC700), size: 32),
                    Icon(Icons.star_border, color: Color(0xFFFFC700), size: 32),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 128,
                  child: TextField(
                    maxLines: null, // Allow multiple lines
                    expands: true, // Take up all available space
                    textAlignVertical: TextAlignVertical.top, // Align text to top
                    decoration: InputDecoration(
                      hintText: 'Здесь вы можете добавить комментарий',
                      hintStyle: const TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xFFA4ACB6),
                        height: 1.4,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: Color(0xFFAEB0B4)),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                      alignLabelWithHint: true,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _photoTile(context: context, isAdd: true),
                      _photoTile(context: context, isAdd: false, imagePath: 'assets/imagess/middle.png'),
                      _photoTile(context: context, isAdd: false, imagePath: 'assets/imagess/middle.png'),
                      _photoTile(context: context, isAdd: false, imagePath: 'assets/imagess/middle.png'),
                      _photoTile(context: context, isAdd: false, imagePath: 'assets/imagess/middle.png'),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => OrdersListRight()),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFF232A36)),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          minimumSize: const Size.fromHeight(52),
                        ),
                        child: const Text('Пропустить', style: TextStyle(color: Color(0xFF232A36), fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const ReviewSentDialogRight();
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF232A36),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          minimumSize: const Size.fromHeight(52),
                        ),
                        child: const Text('Отправить', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
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

  Widget _photoTile({required BuildContext context, required bool isAdd, String? imagePath}) {
    // Fixed dimensions for each tile type
    final double containerWidth = isAdd ? 79.0 : 63.0;
    final double containerHeight = 77.0;
  
    Widget content = isAdd
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(IconlyLight.plus, color: Color(0xFFA4ACB6)),
              SizedBox(height: 2),
              Text(
                'Добавить фото\nили видео',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 8, color: Color(0xFFA4ACB6)),
              ),
            ],
          )
        : imagePath != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(imagePath, fit: BoxFit.cover, width: containerWidth, height: containerHeight),
              )
            : const SizedBox();

    if (isAdd) {
      return GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (BuildContext context) {
              return const ComponentCamera();
            },
          );
        },
        child: Container(
          width: containerWidth,
          height: containerHeight,
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            color: const Color(0xFFEFF2F6),
            borderRadius: BorderRadius.circular(12),
          ),
          child: content,
        ),
      );
    }
    
    return Container(
      width: containerWidth,
      height: containerHeight,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: content,
    );
  }
}
