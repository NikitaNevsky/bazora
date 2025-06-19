import '../database.dart';

class CitiesTable extends SupabaseTable<CitiesRow> {
  @override
  String get tableName => 'cities';

  @override
  CitiesRow createRow(Map<String, dynamic> data) => CitiesRow(data);
}

class CitiesRow extends SupabaseDataRow {
  CitiesRow(super.data);

  @override
  SupabaseTable get table => CitiesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get nameRu => getField<String>('name_ru')!;
  set nameRu(String value) => setField<String>('name_ru', value);

  int get country => getField<int>('country')!;
  set country(int value) => setField<int>('country', value);

  String? get nameHy => getField<String>('name_hy');
  set nameHy(String? value) => setField<String>('name_hy', value);
}
