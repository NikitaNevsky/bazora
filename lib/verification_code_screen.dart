import 'package:flutter/material.dart';
import 'namedetails.dart'; // Import the NameDetailsScreen

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({super.key});

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _isButtonEnabled = false;

  // Enable the button when input is 4 or more characters
  void _checkInput() {
    setState(() {
      _isButtonEnabled = _controller.text.length >= 4;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _navigateNext() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const NameDetailsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get screen width and height for responsiveness
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: Column(
          children: [
            // Header with back and skip
            Container(
              height: 197,
              decoration: const BoxDecoration(
                color: Color(0xFF1D293A),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(23),
                ),
              ),
              child: Stack(
                children: [
                  const Center(
                    child: Text(
                      'BAZORA',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 24,
                    top: 24,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  Positioned(
                    right: 24,
                    top: 24,
                    child: TextButton(
                      onPressed: _navigateNext,
                      child: const Text(
                        'Пропустить',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Urbanist',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: height * 0.05), // Adjust spacing

            // Code input field
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.06), // Adjust padding based on width
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Введите 8-значный код',
                  labelStyle: TextStyle(color: Color(0xFFA4ACB6)),
                  hintStyle: TextStyle(color: Color(0xFFA4ACB6)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                onChanged: (_) => _checkInput(),
              ),
            ),

            const Spacer(),

            // Continue button
            Padding(
              padding: EdgeInsets.fromLTRB(width * 0.06, 0, width * 0.06, 20),
              child: ElevatedButton(
                onPressed: _isButtonEnabled ? _navigateNext : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isButtonEnabled
                      ? const Color(0xFF1D293A)
                      : const Color(0xFFA4ACB6),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(195, 52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: const Text(
                  'Продолжить',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            SizedBox(height: height * 0.03), // Adjust spacing
          ],
        ),
      ),
    );
  }
}
