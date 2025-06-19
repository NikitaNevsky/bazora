import '../database.dart';

class ProductAttributeTranslationsTable
    extends SupabaseTable<ProductAttributeTranslationsRow> {
  @override
  String get tableName => 'product_attribute_translations';

  @override
  ProductAttributeTranslationsRow createRow(Map<String, dynamic> data) =>
      ProductAttributeTranslationsRow(data);
}

class ProductAttributeTranslationsRow extends SupabaseDataRow {
  ProductAttributeTranslationsRow(super.data);

  @override
  SupabaseTable get table => ProductAttributeTranslationsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get attributeId => getField<String>('attribute_id')!;
  set attributeId(String value) => setField<String>('attribute_id', value);

  String get languageCode => getField<String>('language_code')!;
  set languageCode(String value) => setField<String>('language_code', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);
}
