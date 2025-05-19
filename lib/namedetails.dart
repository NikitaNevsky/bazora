import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'switchvalue.dart';
import 'componentcamera.dart';

class NameDetailsScreen extends ConsumerStatefulWidget {
  const NameDetailsScreen({super.key});

  @override
  ConsumerState<NameDetailsScreen> createState() => _NameDetailsScreenState();
}

class _NameDetailsScreenState extends ConsumerState<NameDetailsScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  // Track whether user has their own shop
  bool _hasShop = false;

  bool _isButtonEnabled = false;

  void _checkFieldsFilled() {
    setState(() {
      _isButtonEnabled = _nameController.text.isNotEmpty &&
          _surnameController.text.isNotEmpty &&
          _dobController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      Container(
                        height: 197,
                        width: double.infinity,
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
                              top: 30,
                              left: 10,
                              child: IconButton(
                                icon: const Icon(
                                  IconlyLight.arrow_left,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Заполните данные',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Stack(
                        children: [
                          const CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.grey,
                            backgroundImage:
                                AssetImage('assets/images/profile picture.png'),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ComponentCamera(),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Color(0xFF1D293A),
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 4,
                                    )
                                  ],
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(6.0),
                                  child: Icon(IconlyBold.edit, size: 18, color: Color(0xCCFFFFFF)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                hintText: 'Имя',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              onChanged: (_) => _checkFieldsFilled(),
                            ),
                            const SizedBox(height: 20),
                            TextField(
                              controller: _surnameController,
                              decoration: InputDecoration(
                                hintText: 'Фамилия',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              onChanged: (_) => _checkFieldsFilled(),
                            ),
                            const SizedBox(height: 20),
                            TextField(
                              controller: _dobController,
                              decoration: InputDecoration(
                                hintText: 'Дата рождения',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              onChanged: (_) => _checkFieldsFilled(),
                            ),
                            const SizedBox(height: 24),
                            Row(
                              children: [
                                Checkbox(
                                  value: _hasShop,
                                  onChanged: (value) {
                                    setState(() {
                                      _hasShop = value!;
                                      _checkFieldsFilled();
                                    });
                                  },
                                  checkColor: Colors.white,
                                  activeColor: const Color(0xFF1D293A),
                                  side: const BorderSide(
                                    color: Colors.black12,
                                    width: 1.5,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Flexible(
                                  child: Text(
                                    'У меня есть свой магазин',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: ElevatedButton(
                          onPressed: _isButtonEnabled
                              ? () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SwitchValueScreen(
                                        hasShop: _hasShop,
                                      ),
                                    ),
                                  );
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(195, 52),
                            backgroundColor: _isButtonEnabled
                                ? const Color(0xFF1D293A)
                                : const Color(0xFFA4ACB6),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          child: const Text(
                            'Продолжить',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
