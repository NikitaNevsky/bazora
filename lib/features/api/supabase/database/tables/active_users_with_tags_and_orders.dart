import '../database.dart';

class ActiveUsersWithTagsAndOrdersTable
    extends SupabaseTable<ActiveUsersWithTagsAndOrdersRow> {
  @override
  String get tableName => 'active_users_with_tags_and_orders';

  @override
  ActiveUsersWithTagsAndOrdersRow createRow(Map<String, dynamic> data) =>
      ActiveUsersWithTagsAndOrdersRow(data);
}

class ActiveUsersWithTagsAndOrdersRow extends SupabaseDataRow {
  ActiveUsersWithTagsAndOrdersRow(super.data);

  @override
  SupabaseTable get table => ActiveUsersWithTagsAndOrdersTable();

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  DateTime? get userCreatedAt => getField<DateTime>('user_created_at');
  set userCreatedAt(DateTime? value) =>
      setField<DateTime>('user_created_at', value);

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

  String? get mainRolle => getField<String>('main_rolle');
  set mainRolle(String? value) => setField<String>('main_rolle', value);

  bool? get verified => getField<bool>('verified');
  set verified(bool? value) => setField<bool>('verified', value);

  String? get rolle => getField<String>('rolle');
  set rolle(String? value) => setField<String>('rolle', value);

  dynamic get permissions => getField<dynamic>('permissions');
  set permissions(dynamic value) => setField<dynamic>('permissions', value);

  bool? get blocked => getField<bool>('blocked');
  set blocked(bool? value) => setField<bool>('blocked', value);

  DateTime? get birthday => getField<DateTime>('birthday');
  set birthday(DateTime? value) => setField<DateTime>('birthday', value);

  String? get referralCode => getField<String>('referral_code');
  set referralCode(String? value) => setField<String>('referral_code', value);

  double? get totalCashback => getField<double>('total_cashback');
  set totalCashback(double? value) => setField<double>('total_cashback', value);

  double? get totalOrdersAmountRu => getField<double>('total_orders_amount_ru');
  set totalOrdersAmountRu(double? value) =>
      setField<double>('total_orders_amount_ru', value);

  double? get totalOrdersAmountHy => getField<double>('total_orders_amount_hy');
  set totalOrdersAmountHy(double? value) =>
      setField<double>('total_orders_amount_hy', value);

  int? get mainCurrency => getField<int>('main_currency');
  set mainCurrency(int? value) => setField<int>('main_currency', value);

  int? get cashBackCurrencyId => getField<int>('cash_back_currency_id');
  set cashBackCurrencyId(int? value) =>
      setField<int>('cash_back_currency_id', value);

  String? get userTag => getField<String>('user_tag');
  set userTag(String? value) => setField<String>('user_tag', value);

  int? get orderCount => getField<int>('order_count');
  set orderCount(int? value) => setField<int>('order_count', value);

  bool? get hasBulkProfile => getField<bool>('has_bulk_profile');
  set hasBulkProfile(bool? value) => setField<bool>('has_bulk_profile', value);

  String? get requestStatus => getField<String>('request_status');
  set requestStatus(String? value) => setField<String>('request_status', value);
}
