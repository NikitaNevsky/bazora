part of "app_routes.dart";

sealed class Routes { Routes._();

  static const String initial = "/";

  /// Auth
  static const String auth = "/auth";
  static const String login = "/login";
  static const String explore = "/explore";
  static const String otp = "/otp";
  static const String profilePage = "/profilePage";
  static const String filterPage = "/filterPage";
  static const String chatPage3 = "/chatPage3";
  static const String buyFormat = "/buyFormat";
  static const String notificationPage = "/notificationPage";
  static const String productDetails = "/productDetails";
  static const String referenceInfoPage = "/referenceInfoPage";
  static const String supportPage = "/supportPage";
  static const String favoritePage = "/favoritePage";
  static const String referalCodePage = "/referalCodePage";
  static const String createProfilePage = "/createProfilePage";
  static const String switchValueScreen = "/switchValueScreen";
  static const String storeDetailsScreen = "/storeDetailsScreen";
  static const String chooseCountryScreen = "/chooseCountryScreen";
  static const String selectNearestDelivery = "/selectNearestDelivery";
  static const String deliveryPickupRight = "/deliveryPickupRight";
  static const String paymentMethodRight = "/PaymentMethodRight";






  /// internet connection
  static const String noInternet = "/no-internet";

}
