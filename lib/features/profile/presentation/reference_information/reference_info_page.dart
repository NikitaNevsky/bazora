import 'package:bazora/core/utils/app_colors.dart';
import 'package:bazora/core/utils/utils.dart';
import 'package:bazora/core/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';

class ReferenceInfoPage extends StatelessWidget {
  const ReferenceInfoPage({super.key});

  @override
  Widget build(BuildContext context) {

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
          'Справочная информация',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppUtils.kGap32,
            CustomButton(
              padding: EdgeInsets.all(16),
              height: 52,
              width: double.infinity,
              backgroundColor: Colors.white,
              shadowEnabled: false,
              borderRadius: AppUtils.kBorderRadius18,
              label: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Политика обработки персональных данных",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios_outlined, size: 20, color: AppColors.grey2)
                ],
              ),
            ),
            AppUtils.kGap8,
            CustomButton(
              padding: EdgeInsets.all(16),
              height: 52,
              width: double.infinity,
              backgroundColor: Colors.white,
              shadowEnabled: false,
              borderRadius: AppUtils.kBorderRadius18,
              label: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Публичная оферта",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios_outlined, size: 20, color: AppColors.grey2)
                ],
              ),
            ),
            AppUtils.kGap8,
            CustomButton(
              padding: EdgeInsets.all(16),
              height: 52,
              width: double.infinity,
              backgroundColor: Colors.white,
              shadowEnabled: false,
              borderRadius: AppUtils.kBorderRadius18,
              label: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Пользовательское соглашение",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios_outlined, size: 20, color: AppColors.grey2)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
