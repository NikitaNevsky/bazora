import '../database.dart';

class ProductTranslationsTable extends SupabaseTable<ProductTranslationsRow> {
  @override
  String get tableName => 'product_translations';

  @override
  ProductTranslationsRow createRow(Map<String, dynamic> data) =>
      ProductTranslationsRow(data);
}

class ProductTranslationsRow extends SupabaseDataRow {
  ProductTranslationsRow(super.data);

  @override
  SupabaseTable get table => ProductTranslationsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get productId => getField<String>('product_id')!;
  set productId(String value) => setField<String>('product_id', value);

  String get languageCode => getField<String>('language_code')!;
  set languageCode(String value) => setField<String>('language_code', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get descriptionBulk => getField<String>('description_bulk');
  set descriptionBulk(String? value) =>
      setField<String>('description_bulk', value);
}
