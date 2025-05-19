import 'package:flutter/material.dart';

class EditOrderModalRight extends StatelessWidget {
  const EditOrderModalRight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFAEB0B4),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: 400,
          decoration: const BoxDecoration(
            color: Color(0xFFF7F7F7),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
          padding: const EdgeInsets.fromLTRB(24, 15, 24, 32),
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
              const Text('Изменить заказ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Color(0xFF1D293A))),
              const SizedBox(height: 18),
              _productEditTile('Macbook Air M1', 2),
              const SizedBox(height: 10),
              _productEditTile('Macbook Air M1', 2),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF1D293A)),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        padding: const EdgeInsets.symmetric(vertical: 14), // Reduced padding
                        minimumSize: const Size.fromHeight(52), // Set fixed height
                      ),
                      child: const Text('Вернуться', style: TextStyle(color: Color(0xFF1D293A), fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1D293A),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        padding: const EdgeInsets.symmetric(vertical: 14), // Reduced padding
                        minimumSize: const Size.fromHeight(52), // Set fixed height
                      ),
                      child: const Text('Сохранить', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _productEditTile(String name, int count) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 4),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: const Color(0xFFFFFFFF),
      borderRadius: BorderRadius.circular(18),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        Row(
          children: [
            const Text('Количество товаров', style: TextStyle(color: Color(0xFF1D293A), fontSize: 16)),
            const Spacer(),
            Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE6E8EB),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.remove, color: Color(0xFF232A36)),
                    onPressed: () {},
                    constraints: const BoxConstraints(minWidth: 24, minHeight: 24),
                    padding: EdgeInsets.zero,
                  ),
                ),
                Container(
                  width: 24,
                  height: 24,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  alignment: Alignment.center,  // Center the text
                  decoration: BoxDecoration(
                    color: const Color(0xFFE6E8EB),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '2', 
                    style: const TextStyle(
                      fontWeight: FontWeight.bold, 
                      fontSize: 16,
                      color: Color(0xFF232A36),
                    ),
                  ),
                ),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE6E8EB),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.add, color: Color(0xFF232A36)),
                    onPressed: () {},
                    constraints: const BoxConstraints(minWidth: 24, minHeight: 24),
                    padding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
}