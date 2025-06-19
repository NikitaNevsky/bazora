import '../database.dart';

class UserTagsTable extends SupabaseTable<UserTagsRow> {
  @override
  String get tableName => 'user_tags';

  @override
  UserTagsRow createRow(Map<String, dynamic> data) => UserTagsRow(data);
}

class UserTagsRow extends SupabaseDataRow {
  UserTagsRow(super.data);

  @override
  SupabaseTable get table => UserTagsTable();

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get tagId => getField<int>('tag_id')!;
  set tagId(int value) => setField<int>('tag_id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);
}
