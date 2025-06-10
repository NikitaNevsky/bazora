import 'package:bazora/core/utils/app_colors.dart';
import 'package:bazora/core/utils/utils.dart';
import 'package:bazora/core/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileItemWidget extends StatelessWidget {
  const ProfileItemWidget({super.key, required this.title, required this.iconData, required this.onTap});
  final String title;
  final IconData iconData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      height: 34,
      backgroundColor: AppColors.opacity,
      shadowEnabled: false,
      padding: EdgeInsets.zero,
      onPressed: onTap,
      label: Row(
        children: [
          Icon(iconData, color: const Color(0xFF1D293A), size: 20),
          AppUtils.kGap12,
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 12,
              color: AppColors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          const Icon(Icons.chevron_right, color: Color(0xFFB0B0B0), size: 28)
        ],
      ),
    );
  }
}