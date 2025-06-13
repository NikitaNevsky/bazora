import 'dart:io';
import 'dart:ui';

import 'package:bazora/constants/image_constants.dart';
import 'package:bazora/core/utils/app_colors.dart';
import 'package:bazora/core/utils/utils.dart';
import 'package:bazora/core/widgets/buttons/custom_button.dart';
import 'package:bazora/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../logout_confirmation_page.dart';
import '../../../../logout_confirmation2.dart';
import 'package:image_picker/image_picker.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _PageState();
}

class _PageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;
    final verticalPadding = isTablet ? 32.0 : 24.0;
    final inputFontSize = isTablet ? 20.0 : 15.0;
    late ImagePicker picker = ImagePicker();
    late File? image = File("/Users/macplus/Library/Developer/CoreSimulator/Devices/59562BC1-23A5-473B-B488-FF2F2A633573/data/Containers/Data/Application/CF1A6856-4689-4B12-89AC-3E637BACD956/tmp/image_picker_D51F2D1A-97FD-415F-ADC7-4469BADD751C-4911-00000B8830C00B07.jpg");

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        toolbarHeight: 100,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(23),
            bottomRight: Radius.circular(23),
          ),
        ),
        leading: const BackButton(color: AppColors.white),
        backgroundColor: const Color(0xFF1D293A),
        title: const Text(
          'Редактирование профиля',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: verticalPadding),
                    // Profile Image
                    GestureDetector(
                      onTap: () {
                        picker.pickImage(source: ImageSource.gallery).then((value) {
                          if (value != null) {
                            setState(() {
                              image = File(value.path);
                              print(image?.path);
                            });
                          }
                        });
                      },
                      child: SizedBox(
                        height: 60,
                        width: 60,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            // image != null ? Image.file(image!, height: 72, width: 72, fit: BoxFit.cover) : SizedBox(),
                            CircleAvatar(
                              radius: 100,
                              backgroundImage: const AssetImage('assets/imagess/profile picture.png'),
                            ),

                            // Overlay button (Camera)
                            Positioned(
                              bottom: 0.5,
                              child: ClipOval(
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // blur ishlashi uchun
                                  child: Container(
                                    width: 40,
                                    height: 18,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset(SvgIcons.icCamera, // sizdagi SvgIcons.icCamera
                                        width: 10,
                                        height: 10,
                                        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: verticalPadding),
                    // Input fields
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: TextFormField(
                        initialValue: 'Артем',
                        style: TextStyle(fontSize: inputFontSize),
                        decoration: _inputDecoration(inputFontSize),
                      ),
                    ),
                    SizedBox(height: isTablet ? 24 : 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: TextFormField(
                        initialValue: 'Филатов',
                        style: TextStyle(fontSize: inputFontSize),
                        decoration: _inputDecoration(inputFontSize),
                      ),
                    ),
                    SizedBox(height: isTablet ? 24 : 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: TextFormField(
                          initialValue: '11.12.2001',
                          style: TextStyle(fontSize: inputFontSize),
                          decoration: _inputDecoration(inputFontSize),
                        ),
                    ),
                    SizedBox(height: isTablet ? 32 : 24),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: CustomButton(borderRadius: AppUtils.kBorderRadius18,
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        height: 44,
                        width: double.infinity,
                          backgroundColor: Colors.white,
                          shadowEnabled: false,
                          label: Row(
                            children: [
                              SvgPicture.asset(SvgIcons.icLogout),
                              AppUtils.kGap16,
                              const Text(
                                "Выйти из аккаунта",
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                          onPressed: () async {
                            final shouldLogout = await showDialog<bool>(
                              context: context,
                              builder: (context) => Center(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 20),
                                  child: const Material(
                                    color: Colors.transparent,
                                    child: LogoutConfirmationSheet(),
                                  ),
                                ),
                              ),
                            );
                            if (shouldLogout == true) {
                              // Handle logout
                              localSource.box.clear();
                              context.goNamed(Routes.auth);
                            }
                          }
                      ),
                    ),
                    const SizedBox(height: 7),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: CustomButton(
                          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                          height: 44,
                          width: double.infinity,
                          backgroundColor: Colors.white,
                          shadowEnabled: false,
                          borderRadius: AppUtils.kBorderRadius18,
                          label: Row(
                            children: [
                              SvgPicture.asset(SvgIcons.icDeleteUser),
                              AppUtils.kGap16,
                              const Text(
                                "Удалить аккаунт",
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                          onPressed: () async {
                            final shouldLogout = await showDialog<bool>(
                              context: context,
                              builder: (context) => Center(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 20),
                                  child: const Material(
                                    color: Colors.transparent,
                                    child: LogoutConfirmation2(),
                                  ),
                                ),
                              ),
                            );
                            if (shouldLogout == true) {
                              // Handle logout
                            }
                          }
                      ),
                    ),
                    SizedBox(height: verticalPadding),
                  ],
                ),
              ),
            ),
          );

        },
      ),
      bottomNavigationBar: Container(
        color: AppColors.white,
        child: const Padding(
          padding: EdgeInsets.only(left: 100, right: 100, bottom: 50),
          child: CustomButton(
            borderRadius: AppUtils.kBorderRadius18,
            label: Text(
              'Сохранить',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration([double fontSize = 15]) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      isDense: true,
      contentPadding: EdgeInsets.symmetric(
        horizontal: fontSize,
        vertical: fontSize * 0.8,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: Color(0xFF1D293A)),
      ),
    );
  }
}

