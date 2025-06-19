library bazora.otp_screen;
import 'dart:async';
import 'package:bazora/core/widgets/buttons/custom_button.dart';
import 'package:bazora/features/auth/presentation/widgets/sms_service.dart';
import 'package:bazora/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import '../../../../namedetails.dart';

class OtpModel {
  OtpModel(this.code, this.phoneNumber);
  late final int code;
  final String phoneNumber;
}

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.dataModel});
  final OtpModel dataModel;
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late final TextEditingController controller = TextEditingController();
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  bool _isButtonEnabled = false;
  late int _seconds = 120;
  late bool sendCode = true;
  late Color lineColor = Colors.grey;
  late String errorMessage = "";
  late int otpCode = 0;

  void startTimer() {
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_seconds == 0) {
        timer.cancel();
        setState(() {
          sendCode = false;
        });
      } else {
        sendCode = true;
        setState(() {
          _seconds--;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    otpCode = widget.dataModel.code;
    startTimer();
  }

  // SMS Aero service instance
  final SmsAeroService _smsService = SmsAeroService(
    email: 'ox.cmex@mail.ru',
    apiKey: 'hUh9OCGFJUxcpKwK3LkVv8ouLxLjlTRD',
  );


  Future<void> _sendVerificationCode() async {
    try {
      // Get the phone number from the controller
      final phoneNumber = widget.dataModel.phoneNumber.trim();

      // Send verification code using SMS Aero's built-in verification API
      final result = await _smsService.sendVerificationCode(
        phone: widget.dataModel.phoneNumber.replaceAll("+", "").replaceAll(" ", ""),
      );

      if (!mounted) return;

      if (result['success'] == true) {
        // Navigate to verification page with the phone number
        print("NICE CODE: ${result['code']}");
        otpCode = int.parse(result['code']);
      } else { }
    } catch (e) {
      setState(() { });
    } finally {
      if (mounted) { }
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _checkOtp() {
    setState(() {
      lineColor = Colors.grey;
      errorMessage = "";
      _isButtonEnabled = controller.text.length == 6;
    });
  }

  @override
  Widget build(BuildContext context) {
    final int minutes = _seconds ~/ 60;
    final int seconds = _seconds % 60;
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          final boxHeight = screenWidth * 0.10 * 1.4;
          final fontSize = screenWidth * 0.10 * 0.5;

          return Column(
            children: [
              // Header

              const SizedBox(height: 30),

              const Text(
                'Введите полученный код',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Пожалуйста, введите 6-значный SMS-код, который был отправлен по номеру ${widget.dataModel.phoneNumber}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              const SizedBox(height: 40),

              Container(
                height: 61,
                decoration: const BoxDecoration(
                    color: Color(0xffF9F9F9),
                    borderRadius: BorderRadius.all(Radius.circular(12))
                ),
                padding: const EdgeInsets.only(left: 50, right: 50, bottom: 8),
                child: PinInputTextField(
                  cursor: Cursor(
                    color: Colors.black,
                    enabled: true,
                    width: 2,
                    height: 30,
                  ),
                  controller: controller,
                  autoFocus: true,
                  onChanged: (String? v) {
                    _checkOtp();
                  },
                  decoration: BoxLooseDecoration(strokeColorBuilder: PinListenColorBuilder(lineColor, lineColor)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Row(
                  children: [
                    Text(
                      errorMessage,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.red,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              if (sendCode) RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    color: Color(0xFFA4ACB6),
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    const TextSpan(text: 'Отправить код повторно через '),
                    TextSpan(
                      text: '$minutes:${seconds.toString().padLeft(2, '0')}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ) else TextButton(
                onPressed: () {
                  _seconds = 120;
                  startTimer();
                  sendCode = true;
                  _sendVerificationCode();
                  setState(() {});
                },
                child: const Text(
                  "Отправить новый код",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 33),
                child: CustomButton(
                  width: 200,
                  shadowEnabled: false,
                  onPressed: _isButtonEnabled ? () {
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const NameDetailsScreen(),
                    //   ),
                    // );
                    if (int.parse(controller.text) == otpCode) {
                      lineColor = Colors.green;
                      localSource.setAccessToken("Test token");
                      // context.goNamed(Routes.explore);
                      context.pushNamed(Routes.referalCodePage);
                    } else {
                      lineColor = Colors.red;
                      errorMessage = "Неверный код";
                    }
                    setState(() {});
                    print(otpCode);
                  } : null,
                  borderRadius: BorderRadius.circular(18),
                  backgroundColor: _isButtonEnabled
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
          );
        },
      ),
    );
  }
}
