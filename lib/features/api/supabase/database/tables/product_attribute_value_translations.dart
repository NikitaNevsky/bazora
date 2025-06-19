import '../database.dart';

class ProductAttributeValueTranslationsTable
    extends SupabaseTable<ProductAttributeValueTranslationsRow> {
  @override
  String get tableName => 'product_attribute_value_translations';

  @override
  ProductAttributeValueTranslationsRow createRow(Map<String, dynamic> data) =>
      ProductAttributeValueTranslationsRow(data);
}

class ProductAttributeValueTranslationsRow extends SupabaseDataRow {
  ProductAttributeValueTranslationsRow(super.data);

  @override
  SupabaseTable get table => ProductAttributeValueTranslationsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get valueId => getField<String>('value_id')!;
  set valueId(String value) => setField<String>('value_id', value);

  String get languageCode => getField<String>('language_code')!;
  set languageCode(String value) => setField<String>('language_code', value);

  String get value => getField<String>('value')!;
  set value(String value) => setField<String>('value', value);
}
