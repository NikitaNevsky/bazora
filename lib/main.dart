// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:bazora/otp_screen.dart';
// import 'package:bazora/selectnearestdelivery.dart';
// import 'my_profile_page.dart';
// import 'catalogpage.dart';
// import 'profilepage.dart';
// import 'info1.dart' as info1;
// import 'info2.dart' as info2;
// import 'Productdetails.dart';
// import 'verification_code_screen.dart';
// import 'sixthcomponent.dart';
// import 'listofchats.dart';
// import 'storedetails.dart';
// import 'Reviewscreen.dart';
// import 'namedetails.dart';
// import 'new_image_pages/review_modal_right.dart';
// import 'new_image_pages/wholesale_page_right.dart';
// import 'package:bazora/new_image_pages/auth_page.dart';
// import 'package:bazora/new_image_pages/payment_method_right.dart';
// import 'package:bazora/chatpage3.dart';
// import 'new_image_pages/payment_method_disabled_right.dart';
// import 'new_image_pages/order_success_right.dart';
// import 'new_image_pages/order_details_right.dart';
// import 'new_image_pages/notifications_list_right.dart';
// import 'new_image_pages/empty_notifications_right.dart';
// import 'new_image_pages/edit_order_modal_right.dart';
// import 'new_image_pages/delivery_pickup_right.dart';
// import 'new_image_pages/delivery_courier_right.dart';
// import 'new_image_pages/delivery_courier_disabled_right.dart';
// import 'new_image_pages/confirm_receive_dialog_right.dart';
// import 'new_image_pages/cart_delete_dialog_right.dart';
// import 'new_image_pages/bonus_payment_filled_right.dart';
// import 'new_image_pages/bonus_payment_empty_right.dart';
// import 'new_image_pages/add_file_modal_right.dart';
// import 'new_image_pages/order_success_right.dart' as order_success;
// import 'switchvalue2.dart';
// import 'chatpage5.dart';
// import 'helpdesk.dart';
// import 'namedetails.dart';
// import 'new_image_pages/review_modal2.dart';
// import 'new_image_pages/notifications_list_right.dart';
// import 'otp_screen.dart';
// import 'Productdetails.dart';
// import 'filters.dart';
// import 'chatpage.dart';
// import 'chatpage3.dart';
// import 'new_image_pages/empty_chats_right.dart';
// import 'logout_confirmation_page.dart';
// import 'logout_confirmation2.dart';
// import 'splash.dart';
//
//
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter App',
//       debugShowCheckedModeBanner: false,
//       catalog: const CatalogPage(),
//       routes: {
//         '/catalog': (context) => const HomePageWidget(),
//         '/namedetails': (context) => const NameDetailsScreen(),
//         '/catalog': (context) => const CatalogPage(),
//         '/filters': (context) => const FilterPage(),
//         '/chat': (context) => const ChatPage(),
//         '/profile': (context) => const ProfilePage(),
//         '/neweditprofile': (context) => const NewEditProfilePage(),
//       },
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//     );
//   }
// }


import "dart:io";
import "package:bazora/services/notification_service.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:bazora/app.dart";
import "package:bazora/app_options.dart";
import "package:bazora/core/utils/utils.dart";
import "package:bazora/core/widgets/native_splash/flutter_native_splash.dart";
import "package:bazora/injector_container.dart" as di;
import "package:bazora/router/app_routes.dart";


void main() async {
  /// flutter_native_splash
  final WidgetsBinding binding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: binding);

  /// notification initialize
  await NotificationService.initialize();
  WidgetsFlutterBinding.ensureInitialized();
  /// bloc logger
  if (kDebugMode) {
    Bloc.observer = LogBlocObserver();
  }
  await di.init();

  /// global CERTIFICATE_VERIFY_FAILEd_KEY
  HttpOverrides.global = _HttpOverrides();
  runApp(
    ModelBinding(
      initialModel: AppOptions(
        themeMode: ThemeMode.light,
        locale: Locale(localSource.locale),
      ),
      child: const App(),
    ),
  );
  FlutterNativeSplash.remove();
}

class _HttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) =>
      super.createHttpClient(context)
        ..badCertificateCallback = (_, __, ___) => true;
}

/// flutter pub run flutter_launcher_icons:main
/// flutter run -d windows
/// flutter build apk --release
/// flutter build apk --split-per-abi
/// flutter build appbundle --release
/// flutter pub run build_runner watch --delete-conflicting-outputs
/// flutter pub ipa
/// dart fix --apply
