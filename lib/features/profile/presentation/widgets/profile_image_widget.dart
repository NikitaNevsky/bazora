import "dart:io";
import "package:bazora/core/utils/app_colors.dart";
import "package:bazora/core/utils/utils.dart";
import "package:bazora/core/widgets/custom_cached_network_image.dart";
import "package:flutter/material.dart";

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({
    super.key,
    this.onTap,
    this.width = 50,
    this.height = 50,
    this.photoUrl = "",
    this.image,
    this.borderRadius
  });

  final VoidCallback? onTap;
  final double width;
  final double height;
  final String photoUrl;
  final File? image;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) => InkWell(
    highlightColor: AppColors.opacity,
    onTap: onTap,
    child: Center(
      child: Container(
        height: height - 7,
        width: width - 7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 50),
          color: AppColors.grey2,
        ),
        child: image != null && photoUrl.isNotEmpty
            ? ClipRRect(
                borderRadius: AppUtils.kBorderRadius48,
                child: Image.file(
                  image!,
                  height: 72,
                  width: 72,
                  fit: BoxFit.cover,
                ),
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius ?? 50),
                child: photoUrl.isEmpty
                    ? Container(
                        width: 48,
                        height: 48,
                        decoration: const BoxDecoration(
                          borderRadius: AppUtils.kBorderRadius64,
                          color: Color(0xffDFE5ED),
                        ),
                        child: const Center(child: Icon(Icons.person, color: Color(0xffA4ACB6))),
                      )
                    : CustomCachedNetworkImage(
                        width: 72,
                        height: 72,
                        imageUrl: photoUrl,
                        fit: BoxFit.cover,
                      ),
              ),
      ),
    ),
  );
}
