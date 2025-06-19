import '../database.dart';

class UsersTable extends SupabaseTable<UsersRow> {
  @override
  String get tableName => 'users';

  @override
  UsersRow createRow(Map<String, dynamic> data) => UsersRow(data);
}

class UsersRow extends SupabaseDataRow {
  UsersRow(super.data);

  @override
  SupabaseTable get table => UsersTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get surname => getField<String>('surname');
  set surname(String? value) => setField<String>('surname', value);

  String? get patronymic => getField<String>('patronymic');
  set patronymic(String? value) => setField<String>('patronymic', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  String? get photoUrl => getField<String>('photo_url');
  set photoUrl(String? value) => setField<String>('photo_url', value);

  String? get blurHash => getField<String>('blur_hash');
  set blurHash(String? value) => setField<String>('blur_hash', value);

  String get mainRolle => getField<String>('main_rolle')!;
  set mainRolle(String value) => setField<String>('main_rolle', value);

  bool get verified => getField<bool>('verified')!;
  set verified(bool value) => setField<bool>('verified', value);

  String? get rolle => getField<String>('rolle');
  set rolle(String? value) => setField<String>('rolle', value);

  dynamic get permissions => getField<dynamic>('permissions');
  set permissions(dynamic value) => setField<dynamic>('permissions', value);

  bool get blocked => getField<bool>('blocked')!;
  set blocked(bool value) => setField<bool>('blocked', value);

  DateTime? get birthday => getField<DateTime>('birthday');
  set birthday(DateTime? value) => setField<DateTime>('birthday', value);

  bool get isDelete => getField<bool>('is_delete')!;
  set isDelete(bool value) => setField<bool>('is_delete', value);

  String? get referralCode => getField<String>('referral_code');
  set referralCode(String? value) => setField<String>('referral_code', value);

  int? get userTag => getField<int>('user_tag');
  set userTag(int? value) => setField<int>('user_tag', value);

  double get totalCashback => getField<double>('total_cashback')!;
  set totalCashback(double value) => setField<double>('total_cashback', value);

  int? get cashBackCurrencyId => getField<int>('cash_back_currency_id');
  set cashBackCurrencyId(int? value) =>
      setField<int>('cash_back_currency_id', value);

  double get totalOrdersAmountRu => getField<double>('total_orders_amount_ru')!;
  set totalOrdersAmountRu(double value) =>
      setField<double>('total_orders_amount_ru', value);

  double get totalOrdersAmountHy => getField<double>('total_orders_amount_hy')!;
  set totalOrdersAmountHy(double value) =>
      setField<double>('total_orders_amount_hy', value);

  int? get mainCurrency => getField<int>('main_currency');
  set mainCurrency(int? value) => setField<int>('main_currency', value);

  bool get rejected => getField<bool>('rejected')!;
  set rejected(bool value) => setField<bool>('rejected', value);

  int? get countryId => getField<int>('country_id');
  set countryId(int? value) => setField<int>('country_id', value);

  bool get hasBulkProfile => getField<bool>('has_bulk_profile')!;
  set hasBulkProfile(bool value) => setField<bool>('has_bulk_profile', value);

  double get cashBack => getField<double>('cash_back')!;
  set cashBack(double value) => setField<double>('cash_back', value);

  String get requestStatus => getField<String>('request_status')!;
  set requestStatus(String value) => setField<String>('request_status', value);

  dynamic get userCategories => getField<dynamic>('user_categories');
  set userCategories(dynamic value) =>
      setField<dynamic>('user_categories', value);

  String? get supportEmail => getField<String>('support_email');
  set supportEmail(String? value) => setField<String>('support_email', value);

  String? get supportPhone => getField<String>('support_phone');
  set supportPhone(String? value) => setField<String>('support_phone', value);

  String? get displayName => getField<String>('display_name');
  set displayName(String? value) => setField<String>('display_name', value);
}
