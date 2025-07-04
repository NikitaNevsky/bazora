import "package:bazora/features/profile/model/users_response.dart";
import "package:flutter/material.dart";
import "package:hive/hive.dart";
import "package:bazora/constants/constants.dart";
import "package:bazora/core/utils/utils.dart";

final class LocalSource {
  LocalSource(this.box);

  final Box<dynamic> box;

  bool get hasProfile => box.get(AppKeys.hasProfile, defaultValue: false);

  Future<void> setHasProfile({required bool value}) async {
    await box.put(AppKeys.hasProfile, value);
  }

  Future<void> setLocale(String locale) async {
    await box.put(AppKeys.locale, locale);
  }

  String get locale => box.get(AppKeys.locale, defaultValue: defaultLocale);

  ThemeMode get themeMode => switch (box.get(AppKeys.themeMode)) {
        "system" => ThemeMode.system,
        "light" => ThemeMode.light,
        "dark" => ThemeMode.dark,
        _ => ThemeMode.system,
      };

  Future<void> setThemeMode(ThemeMode mode) async {
    await box.put(AppKeys.themeMode, mode.name);
  }


  Future<void> setAccessToken(String accessToken) async {
    await box.put(AppKeys.accessToken, accessToken);
  }
  String get accessToken => box.get(AppKeys.accessToken, defaultValue: "");

  Future<void> setRefreshToken(String refreshToken) async {
    await box.put(AppKeys.refreshToken, refreshToken);
  }
  Future<void> setFirstName(String firstName) async {
    await box.put(AppKeys.firstname, firstName);
  }
  String getFirstName() => box.get(AppKeys.firstname, defaultValue: "");


  Future<void> setLastName(String lastName) async {
    await box.put(AppKeys.lastname, lastName);
  }
  String getLastName() => box.get(AppKeys.lastname, defaultValue: "");


  Future<void> setEmail(String email) async {
    await box.put(AppKeys.email, email);
  }
  String get email => box.get(AppKeys.email, defaultValue: "");


  Future<void> setPassword(String password) async {
    await box.put(AppKeys.password, password);
  }
  String? get password => box.get(AppKeys.password);


  Future<void> setHasOnboarding({ required bool value }) async {
    await box.put(AppKeys.hasOnboarding, value);
  }
  bool get hasOnboarding => box.get(AppKeys.hasOnboarding, defaultValue: true);


  Future<void> setLanguageImage(String password) async {
    await box.put(AppKeys.languageImage, password);
  }
  String? get languageImage => box.get(AppKeys.languageImage);

  Future<void> setLanguage(String language) async {
    await box.put(AppKeys.language, language);
  }
  String? get language => box.get(AppKeys.language);

  Future<void> setCityID(String cityID) async {
    await box.put(AppKeys.cityID, cityID);
  }
  String? get cityID => box.get(AppKeys.cityID);

  Future<void> setMyUserId(String myUserId) async {
    await box.put(AppKeys.myUserId, myUserId);
  }
  String? get myUserId => box.get(AppKeys.myUserId);

  Future<void> setReferralCode(String referralCode) async {
    await box.put(AppKeys.referralCode, referralCode);
  }
  String? get getReferralCode => box.get(AppKeys.referralCode);

  Future<void> setMyReferralCode(String myReferralCode) async {
    await box.put(AppKeys.myReferralCode, myReferralCode);
  }
  String? get getMyReferralCode => box.get(AppKeys.myReferralCode);

  Future<void> setMyPhoneNumber(String myPhone) async {
    await box.put(AppKeys.myPhone, myPhone);
  }
  String? get getMyPhoneNumber => box.get(AppKeys.myPhone);

  Future<void> setMyImageURL(String myImageURL) async {
    await box.put(AppKeys.myImageURL, myImageURL);
  }
  String? get getMyImageURL => box.get(AppKeys.myImageURL);

  Future<void> setMyCashBack(num cashBack) async {
    await box.put(AppKeys.myCashBack, cashBack);
  }
  num? get getMyCashBack => box.get(AppKeys.myCashBack);

  Future<void> setBirhtDay(String birhtDay) async {
    await box.put(AppKeys.birhtDay, birhtDay);
  }
  String? get getBirhtDay => box.get(AppKeys.birhtDay);


  Future<void> clear() async {
    await box.clear();
  }
}
