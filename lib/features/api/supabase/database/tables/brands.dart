import '../database.dart';

class BrandsTable extends SupabaseTable<BrandsRow> {
  @override
  String get tableName => 'brands';

  @override
  BrandsRow createRow(Map<String, dynamic> data) => BrandsRow(data);
}

class BrandsRow extends SupabaseDataRow {
  BrandsRow(super.data);

  @override
  SupabaseTable get table => BrandsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);
}
