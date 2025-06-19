import '../database.dart';

class ProductAttributeValuesTable
    extends SupabaseTable<ProductAttributeValuesRow> {
  @override
  String get tableName => 'product_attribute_values';

  @override
  ProductAttributeValuesRow createRow(Map<String, dynamic> data) =>
      ProductAttributeValuesRow(data);
}

class ProductAttributeValuesRow extends SupabaseDataRow {
  ProductAttributeValuesRow(super.data);

  @override
  SupabaseTable get table => ProductAttributeValuesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get attributeId => getField<String>('attribute_id')!;
  set attributeId(String value) => setField<String>('attribute_id', value);

  String get value => getField<String>('value')!;
  set value(String value) => setField<String>('value', value);

  bool get isDelete => getField<bool>('is_delete')!;
  set isDelete(bool value) => setField<bool>('is_delete', value);

  String get hex => getField<String>('hex')!;
  set hex(String value) => setField<String>('hex', value);
}
