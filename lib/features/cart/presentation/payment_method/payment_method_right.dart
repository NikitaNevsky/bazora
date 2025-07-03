import 'package:bazora/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import '../widgets/order_success_right.dart';

class PaymentMethodRight extends StatefulWidget {
  const PaymentMethodRight({Key? key}) : super(key: key);

  @override
  State<PaymentMethodRight> createState() => _PaymentMethodRightState();
}

class _PaymentMethodRightState extends State<PaymentMethodRight> {
  bool cashOnDelivery = false;
  bool cardOnDelivery = false;
  bool cardOnline = false;

  void _handleSwitchChange(String type, bool value) {
    setState(() {
      // Turn off all other switches
      cashOnDelivery = type == 'cash' ? value : false;
      cardOnDelivery = type == 'card' ? value : false;
      cardOnline = type == 'online' ? value : false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isLargeScreen = screenWidth > 600;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        toolbarHeight: screenHeight * 0.12,
        backgroundColor: const Color(0xFF1D293A),
        elevation: 0,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(23),
            bottomRight: Radius.circular(23),
          ),
        ),
        leading: const BackButton(color: AppColors.white),
        title: Text(
          'Способ оплаты',
          style: TextStyle(
            color: Colors.white,
            fontSize: isLargeScreen ? 20 : 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 34),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _switchTile('Наличными при получении', 'cash', cashOnDelivery),
                  SizedBox(height: 12),
                  _switchTile('Картой при получении', 'card', cardOnDelivery),
                  SizedBox(height: 12),
                  _switchTile('Картой онлайн', 'online', cardOnline),
                ],
              ),
            ),
            const Spacer(),
            _orderSummary(),
          ],
        ),
      ),
    );
  }

  Widget _switchTile(String title, String type, bool value) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 600;

    return Container(
      height: isLargeScreen ? 50 : 40,
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.045),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: isLargeScreen ? 16 : 16,
              color: const Color(0xFF1D293A),
              fontWeight: FontWeight.w400,
            ),
          ),
          Transform.scale(
            scale: isLargeScreen ? 1.0 : 0.8,
            child: Switch(
              value: value,
              onChanged: (newValue) => _handleSwitchChange(type, newValue),
              activeColor: Colors.white,
              activeTrackColor: const Color(0xFF1D293A),
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: const Color(0xFFA4ACB6),
              materialTapTargetSize: MaterialTapTargetSize.padded,
              trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
            ),
          ),
        ],
      ),
    );
  }

  Widget _orderSummary() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isLargeScreen = screenWidth > 600;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Сумма заказа',
                    style: TextStyle(
                        color: const Color(0xFFA4ACB6),
                        fontSize: isLargeScreen ? 16 : 14)),
                Text('3 050 000 ₽',
                    style: TextStyle(
                        color: const Color(0xFFA4ACB6),
                        fontSize: isLargeScreen ? 16 : 14)),
              ],
            ),
            SizedBox(height: screenHeight * 0.005),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Оплата баллами',
                    style: TextStyle(
                        color: const Color(0xFFA4ACB6),
                        fontSize: isLargeScreen ? 16 : 14)),
                Text('-100000₽',
                    style: TextStyle(
                        color: const Color(0xFFA4ACB6),
                        fontSize: isLargeScreen ? 16 : 14)),
              ],
            ),
            SizedBox(height: screenHeight * 0.005),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Комиссия',
                    style: TextStyle(
                        color: const Color(0xFFA4ACB6),
                        fontSize: isLargeScreen ? 16 : 14)),
                Text('100₽',
                    style: TextStyle(
                        color: const Color(0xFFA4ACB6),
                        fontSize: isLargeScreen ? 16 : 14)),
              ],
            ),
            SizedBox(height: screenHeight * 0.015),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('2 950 000 ₽',
                        style: TextStyle(
                            fontSize: isLargeScreen ? 26 : 22,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF1D293A))),
                    Text('3 товара *15,2 кг',
                        style: TextStyle(
                            color: const Color(0xFFA4ACB6),
                            fontSize: isLargeScreen ? 16 : 14)),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const OrderSuccessRight();
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF232A36),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    minimumSize: const Size(0, 52),
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.05),
                  ),
                  child: Text('Оформить заказ',
                      style: TextStyle(
                          fontSize: isLargeScreen ? 18 : 16,
                          color: Colors.white)),
                ),
              ],
            ),
            SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
