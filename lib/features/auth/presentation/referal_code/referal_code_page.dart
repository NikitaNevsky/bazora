library bazora.otp_screen;
import 'dart:async';
import 'package:bazora/core/utils/app_colors.dart';
import 'package:bazora/core/widgets/buttons/custom_button.dart';
import 'package:bazora/core/widgets/inputs/custom_text_field.dart';
import 'package:bazora/features/auth/presentation/widgets/sms_service.dart';
import 'package:bazora/features/profile/model/users_response.dart';
import 'package:bazora/main.dart';
import 'package:bazora/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import '../../../../namedetails.dart';

class ReferalCodePage extends StatefulWidget {
  const ReferalCodePage({super.key});
  @override
  State<ReferalCodePage> createState() => _PageState();
}

class _PageState extends State<ReferalCodePage> {

  late final TextEditingController controller = TextEditingController();
  late List<UsersResponse> users = [];

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  // Method 1: Basic fetch all Users
  Future<void> getUsers() async {
    try {
      final response = await supabase.from('users').select();
      setState(() {
        final user = (response as List).map((json) => UsersResponse.fromJson(json)).toList();
        print("Method user _ ${user.length}");
        users = user;
      });
    } catch (error) {
      print("Error: $error");
    }
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        leading: const BackButton(color: AppColors.white),
        backgroundColor: const Color(0xFF1D293A),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Пропустить',
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 38),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.baseColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(23),
                bottomRight: Radius.circular(23),
              ),
            ),
            child: const Center(
              child: Text(
                'BAZORA',
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(height: 35),
          const Text(
            'Введите реферальный код',
            style: TextStyle(
              color: AppColors.baseColor,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: SizedBox(
              height: 50,
              child: CustomTextField(
                hintText: "Введите 8-значный код",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(color: Color(0xFF1D293A)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(color: Color(0xFF1D293A)),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15 * 0.8,
                ),
                cursorColor: AppColors.baseColor,
              ),
            )
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 33),
            child: CustomButton(
              width: 200,
              shadowEnabled: false,
              onPressed: () {
                List<UsersResponse> filteredList = users.where((element) => element.referralCode == int.parse(controller.text)).toList();

              },
              borderRadius: BorderRadius.circular(18),
              backgroundColor: const Color(0xFF101828).withOpacity(0.2),
              label: const Text(
                'Подтвердить',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
