import 'package:flutter/material.dart';

class BonusPaymentEmptyRight extends StatelessWidget {
  final String? initialValue;
  const BonusPaymentEmptyRight({Key? key, this.initialValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: initialValue);
    return Scaffold(
      backgroundColor: const Color(0xFFAEB0B4),
      resizeToAvoidBottomInset: true, // Helps avoid bottom overflow when keyboard appears
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: 430,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
          padding: const EdgeInsets.fromLTRB(24, 10, 24, 20),
          child: SingleChildScrollView( // Makes the content scrollable
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
                const SizedBox(height: 28),
                const Text(
                  'Оплата баллами',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Color(0xFF1D293A)),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Вы можете списать в счет заказа до 600\nбонусных баллов',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFF1D293A), fontSize: 16),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(fontSize: 18,color:  Color(0xFFA4ACB6)),
                  decoration: InputDecoration(
                    hintText: '560',
                    hintStyle: const TextStyle(color: Color(0xFF1D293A)),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 11),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Color(0xFFA4ACB6)),
                    ),
                  ),
                ),
                const SizedBox(height: 41),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFF1D293A)),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                          padding: const EdgeInsets.symmetric(vertical: 26),
                        ),
                        child: const Text(
                          'Вернуться',
                          style: TextStyle(
                            color: Color(0xFF1D293A),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1D293A),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                          padding: const EdgeInsets.symmetric(vertical: 26),
                        ),
                        child: const Text(
                          'Применить',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
