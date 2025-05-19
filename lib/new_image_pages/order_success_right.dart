import 'package:flutter/material.dart';

class OrderSuccessRight extends StatelessWidget {
  const OrderSuccessRight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Added padding around the white container
          child: Container(
            height: 278,
            width: 400, // Set fixed width instead of double.infinity
            padding: const EdgeInsets.symmetric(horizontal: 24), // Added horizontal padding
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                SizedBox(height: 15),
                Text(
                  'Заказ № 236706\nоформлен',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Color(0xFF1D293A)),
                ),
                SizedBox(height: 16),
                Text(
                  'Вы можете отслеживать статус заказа в разделе Заказы',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Color(0xFF1D293A)),
                ),
                SizedBox(height: 32),
                SizedBox(
                  width: 315,
                  child: ElevatedButton(
                    onPressed: null,
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Color(0xFF1D293A)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14)))),
                      minimumSize: MaterialStatePropertyAll(Size(0, 52)),
                    ),
                    child: Text('Ок', style: TextStyle(color: Colors.white, fontSize: 16)),
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