import 'package:bazora/core/extension/build_context_extension.dart';
import 'package:bazora/core/utils/app_colors.dart';
import 'package:bazora/core/widgets/buttons/custom_button.dart';
import 'package:bazora/core/widgets/inputs/custom_phone_text_field.dart';
import 'package:bazora/features/api/auth/supabase_auth/auth_util.dart';
import 'package:bazora/features/auth/presentation/otp/otp_screen.dart';
import 'package:bazora/features/auth/presentation/widgets/sms_service.dart';
import 'package:bazora/main.dart';
import 'package:bazora/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  final TextEditingController _phoneController = TextEditingController();
  bool _isValid = false;
  final _formKey = GlobalKey<FormState>();
  late bool _isLoading = false;
  String? _errorMessage;

  // SMS Aero service instance
  final SmsAeroService _smsService = SmsAeroService(
    email: 'ox.cmex@mail.ru',
    apiKey: 'hUh9OCGFJUxcpKwK3LkVv8ouLxLjlTRD',
  );

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


  Future<void> _sendVerificationCode() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      // Get the phone number from the controller
      final phoneNumber = _phoneController.text.trim();

      // Send verification code using SMS Aero's built-in verification API
      final result = await _smsService.sendVerificationCode(
        phone: "7${phoneNumber.replaceAll(" ", "")}",
      );

      if (!mounted) return;

      if (result['success'] == true) {
        // Navigate to verification page with the phone number
        print("NICE CODE: ${result['code']}");
        context.goNamed(Routes.otp, extra: OtpModel(int.parse(result['code']), "+7 $phoneNumber"));
      } else {
        setState(() {
          _errorMessage = 'Failed to send verification code: ${result['message']}';
          print(_errorMessage);
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to send verification code: ${e.toString()}';
        print(_errorMessage);
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
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
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        toolbarHeight: 145,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(23),
            bottomRight: Radius.circular(23),
          ),
        ),
        backgroundColor: const Color(0xFF1D293A),
        title: const Text(
          'BAZORA',
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 35,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: screenHeight),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 30),
                const Text(
                  'Введите номер телефона',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: CustomPhoneTextField(
                    filled: true,
                    controller: _phoneController,
                    haveBorder: false,
                    fillColor: Colors.white,
                    hintText: "+7 000 000 00 00",
                    cursorColor: AppColors.baseColor,
                    onChanged: (value) {
                      setState(() {
                        _isValid = value.length == 13;
                      });
                    },
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: const BorderSide(color: AppColors.red, width: 2),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: const BorderSide(color: AppColors.red, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: const BorderSide(color: AppColors.baseColor, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(color: const Color(0xffB1B1B2).withOpacity(0.22), width: 2),
                    ),
                  ),
                ),
                const SizedBox(height: 100),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
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
                const SizedBox(height: 20),
                CustomButton(
                  width: 200,
                  shadowEnabled: false,
                  onPressed: () async {
                    // if (_isValid) _sendVerificationCode();
                    localSource.setMyPhoneNumber("7${_phoneController.text.replaceAll(" ", "")}");
                    context.goNamed(Routes.otp, extra: OtpModel(int.parse('000000'), "+7 ${_phoneController.text.trim()}"));
                  },
                  borderRadius: BorderRadius.circular(18),
                  backgroundColor: _isValid
                      ? const Color(0xFF1D293A)
                      : const Color(0xFF101828).withOpacity(0.2),
                  label: _isLoading
                      ? const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 70, vertical: 5),
                        child: CircularProgressIndicator(color: Colors.white, backgroundColor: Colors.transparent,),
                      )
                      : const Text(
                        'Отправить код',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
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


