import "dart:async";
import "dart:math" as math;

import "package:bazora/core/utils/app_colors.dart";
import "package:bazora/core/utils/utils.dart";
import "package:bazora/core/widgets/buttons/custom_button.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:image_picker/image_picker.dart";


class SelectPhotoBottomSheet extends StatefulWidget {
  const SelectPhotoBottomSheet({super.key, required this.onTapDelete, required this.onTapSelect});
  final VoidCallback onTapDelete;
  final Function() onTapSelect;
  @override
  State<SelectPhotoBottomSheet> createState() => _PageState();
}

class _PageState extends State<SelectPhotoBottomSheet> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Flexible(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(left: 33, right: 33, bottom: 12),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                          "Изменить фото",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey2,
                          )
                      ),
                    ),
                    Divider(color: AppColors.grey2.withOpacity(0.4)),
                    CustomButton(
                      height: 40,
                      shadowEnabled: false,
                      onPressed: widget.onTapSelect,
                      backgroundColor: AppColors.white,
                      label: const Text(
                          "Загрузить новое фото",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.baseColor,
                          )
                      )
                    ),
                    Divider(color: AppColors.grey2.withOpacity(0.4)),
                    CustomButton(
                        height: 40,
                        shadowEnabled: false,
                        onPressed: widget.onTapDelete,
                        backgroundColor: AppColors.white,
                        padding: EdgeInsets.zero,
                        label: const Text(
                            "Удалить фото",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.baseColor,
                            )
                        )
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 33, right: 33, bottom: 50),
                child: CustomButton(
                  onPressed: () => context.pop(),
                  backgroundColor: AppColors.white,
                    label: Text(
                        "Отмена",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.baseColor,
                        )
                    )
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}