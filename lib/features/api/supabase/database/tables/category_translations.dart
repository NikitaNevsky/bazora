import '../database.dart';

class CategoryTranslationsTable extends SupabaseTable<CategoryTranslationsRow> {
  @override
  String get tableName => 'category_translations';

  @override
  CategoryTranslationsRow createRow(Map<String, dynamic> data) =>
      CategoryTranslationsRow(data);
}

class CategoryTranslationsRow extends SupabaseDataRow {
  CategoryTranslationsRow(super.data);

  @override
  SupabaseTable get table => CategoryTranslationsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get categoryId => getField<String>('category_id')!;
  set categoryId(String value) => setField<String>('category_id', value);

  String get languageCode => getField<String>('language_code')!;
  set languageCode(String value) => setField<String>('language_code', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);
}
