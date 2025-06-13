import 'package:bazora/constants/image_constants.dart';
import 'package:bazora/core/utils/app_colors.dart';
import 'package:bazora/core/utils/utils.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _PageState();
}

class _PageState extends State<NotificationPage> {

  late bool tabSelect = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        leading: const BackButton(color: AppColors.white),
        toolbarHeight: 120,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(23),
            bottomRight: Radius.circular(23),
          ),
        ),
        backgroundColor: const Color(0xFF1D293A),
        title: const Text(
          'Уведомления',
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          AppUtils.kGap32,
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              borderRadius: AppUtils.kBorderRadius8,
              color: AppColors.opacity,
              border: Border.all(color: AppColors.lightGrey)
            ),
            child: DefaultTabController(
              length: 2,
              child: ButtonsTabBar(
                width: (MediaQuery.of(context).size.width / 2) - 24,
                contentCenter: true,
                physics: const NeverScrollableScrollPhysics(),
                contentPadding: EdgeInsets.zero,
                unselectedBackgroundColor: AppColors.opacity,
                unselectedLabelStyle: const TextStyle(color: AppColors.grey2),
                onTap: (value) {
                  setState(() {
                    tabSelect = value == 0;
                    if (tabSelect) {

                    } else {

                    }
                  });
                },
                decoration: const BoxDecoration(
                    borderRadius: AppUtils.kBorderRadius8,
                    color: AppColors.baseColor
                ),
                labelStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                tabs: const [
                  Tab(text: "Новые (4)"),
                  Tab(text: "Прочитано (5)"),
                ],
              ),
            ),
          ),
          AppUtils.kGap8,
          Flexible(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 4,
              itemBuilder: (_, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: AppUtils.kBorderRadius16,
                  ),
                  child: const Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Новое сообщение",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.baseColor
                            ),
                          ),
                          Text(
                            "3 дня назад",
                            style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400,
                              color: AppColors.grey2
                            ),
                          ),
                        ],
                      ),
                      AppUtils.kGap8,
                      Text(
                        "Заказ Macbook Air M1 доставлен в пункт выдачи, подтвердите получение заказа и оцените товар после его получения",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400,
                            color: AppColors.baseColor
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      // Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Image.asset(ImagesUrl.icEmptyNotification),
      //       const Text(
      //         'Уведомлений нет',
      //         style: TextStyle(
      //           color: AppColors.black,
      //           fontSize: 14,
      //           fontWeight: FontWeight.w400,
      //         ),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
