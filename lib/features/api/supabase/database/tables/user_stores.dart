import '../database.dart';

class UserStoresTable extends SupabaseTable<UserStoresRow> {
  @override
  String get tableName => 'user_stores';

  @override
  UserStoresRow createRow(Map<String, dynamic> data) => UserStoresRow(data);
}

class UserStoresRow extends SupabaseDataRow {
  UserStoresRow(super.data);

  @override
  SupabaseTable get table => UserStoresTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get address => getField<String>('address')!;
  set address(String value) => setField<String>('address', value);

  String get phone => getField<String>('phone')!;
  set phone(String value) => setField<String>('phone', value);

  String get inn => getField<String>('inn')!;
  set inn(String value) => setField<String>('inn', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String get ownerId => getField<String>('owner_id')!;
  set ownerId(String value) => setField<String>('owner_id', value);

  bool get isDelete => getField<bool>('is_delete')!;
  set isDelete(bool value) => setField<bool>('is_delete', value);

  bool get verified => getField<bool>('verified')!;
  set verified(bool value) => setField<bool>('verified', value);

  bool get deleteRequest => getField<bool>('delete_request')!;
  set deleteRequest(bool value) => setField<bool>('delete_request', value);
}
