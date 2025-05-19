import 'package:flutter/material.dart';
import 'order_success_right.dart';

class PaymentMethodDisabledRight extends StatefulWidget {
  const PaymentMethodDisabledRight({super.key});

  @override
  State<PaymentMethodDisabledRight> createState() => _PaymentMethodRightState();
}

class _PaymentMethodRightState extends State<PaymentMethodDisabledRight> {
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,
              size: isLargeScreen ? 24 : 20, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: screenHeight * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _switchTile(
                        'Наличными при получении', 'cash', cashOnDelivery),
                    SizedBox(height: screenHeight * 0.02),
                    _switchTile('Картой при получении', 'card', cardOnDelivery),
                    SizedBox(height: screenHeight * 0.02),
                    _switchTile('Картой онлайн', 'online', cardOnline),
                  ],
                ),
              ),
              const Spacer(),
              _orderSummary(),
              SizedBox(height: screenHeight * 0.02),
            ],
          ),
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
              fontSize: isLargeScreen ? 16 : 14,
              color: const Color(0xFF1D293A),
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
              inactiveTrackColor: const Color(0xFFEFF2F6),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              overlayColor: MaterialStateProperty.resolveWith((states) => 
                states.contains(MaterialState.pressed) ? const Color(0xFF1D293A).withOpacity(0.1) : null
              ),
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

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04, vertical: screenHeight * 0.02),
      child: Center(
        child: ElevatedButton(
          onPressed: null,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFA4ACB6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            minimumSize: const Size(0, 52),
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05),
          ),
          child: Text('Оформить заказ',
              style: TextStyle(
                  fontSize: isLargeScreen ? 18 : 16, color: Colors.white)),
        ),
      ),
    );
  }
}
