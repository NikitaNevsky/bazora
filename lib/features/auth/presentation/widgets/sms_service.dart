import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

class SmsAeroService {
  final String _email;
  final String _apiKey;
  final String _baseUrl = 'https://gate.smsaero.ru/v2';

  SmsAeroService({
    required String email,
    required String apiKey,
  })  : _email = email,
        _apiKey = apiKey;

  String _getAuthHeader() {
    final credentials = '$_email:$_apiKey';
    final bytes = utf8.encode(credentials);
    final base64Credentials = base64.encode(bytes);
    return 'Basic $base64Credentials';
  }

  /// SMS yuborish
  Future<Map<String, dynamic>> sendSms({
    required String phone,
    required String message,
    String? sign,
    int? channel = 3, // 3 = Direct (to'g'ridan-to'g'ri)
  }) async {
    final url = Uri.parse('$_baseUrl/sms/send');

    // Telefon raqamini formatlash (+998 formatidan 998 formatiga o'tkazish)
    final formattedPhone = phone.startsWith('+') ? phone.substring(1) : phone;

    final response = await http.post(
      url,
      headers: {
        'Authorization': _getAuthHeader(),
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'number': formattedPhone,
        'text': message,
        'sign': sign ?? 'SMS Aero',
        'channel': channel,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('SMS yuborishda xatolik: ${response.body}');
    }
  }

  /// SMS statusini tekshirish
  Future<Map<String, dynamic>> checkSmsStatus(int smsId) async {
    final url = Uri.parse('$_baseUrl/sms/status');

    final response = await http.get(
      url,
      headers: {
        'Authorization': _getAuthHeader(),
      },

    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('SMS statusini tekshirishda xatolik: ${response.body}');
    }
  }

  /// Balansni tekshirish
  Future<Map<String, dynamic>> checkBalance() async {
    final url = Uri.parse('$_baseUrl/balance');

    final response = await http.get(
      url,
      headers: {
        'Authorization': _getAuthHeader(),
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Balansni tekshirishda xatolik: ${response.body}');
    }
  }

  /// Tasdiqlash kodi yuborish
  Future<Map<String, dynamic>> sendVerificationCode({
    required String phone,
    int codeLength = 6,
  }) async {
    // Tasodifiy kod yaratish
    final random = Random();
    final code = (100000 + random.nextInt(900000)).toString();

    // SMS yuborish
    final result = await sendSms(
      phone: phone,
      message: 'Ваш код подтверждения: $code',
    );

    return {
      ...result,
      'code': code,
    };
  }
}