library bazora.otp_screen;
import 'dart:async';
import 'package:bazora/core/extension/custom_snackbar/custom_snack_bar.dart';
import 'package:bazora/core/extension/custom_snackbar/top_snack_bar.dart';
import 'package:bazora/core/utils/app_colors.dart';
import 'package:bazora/core/widgets/buttons/custom_button.dart';
import 'package:bazora/core/widgets/inputs/custom_text_field.dart';
import 'package:bazora/features/api/supabase/supabase.dart';
import 'package:bazora/features/profile/model/users_response.dart';
import 'package:bazora/main.dart';
import 'package:bazora/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

Future addReferralBonus(
    String referID,
    String referralID,
    String referralCode,
    int currencyID,
    ) async {
  // Add your function code here!

  final response = await SupaFlow.client.rpc('add_referral_bonus', params: {
    'refer_id': referID,
    'referral_id': referralID,
    'referral_code': referralCode,
    'currency_id': currencyID,
  });
}

class ReferalCodePage extends StatefulWidget {
  const ReferalCodePage({super.key});
  @override
  State<ReferalCodePage> createState() => _PageState();
}

class _PageState extends State<ReferalCodePage> {

  late final TextEditingController controller = TextEditingController();
  late List<UsersResponse> users = [];
  late bool referalCodeDone = false;

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
                onPressed: () => context.pushNamed(Routes.createProfilePage),
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
                controller: controller,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly, // Faqat raqamlarni ruxsat qilish
                  LengthLimitingTextInputFormatter(10), // Maksimal uzunlik 10 ta belgidan
                ],
                onChanged: (value) {
                  setState(() {
                    referalCodeDone = value.length == 10;
                  });
                },
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(color: Color(0xFFA4ACB6)),
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
                List<UsersResponse> filteredList = users.where((element) => element.referralCode == controller.text).toList();
                if (filteredList.isNotEmpty) {
                  print("Referal kod bor $filteredList");
                  localSource.setReferralCode(controller.text);
                  context.pushNamed(Routes.createProfilePage);
                } else {
                  showTopSnackBar(
                    Overlay.of(context),
                    const CustomSnackBar.error(
                      leftIcon: true,
                      backgroundColor: AppColors.white,
                      message: "Неправильный код. Исправьте и повторите ввод.",
                    ),
                  );
                }
              },
              borderRadius: BorderRadius.circular(18),
              backgroundColor: referalCodeDone
                  ? const Color(0xFF1D293A)
                  : const Color(0xFF101828).withOpacity(0.2),
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
