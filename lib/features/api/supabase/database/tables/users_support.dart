import '../database.dart';

class UsersSupportTable extends SupabaseTable<UsersSupportRow> {
  @override
  String get tableName => 'users_support';

  @override
  UsersSupportRow createRow(Map<String, dynamic> data) => UsersSupportRow(data);
}

class UsersSupportRow extends SupabaseDataRow {
  UsersSupportRow(super.data);

  @override
  SupabaseTable get table => UsersSupportTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get supportId => getField<String>('support_id')!;
  set supportId(String value) => setField<String>('support_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
