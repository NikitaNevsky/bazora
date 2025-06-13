import "package:bazora/features/catalog/presentation/catalogpage.dart";
import "package:bazora/features/profile/presentation/my_profile_page.dart";
import "package:bazora/listofchats.dart";
import "package:bazora/features/orders/presentation/orders_list_right.dart";
import "package:bazora/features/cart/presentation/wholesale_page_right.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:go_router/go_router.dart";
import "package:bazora/constants/image_constants.dart";
import "package:bazora/core/utils/app_colors.dart";
import "package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart";

class MainPage extends StatelessWidget {
  const MainPage({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  List<PersistentTabConfig> _tabs() => [
    PersistentTabConfig(
      screen: const CatalogPage(),
      item: ItemConfig(
        icon: SvgPicture.asset(SvgIcons.icFillCategory, color: AppColors.baseColor),
        inactiveIcon: SvgPicture.asset(SvgIcons.icCategory, color: AppColors.grey2),
        activeForegroundColor: AppColors.baseColor,
      ),
    ),
    PersistentTabConfig(
      screen: const OrdersListRight(),
      item: ItemConfig(
        icon: SvgPicture.asset(SvgIcons.icFillDocumentList, color: AppColors.baseColor),
        inactiveIcon: SvgPicture.asset(SvgIcons.icDocumentList, color: AppColors.grey2),
        activeForegroundColor: AppColors.baseColor,
      ),
    ),
    PersistentTabConfig(
      screen: const WholesalePageRight(),
      item: ItemConfig(
        icon: SvgPicture.asset(SvgIcons.icFillBuy, color: AppColors.baseColor),
        inactiveIcon: SvgPicture.asset(SvgIcons.icBuy, color: AppColors.grey2),
        activeForegroundColor: AppColors.baseColor,
      ),
    ),
    PersistentTabConfig(
      screen: const ListOfChatsPage(),
      item: ItemConfig(
        icon: SvgPicture.asset(SvgIcons.icFillChat, color: AppColors.baseColor, width: 24, height: 24,),
        inactiveIcon: SvgPicture.asset(SvgIcons.icChat, color: AppColors.grey2),
        activeForegroundColor: AppColors.baseColor,
      ),
    ),
    PersistentTabConfig(
      screen: const MyProfilePage(),
      item: ItemConfig(
        icon: SvgPicture.asset(SvgIcons.icFillProfile, color: AppColors.baseColor),
        inactiveIcon: SvgPicture.asset(SvgIcons.icProfile, color: AppColors.grey2),
        activeForegroundColor: AppColors.baseColor,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) => PopScope(
    canPop: navigationShell.currentIndex != 0,
    onPopInvoked: (bool v) => navigationShell.goBranch(0),
    child: PersistentTabView(
      tabs: _tabs(),
      navBarBuilder: (navBarConfig) => Style1BottomNavBar(navBarConfig: navBarConfig,),
    ),
  );

  void changeTap(int index, BuildContext context) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
