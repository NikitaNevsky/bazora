part of "app_routes.dart";

sealed class Routes { Routes._();

  static const String initial = "/";

  /// Auth
  static const String auth = "/auth";
  static const String login = "/login";
  static const String explore = "/explore";
  static const String otp = "/otp";
  static const String profilePage = "/profilePage";



  /// internet connection
  static const String noInternet = "/no-internet";

}
