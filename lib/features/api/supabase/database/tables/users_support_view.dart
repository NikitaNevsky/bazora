import '../database.dart';

class UsersSupportViewTable extends SupabaseTable<UsersSupportViewRow> {
  @override
  String get tableName => 'users_support_view';

  @override
  UsersSupportViewRow createRow(Map<String, dynamic> data) =>
      UsersSupportViewRow(data);
}

class UsersSupportViewRow extends SupabaseDataRow {
  UsersSupportViewRow(super.data);

  @override
  SupabaseTable get table => UsersSupportViewTable();

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get supportId => getField<String>('support_id');
  set supportId(String? value) => setField<String>('support_id', value);

  String? get supportName => getField<String>('support_name');
  set supportName(String? value) => setField<String>('support_name', value);

  String? get supportSurname => getField<String>('support_surname');
  set supportSurname(String? value) =>
      setField<String>('support_surname', value);

  String? get supportPatronymic => getField<String>('support_patronymic');
  set supportPatronymic(String? value) =>
      setField<String>('support_patronymic', value);

  String? get supportEmail => getField<String>('support_email');
  set supportEmail(String? value) => setField<String>('support_email', value);

  String? get supportPhone => getField<String>('support_phone');
  set supportPhone(String? value) => setField<String>('support_phone', value);

  String? get supportPhotoUrl => getField<String>('support_photo_url');
  set supportPhotoUrl(String? value) =>
      setField<String>('support_photo_url', value);

  String? get supportBlurHash => getField<String>('support_blur_hash');
  set supportBlurHash(String? value) =>
      setField<String>('support_blur_hash', value);

  String? get supportMainRole => getField<String>('support_main_role');
  set supportMainRole(String? value) =>
      setField<String>('support_main_role', value);

  bool? get supportVerified => getField<bool>('support_verified');
  set supportVerified(bool? value) => setField<bool>('support_verified', value);

  String? get supportRole => getField<String>('support_role');
  set supportRole(String? value) => setField<String>('support_role', value);

  dynamic get supportPermissions => getField<dynamic>('support_permissions');
  set supportPermissions(dynamic value) =>
      setField<dynamic>('support_permissions', value);

  bool? get supportBlocked => getField<bool>('support_blocked');
  set supportBlocked(bool? value) => setField<bool>('support_blocked', value);

  DateTime? get supportBirthday => getField<DateTime>('support_birthday');
  set supportBirthday(DateTime? value) =>
      setField<DateTime>('support_birthday', value);

  bool? get supportIsDelete => getField<bool>('support_is_delete');
  set supportIsDelete(bool? value) =>
      setField<bool>('support_is_delete', value);

  String? get supportSupportEmail => getField<String>('support_support_email');
  set supportSupportEmail(String? value) =>
      setField<String>('support_support_email', value);

  String? get supportSupportPhone => getField<String>('support_support_phone');
  set supportSupportPhone(String? value) =>
      setField<String>('support_support_phone', value);

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  String? get supportDisplayName => getField<String>('support_display_name');
  set supportDisplayName(String? value) =>
      setField<String>('support_display_name', value);
}
