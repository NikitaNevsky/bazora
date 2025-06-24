import 'package:bazora/core/extension/custom_snackbar/custom_snack_bar.dart';
import 'package:bazora/core/extension/custom_snackbar/top_snack_bar.dart';
import 'package:bazora/core/utils/app_colors.dart';
import 'package:bazora/core/utils/utils.dart';
import 'package:bazora/core/widgets/custom_cached_network_image.dart';
import 'package:bazora/features/api/supabase/database/tables/favorite_products_view_catalog.dart';
import 'package:bazora/features/profile/presentation/mixin/profile_mixin.dart';
import 'package:bazora/features/profile/presentation/widgets/profile_item_widget.dart';
import 'package:bazora/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:widget_lifecycle/widget_lifecycle.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});
  @override
  State<MyProfilePage> createState() => _PageState();
}

class _PageState extends State<MyProfilePage> with ProfileMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF7F7F7),
        body: LifecycleAware(
        observer: LifecycleObserver(
          onVisible: (a) {
            getFavorites();
            getUser();
        }),
        builder: (BuildContext context, Lifecycle lifecycle) => Column(
          children: [
            // Header - now 145px height
            Container(
              width: double.infinity,
              height: 145,
              decoration: const BoxDecoration(
                color: Color(0xFF1D293A),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              padding: const EdgeInsets.only(top: 55, left: 16, right: 16, bottom: 16),
              child: Row(
                children: [
                  (localSource.getMyImageURL?.isNotEmpty ?? false)
                      ? ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(50)) ,
                          child: CustomCachedNetworkImage(
                            width: 48,
                            height: 48,
                            fit: BoxFit.cover,
                            imageUrl: localSource.getMyImageURL ?? "",
                          ),
                        )
                      : Container(
                          width: 48,
                          height: 48,
                          decoration: const BoxDecoration(
                            borderRadius: AppUtils.kBorderRadius64,
                            color: Color(0xffDFE5ED),
                          ),
                          child: const Center(child: Icon(Icons.person, color: Color(0xffA4ACB6))),
                        ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      '${localSource.getLastName()} ${localSource.getFirstName()}',
                      style: GoogleFonts.inter(
                        color: const Color(0xFFDFE5ED),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(IconlyLight.edit, color: Colors.white),
                    onPressed: () {
                      context.pushNamed(Routes.profilePage);
                    },
                  ),
                ],
              ),
            ),
            // Top Card Row
            FutureBuilder<List<FavoriteProductsViewCatalogRow>>(
              future: futureFavorite,
              builder: (context, snapshot) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(23),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 6,
                          child: AspectRatio(
                            aspectRatio: 1.5,
                            child: _TopStatCard(
                              icon: IconlyBold.heart,
                              label: 'Избранное',
                              value: '${snapshot.data?.length} товар',
                              iconColor: const Color(0xFFA4ACB6),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Expanded(
                          flex: 6,
                          child: AspectRatio(
                            aspectRatio: 1.5,
                            child: _TopStatCard(
                              icon: IconlyBold.buy,
                              label: 'Заказы',
                              value: '8 заказов',
                              iconColor: Color(0xFFA4ACB6),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Expanded(
                          flex: 6,
                          child: AspectRatio(
                            aspectRatio: 1.5,
                            child: _TopStatCard(
                              icon: IconlyBold.star,
                              label: 'Отзывы',
                              value: '60 отзывов',
                              iconColor: Color(0xFFE9D32C),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            ),
            // Cashback & Referral Row
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(23),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Row(
                  children: [
                    // Cashback container with navigation to Info2
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (_) => info2.Info2()),
                          // );
                          showTopSnackBar(
                            Overlay.of(context),
                            const CustomSnackBar.info(
                              leftIcon: true,
                              title: "Кэшбэк баллы",
                              backgroundColor: AppColors.white,
                              message: "Вы можете использовать баллы для оплаты заказов из расчета 1 балл = 1 рубль. Оплата оптового заказа возможна до 10% от итоговой суммы, розничного заказа - до 5%",
                            ),
                          );
                        },
                        child: SizedBox(
                          height: 80,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color(0xFFA4ACB6),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Transform.rotate(
                                      angle: 0.0,
                                      child: const Icon(IconlyLight.discount, size: 16, color: Color(0xFFEFF2F6)),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      'Кэшбэк баллы, ₽',
                                      style: GoogleFonts.inter(fontSize: 12, color: Color(0xFFEFF2F6)),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Text(
                                    localSource.getMyCashBack.toString(),
                                    style: GoogleFonts.inter(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFEFF2F6)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Referral container with navigation to Info1
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (_) => info1.Info1()),
                          // );
                          showTopSnackBar(
                            Overlay.of(context),
                            const CustomSnackBar.info(
                              leftIcon: true,
                              title: "Реферальный код скопирован",
                              backgroundColor: AppColors.white,
                              message: "Делитесь реферальным кодом с знакомыми и получайте вознаграждение по реферальной программе",
                            ),
                          );
                        },
                        child: SizedBox(
                          height: 80,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color(0xFFEFF2F6),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Positioned(
                                  right: -10,
                                  bottom: -10,
                                  child: Image.asset(
                                    'assets/imagess/children.png',
                                    width: 57,
                                    height: 38,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Transform.rotate(
                                                angle: -0.785398,
                                                child: const Icon(Icons.link,
                                                    size: 16.8,
                                                    color: Color(0xFF1D293A)),
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                'Реферальный код',
                                                style: GoogleFonts.inter(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      const Color(0xFF7B7B7B),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 12),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                localSource.getMyReferralCode.toString(),
                                                style: GoogleFonts.inter(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              const SizedBox(width: 4),
                                              const Icon(Icons.copy,
                                                  size: 14,
                                                  color: Color(0xFF7B7B7B)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 7),
            // Profile Options List
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                    child: Column(
                      children: [
                        ProfileItemWidget(
                          title: "Мои адреса",
                          iconData: IconlyLight.location,
                          onTap: () { },
                        ),
                        Divider(height: 1, color: AppColors.grey2.withOpacity(0.4)),
                        ProfileItemWidget(
                          title: "Формат закупки",
                          iconData: IconlyLight.buy,
                          onTap: () => context.pushNamed(Routes.buyFormat),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 7),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                    child: Column(
                      children: [
                        FutureBuilder<List<FavoriteProductsViewCatalogRow>>(
                            future: futureFavorite,
                            builder: (context, snapshot) {
                              return ProfileItemWidget(
                                title: "Избранные ${(snapshot.data?.isNotEmpty ?? false) ? "(${snapshot.data?.length})" : ""}",
                                iconData: IconlyLight.heart,
                                onTap: () => context.pushNamed(Routes.favoritePage, extra: snapshot.data),
                              );
                            }
                        ),
                        Divider(height: 1, color: AppColors.grey2.withOpacity(0.4)),
                        ProfileItemWidget(
                          title: "Заказы (8)",
                          iconData: IconlyLight.time_circle,
                          onTap: () {  },
                        ),
                        Divider(height: 1, color: AppColors.grey2.withOpacity(0.4)),
                        ProfileItemWidget(
                          title: "Отзывы (8)",
                          iconData: IconlyLight.star,
                          onTap: () {  },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 7),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                    child: Column(
                      children: [
                        ProfileItemWidget(
                          title: "Служба поддержки",
                          iconData: IconlyLight.calling,
                          onTap: () => context.pushNamed(Routes.supportPage),
                        ),
                        Divider(height: 1, color: AppColors.grey2.withOpacity(0.4)),
                        ProfileItemWidget(
                          title: "Справочная информация",
                          iconData: IconlyLight.info_square,
                          onTap: () => context.pushNamed(Routes.referenceInfoPage),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 400,)
          ],
        ),
      ),
    );
  }
}

class _TopStatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color? iconColor;
  const _TopStatCard(
      {required this.icon,
      required this.label,
      required this.value,
      this.iconColor});

  @override
  Widget build(BuildContext context) {
    final Color resolvedIconColor = iconColor ??
        (label == 'Избранное'
            ? const Color(0xFFA4ACB6)
            : const Color(0xFF1D293A));
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF2F6),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Icon(
              icon,
              color: resolvedIconColor,
              size: 18,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                label,
                style: GoogleFonts.inter(
                    fontSize: 12, fontWeight: FontWeight.w500),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                softWrap: false,
              ),
              Text(
                value,
                style: GoogleFonts.inter(fontSize: 8, color: Color(0xFF7B7B7B)),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                softWrap: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
