import "package:bazora/features/auth/presentation/referal_code/referal_code_page.dart";
import "package:bazora/features/catalog/presentation/product_detail/Productdetails.dart";
import "package:bazora/chatpage3.dart";
import "package:bazora/features/auth/presentation/auth_page.dart";
import "package:bazora/features/catalog/blocs/catalog_page_bloc.dart";
import "package:bazora/features/catalog/presentation/catalogpage.dart";
import "package:bazora/features/auth/presentation/otp/otp_screen.dart";
import "package:bazora/features/catalog/presentation/notification/notification_page.dart";
import "package:bazora/features/profile/presentation/favorite/favorite_page.dart";
import "package:bazora/features/profile/presentation/reference_information/reference_info_page.dart";
import "package:bazora/features/profile/presentation/support/support_page.dart";
import "package:bazora/filters.dart";
import "package:bazora/features/profile/presentation/edit_profile/profilepage.dart";
import "package:bazora/switchvalue2.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";
import "package:bazora/core/connectivity/network_info.dart";
import "package:bazora/core/local_source/local_source.dart";
import "package:bazora/features/main/presentation/bloc/main_bloc.dart";
import "package:bazora/features/main/presentation/pages/main_page.dart";
import "package:bazora/features/others/presentation/pages/internet_connection/internet_connection_page.dart";
import "package:bazora/features/others/presentation/pages/splash/splash_page.dart";
import "package:bazora/injector_container.dart";
import "package:package_info_plus/package_info_plus.dart";
part "name_routes.dart";

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final PackageInfo packageInfo = sl<PackageInfo>();
final NetworkInfo networkInfo = sl<NetworkInfo>();
final LocalSource localSource = sl<LocalSource>();

// final Chuck chuck = Chuck(navigatorKey: rootNavigatorKey);

final GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: Routes.initial,
  routes: <RouteBase>[
    GoRoute(
      path: Routes.initial,
      name: Routes.initial,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const SplashPage(),
    ),
    GoRoute(
      path: Routes.noInternet,
      name: Routes.noInternet,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const InternetConnectionPage(),
    ),
    StatefulShellRoute.indexedStack(
      parentNavigatorKey: rootNavigatorKey,
      builder: (
        _,
        GoRouterState state,
        StatefulNavigationShell navigationShell,
      ) => BlocProvider<MainBloc>(
        key: state.pageKey,
        create: (_) => sl<MainBloc>(),
        child: MainPage(
          key: state.pageKey,
          navigationShell: navigationShell,
        ),
      ),
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          initialLocation: Routes.explore,
          routes: <RouteBase>[
            GoRoute(
              path: Routes.explore,
              name: Routes.explore,
              builder: (_, __) =>
                 BlocProvider<CatalogPageBloc>(
                 create: (_) => sl<CatalogPageBloc>(),
                   child: const CatalogPage(),
                 ),
            ),
          ],
        ),
      ],
    ),

    /// Auth
    GoRoute(
      path: Routes.auth,
      name: Routes.auth,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const AuthPage(),
    ),

    GoRoute(
      path: Routes.profilePage,
      name: Routes.profilePage,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const ProfilePage(),
    ),

    GoRoute(
      path: Routes.chatPage3,
      name: Routes.chatPage3,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const ChatPage3(),
    ),

    GoRoute(
      path: Routes.buyFormat,
      name: Routes.buyFormat,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const SwitchValueScreen2(hasShop: true,),
    ),

    GoRoute(
      path: Routes.notificationPage,
      name: Routes.notificationPage,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const NotificationPage(),
    ),

    GoRoute(
      path: Routes.productDetails,
      name: Routes.productDetails,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const ProductDetails(),
    ),

    GoRoute(
      path: Routes.supportPage,
      name: Routes.supportPage,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const SupportPage(),
    ),

    GoRoute(
      path: Routes.favoritePage,
      name: Routes.favoritePage,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const FavoritePage(),
    ),

    GoRoute(
      path: Routes.referalCodePage,
      name: Routes.referalCodePage,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const ReferalCodePage(),
    ),

    GoRoute(
      path: Routes.referenceInfoPage,
      name: Routes.referenceInfoPage,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const ReferenceInfoPage(),
    ),

    GoRoute(
      path: Routes.filterPage,
      name: Routes.filterPage,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const FilterPage(),
    ),

    GoRoute(
      path: Routes.otp,
      name: Routes.otp,
      parentNavigatorKey: rootNavigatorKey,
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: OtpScreen(dataModel: state.extra! as OtpModel),
      ),
    ),

  ],
);

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) =>
    CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionDuration: const Duration(milliseconds: 350),
      reverseTransitionDuration: const Duration(milliseconds: 350),
      transitionsBuilder: (_, a1, a2, child) => SlideTransition(
        position: t1.animate(a1),
        child: child,
      ),
    );
Tween<Offset> t1 = Tween<Offset>(
  begin: const Offset(1, 0),
  end: Offset.zero,
);