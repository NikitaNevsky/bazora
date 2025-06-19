import '../database.dart';

class CurrencyTable extends SupabaseTable<CurrencyRow> {
  @override
  String get tableName => 'currency';

  @override
  CurrencyRow createRow(Map<String, dynamic> data) => CurrencyRow(data);
}

class CurrencyRow extends SupabaseDataRow {
  CurrencyRow(super.data);

  @override
  SupabaseTable get table => CurrencyTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);
}
