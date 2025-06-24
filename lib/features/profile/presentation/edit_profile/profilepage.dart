import 'dart:io';
import 'dart:ui';
import 'package:bazora/constants/image_constants.dart';
import 'package:bazora/core/extension/custom_snackbar/custom_snack_bar.dart';
import 'package:bazora/core/extension/custom_snackbar/top_snack_bar.dart';
import 'package:bazora/core/utils/app_colors.dart';
import 'package:bazora/core/utils/utils.dart';
import 'package:bazora/core/widgets/bottom_sheet/custom_bottom_sheet.dart';
import 'package:bazora/core/widgets/buttons/custom_button.dart';
import 'package:bazora/core/widgets/inputs/custom_text_field.dart';
import 'package:bazora/features/api/auth/supabase_auth/auth_util.dart';
import 'package:bazora/features/api/supabase/database/database.dart';
import 'package:bazora/features/api/supabase/database/row.dart';
import 'package:bazora/features/api/supabase/database/tables/users.dart';
import 'package:bazora/features/auth/presentation/widgets/select_photo_bottom_sheet.dart';
import 'package:bazora/features/profile/presentation/widgets/profile_image_widget.dart';
import 'package:bazora/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../logout_confirmation_page.dart';
import '../../../../logout_confirmation2.dart';
import 'package:image_picker/image_picker.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _PageState();
}

class _PageState extends State<ProfilePage> {

  late TextEditingController controllerName = TextEditingController();
  late TextEditingController controllerSurname = TextEditingController();
  late TextEditingController controllerDate = TextEditingController();
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    controllerName.text = localSource.getFirstName();
    controllerSurname.text = localSource.getLastName();
    controllerDate.text = localSource.getBirhtDay ?? "";
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateFormat formatter = DateFormat('dd.MM.yyyy');
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      // locale: const Locale('ru', 'RU'),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        controllerDate.text = formatter.format(
          DateTime(picked.year, picked.month, picked.day, 0, 0, 0),
        );
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    controllerName.dispose();
    controllerSurname.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;
    final verticalPadding = isTablet ? 32.0 : 24.0;
    final inputFontSize = isTablet ? 20.0 : 15.0;
    late ImagePicker picker = ImagePicker();
    File? image;

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
                      onTap: () async {
                        await customModalBottomSheet<void>(
                            context: context,
                            backgroundColor: Colors.transparent,
                            isScrollControlled: true,
                            enableDrag: false,
                            builder: (BuildContext ctx, _) => SelectPhotoBottomSheet(
                              onTapDelete: () {
                                setState(() {
                                  image = null;
                                  context.pop();
                                  print('Delete');
                                });
                              },
                              onTapSelect: () {
                                context.pop();
                                picker.pickImage(source: ImageSource.gallery).then((value) {
                                  if (value != null) {
                                    setState(() {
                                      image = File(value.path);
                                      print(image?.path);
                                    });
                                  }
                                });
                              },
                            )
                        );
                      },
                      child: SizedBox(
                        height: 60,
                        width: 60,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            ProfileImageWidget(
                              width: 72,
                              height: 72,
                              photoUrl: image == null ? localSource.getMyImageURL ?? "" : "",
                              image: image,
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
                        controller: controllerName,
                        style: TextStyle(fontSize: inputFontSize),
                        decoration: _inputDecoration(inputFontSize),
                        cursorColor: AppColors.baseColor,
                      ),
                    ),
                    SizedBox(height: isTablet ? 24 : 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: TextFormField(
                        controller: controllerSurname,
                        style: TextStyle(fontSize: inputFontSize),
                        decoration: _inputDecoration(inputFontSize),
                        cursorColor: AppColors.baseColor,
                      ),
                    ),
                    SizedBox(height: isTablet ? 24 : 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: SizedBox(
                        height: 50,
                        child: CustomTextField(
                          onTap: () => _selectDate(context),
                          hintText: "Дата рождения",
                          controller: controllerDate,
                          onChanged: (value) { },
                          fillColor:  Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: const BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: const BorderSide(color: Colors.transparent),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 15 * 0.8,
                          ),
                          cursorColor: AppColors.opacity,
                        ),
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
        child: Padding(
          padding: EdgeInsets.only(left: 100, right: 100, bottom: 50),
          child: CustomButton(
            onPressed: () async {
              await UsersTable().update(
                data: {
                  'surname': controllerSurname.text,
                  'birthday': supaSerialize<DateTime>(DateTime.now()),
                  'name': controllerName.text,
                },
                matchingRows: (rows) => rows.eqOrNull(
                  'id',
                  currentUserUid,
                ),
              );
              localSource.setFirstName(controllerName.text);
              localSource.setLastName(controllerSurname.text);
              localSource.setBirhtDay(controllerDate.text);
              showTopSnackBar(
                Overlay.of(context),
                const CustomSnackBar.info(
                  leftIcon: true,
                  title: "",
                  backgroundColor: AppColors.white,
                  message: "Ваши данные сохранены",
                ),
              );
              context.pop();
            },
            borderRadius: AppUtils.kBorderRadius18,
            label: const Text(
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

