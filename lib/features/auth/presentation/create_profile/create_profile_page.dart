import 'dart:async';
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
import 'package:bazora/features/api/supabase/database/tables/users.dart';
import 'package:bazora/features/others/dialogs/logout_in_create_modal.dart';
import 'package:bazora/features/auth/presentation/widgets/select_photo_bottom_sheet.dart';
import 'package:bazora/features/profile/model/users_response.dart';
import 'package:bazora/main.dart';
import 'package:bazora/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

DateTime get getCurrentTimestamp => DateTime.now();
extension DateTimeConversionExtension on DateTime {
  int get secondsSinceEpoch => (millisecondsSinceEpoch / 1000).round();
}

class CreateProfilePage extends StatefulWidget {
  const CreateProfilePage({super.key});
  @override
  State<CreateProfilePage> createState() => _PageState();
}

class _PageState extends State<CreateProfilePage> {

  late final TextEditingController controllerName = TextEditingController();
  late final TextEditingController controllerSurname = TextEditingController();
  late final TextEditingController controllerDate = TextEditingController();
  late bool checkBoxValue = false;
  late bool getCreate = false;
  DateTime? _selectedDate;
  File? image;
  late ImagePicker picker = ImagePicker();

  @override
  void initState() {
    super.initState();

  }

  Future<void> _selectDate(BuildContext context) async {
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
        controllerDate.text = "${picked.day}.${picked.month}.${picked.year}";
      });
    }
  }

  @override
  void dispose() {
    controllerName.dispose();
    controllerSurname.dispose();
    controllerDate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        leading: CustomButton(
          width: 100,
          backgroundColor: AppColors.opacity,
          shadowEnabled: false,
          onPressed: () async {
            await showDialog<void>(context: context, builder: (_) => LogoutInCreateModal());
          },
          padding: EdgeInsets.zero,
          label: const Icon(Icons.chevron_left, size: 40, color: AppColors.white),
        ),
        backgroundColor: const Color(0xFF1D293A),
      ),
      body: SingleChildScrollView(
        child: Column(
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
              'Заполните данные',
              style: TextStyle(
                color: AppColors.baseColor,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 24),
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
                  alignment: Alignment.bottomRight,
                  children: [
                    // image != null ? Image.file(image!, height: 72, width: 72, fit: BoxFit.cover) : SizedBox(),
                    image != null ? ClipRRect(
                      borderRadius: AppUtils.kBorderRadius64,
                      child: Image.file(
                        File(image!.path),
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ) : Container(
                      decoration: const BoxDecoration(
                        borderRadius: AppUtils.kBorderRadius64,
                        color: Color(0xffDFE5ED),
                      ),
                      child: const Center(child: Icon(Icons.person, color: Color(0xffA4ACB6))),
                    ),
                    // Overlay button (Camera)
                    Positioned(
                      bottom: 0.5,
                      child: ClipOval(
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.baseColor
                          ),
                          child: Icon(Icons.edit_outlined, color: AppColors.white, size: 15,),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: SizedBox(
                  height: 50,
                  child: CustomTextField(
                    hintText: "Имя",
                    controller: controllerName,
                    onChanged: (value) {
                      setState(() {
                        getCreate = value.length >= 4;
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
            const SizedBox(height: 12),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: SizedBox(
                  height: 50,
                  child: CustomTextField(
                    hintText: "Фамилия",
                    controller: controllerSurname,
                    onChanged: (value) { },
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
            const SizedBox(height: 12),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: SizedBox(
                  height: 50,
                  child: CustomTextField(
                    onTap: () => _selectDate(context),
                    hintText: "Дата рождения",
                    controller: controllerDate,
                    onChanged: (value) { },
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
                    cursorColor: AppColors.opacity,
                  ),
                )
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        checkBoxValue = !checkBoxValue;
                      });
                    },
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: checkBoxValue ? AppColors.baseColor : AppColors.opacity,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: checkBoxValue ? AppColors.opacity : AppColors.grey2)
                      ),
                      child: checkBoxValue ? const Icon(Icons.check, color: AppColors.white, size: 15) : SizedBox(),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'У меня есть свой магазин',
                    style: TextStyle(
                      color: AppColors.baseColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 100, right: 100, bottom: 40),
        child: CustomButton(
          width: 200,
          shadowEnabled: false,
          onPressed: () async {

            final user = supabase.auth.currentUser;
            final userId = user?.id;
            print(userId);
            print('currentUserUid $currentUserUid');
            await UsersTable().update(
              data: {
                'surname': controllerSurname.text,
                'birthday': supaSerialize<DateTime>(_selectedDate),
                'name': controllerName.text,
              },
              matchingRows: (rows) => rows.eqOrNull(
                'id',
                currentUserUid,
              ),
            );

            if (!checkBoxValue) {
              context.pushNamed(Routes.switchValueScreen, extra: checkBoxValue);
            } else {
              context.pushNamed(Routes.storeDetailsScreen);
            }
          },
          borderRadius: BorderRadius.circular(18),
          backgroundColor: getCreate
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
    );
  }
}
