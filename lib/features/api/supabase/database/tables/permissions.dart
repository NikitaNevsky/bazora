import '../database.dart';

class PermissionsTable extends SupabaseTable<PermissionsRow> {
  @override
  String get tableName => 'permissions';

  @override
  PermissionsRow createRow(Map<String, dynamic> data) => PermissionsRow(data);
}

class PermissionsRow extends SupabaseDataRow {
  PermissionsRow(super.data);

  @override
  SupabaseTable get table => PermissionsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);
}
