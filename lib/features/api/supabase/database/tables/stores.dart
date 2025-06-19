import '../database.dart';

class StoresTable extends SupabaseTable<StoresRow> {
  @override
  String get tableName => 'stores';

  @override
  StoresRow createRow(Map<String, dynamic> data) => StoresRow(data);
}

class StoresRow extends SupabaseDataRow {
  StoresRow(super.data);

  @override
  SupabaseTable get table => StoresTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  int? get countryId => getField<int>('country_id');
  set countryId(int? value) => setField<int>('country_id', value);

  bool get isDelete => getField<bool>('is_delete')!;
  set isDelete(bool value) => setField<bool>('is_delete', value);

  int? get rate => getField<int>('rate');
  set rate(int? value) => setField<int>('rate', value);

  String? get photoUrl => getField<String>('photo_url');
  set photoUrl(String? value) => setField<String>('photo_url', value);

  String? get blurhash => getField<String>('blurhash');
  set blurhash(String? value) => setField<String>('blurhash', value);

  int? get orderQw => getField<int>('order_qw');
  set orderQw(int? value) => setField<int>('order_qw', value);

  int? get subsridersQw => getField<int>('subsriders_qw');
  set subsridersQw(int? value) => setField<int>('subsriders_qw', value);
}
