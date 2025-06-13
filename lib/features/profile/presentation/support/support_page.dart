import 'package:bazora/core/utils/app_colors.dart';
import 'package:bazora/core/utils/utils.dart';
import 'package:bazora/core/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

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
          'Служба поддержки',
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
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              height: 62,
              width: double.infinity,
              backgroundColor: Colors.white,
              shadowEnabled: false,
              borderRadius: AppUtils.kBorderRadius18,
              label: Row(
                children: [
                  CustomButton(
                    width: 36,
                    height: 36,
                    borderRadius: AppUtils.kBorderRadius48,
                    borderButton: true,
                    shadowEnabled: false,
                    borderColor: AppColors.black,
                    backgroundColor: AppColors.white,
                    padding: EdgeInsets.zero,
                    label: Icon(IconlyLight.call, color: AppColors.black, size: 20),
                  ),
                  AppUtils.kGap12,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Телефон",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: AppColors.grey2, fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        AppUtils.kGap4,
                        Text(
                          "+74232497777",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios_outlined, size: 20, color: AppColors.grey2)
                ],
              ),
            ),
            AppUtils.kGap8,
            CustomButton(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              height: 62,
              width: double.infinity,
              backgroundColor: Colors.white,
              shadowEnabled: false,
              borderRadius: AppUtils.kBorderRadius18,
              label: Row(
                children: [
                  CustomButton(
                    width: 36,
                    height: 36,
                    borderRadius: AppUtils.kBorderRadius48,
                    borderButton: true,
                    shadowEnabled: false,
                    borderColor: AppColors.black,
                    backgroundColor: AppColors.white,
                    padding: EdgeInsets.zero,
                    label: Icon(IconlyLight.message, color: AppColors.black, size: 20),
                  ),
                  AppUtils.kGap12,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: AppColors.grey2, fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        AppUtils.kGap4,
                        Text(
                          "optohelp@gmail.com",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ],
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
