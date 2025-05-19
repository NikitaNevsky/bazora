import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bazora/otp_screen.dart';
import 'package:bazora/selectnearestdelivery.dart';
import 'neweditprofilepage.dart';
import 'catalogpage.dart';
import 'profilepage.dart';
import 'info1.dart' as info1;
import 'info2.dart' as info2;
import 'Productdetails.dart';
import 'verification_code_screen.dart';
import 'sixthcomponent.dart';
import 'splash.dart';
import 'listofchats.dart';
import 'storedetails.dart';
import 'Reviewscreen.dart';
import 'namedetails.dart';
import 'new_image_pages/review_modal_right.dart';
import 'new_image_pages/wholesale_page_right.dart';
import 'new_image_pages/orders_list_right.dart';
import 'new_image_pages/payment_method_right.dart';
import 'new_image_pages/payment_method_disabled_right.dart';
import 'new_image_pages/order_success_right.dart';
import 'new_image_pages/order_details_right.dart';
import 'new_image_pages/notifications_list_right.dart';
import 'new_image_pages/empty_notifications_right.dart';
import 'new_image_pages/edit_order_modal_right.dart';
import 'new_image_pages/delivery_pickup_right.dart';
import 'new_image_pages/delivery_courier_right.dart';
import 'new_image_pages/delivery_courier_disabled_right.dart';
import 'new_image_pages/confirm_receive_dialog_right.dart';
import 'new_image_pages/cart_delete_dialog_right.dart';
import 'new_image_pages/bonus_payment_filled_right.dart';
import 'new_image_pages/bonus_payment_empty_right.dart';
import 'new_image_pages/add_file_modal_right.dart';
import 'new_image_pages/order_success_right.dart' as order_success;
import 'switchvalue2.dart';
import 'chatpage5.dart';
import 'helpdesk.dart';
import 'namedetails.dart';
import 'new_image_pages/review_modal2.dart';
import 'new_image_pages/notifications_list_right.dart';
import 'otp_screen.dart';
import 'Productdetails.dart';
import 'filters.dart';
import 'chatpage.dart';
import 'chatpage3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: const SplashScreen(),
      routes: {
        '/otp': (context) => const OtpScreen(),
        '/namedetails': (context) => const NameDetailsScreen(),
        '/catalog': (context) => const CatalogPage(),
        '/filters': (context) => const FilterPage(),
        '/chat': (context) => const ChatPage(),
        '/profile': (context) => const ProfilePage(),
        '/neweditprofile': (context) => const NewEditProfilePage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final TextEditingController _phoneController = TextEditingController();
  bool _isValid = false;

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(_validatePhoneNumber);
  }

  void _validatePhoneNumber() {
    final text = _phoneController.text;
    final digits = text.replaceAll(RegExp(r'[^0-9]'), '');
    setState(() {
      _isValid = digits.length == 12;
    });
  }

  String _formatPhoneNumber(String input) {
    String digits = input.replaceAll(RegExp(r'[^0-9]'), '');

    if (!input.startsWith('+375') && digits.isNotEmpty) {
      digits = '375$digits';
    }

    StringBuffer buffer = StringBuffer();
    if (digits.isNotEmpty) {
      buffer.write('+375');
      if (digits.length > 3) {
        buffer.write('(');
        buffer
            .write(digits.substring(3, digits.length > 5 ? 5 : digits.length));

        if (digits.length > 5) {
          buffer.write(')');
          buffer.write(
              digits.substring(5, digits.length > 8 ? 8 : digits.length));
        }

        if (digits.length > 8) {
          buffer.write(digits.substring(8));
        }
      }
    }

    return buffer.toString();
  }

  @override
  void dispose() {
    _phoneController.removeListener(_validatePhoneNumber);
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: screenHeight),
            child: Column(
              children: [
                Container(
                  height: 197,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFF1D293A),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(23),
                      bottomRight: Radius.circular(23),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'BAZORA',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.035),
                const Text(
                  'Введите номер телефона',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                  child: TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    autofillHints: null,
                    enableSuggestions: false,
                    autocorrect: false,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9+()]')),
                      TextInputFormatter.withFunction((oldValue, newValue) {
                        return TextEditingValue(
                          text: _formatPhoneNumber(newValue.text),
                          selection: TextSelection.collapsed(
                            offset: _formatPhoneNumber(newValue.text).length,
                          ),
                        );
                      }),
                    ],
                    decoration: InputDecoration(
                      hintText: '+375(00)0000000',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.04),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Используя приложение вы Соглашаетесь с ',
                          style: TextStyle(
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Color(0xFFA4ACB6),
                          ),
                        ),
                        TextSpan(
                          text: 'Политикой конфиденциальности ',
                          style: TextStyle(
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: 'и ',
                          style: TextStyle(
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Color(0xFFA4ACB6),
                          ),
                        ),
                        TextSpan(
                          text: 'Условиями использования',
                          style: TextStyle(
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.04),
                ElevatedButton(
                  onPressed: _isValid
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const OtpScreen()),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isValid
                        ? const Color(0xFF1D293A)
                        : const Color(0xFFA4ACB6),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(195, 52),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Text(
                    'Отправить код',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.04),
              ],
            ),
          ),
        ),
      ),
    );
  }
}