import '../database.dart';

class ProductAttributesTable extends SupabaseTable<ProductAttributesRow> {
  @override
  String get tableName => 'product_attributes';

  @override
  ProductAttributesRow createRow(Map<String, dynamic> data) =>
      ProductAttributesRow(data);
}

class ProductAttributesRow extends SupabaseDataRow {
  ProductAttributesRow(super.data);

  @override
  SupabaseTable get table => ProductAttributesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  bool get isDelete => getField<bool>('is_delete')!;
  set isDelete(bool value) => setField<bool>('is_delete', value);

  bool get isColor => getField<bool>('is_color')!;
  set isColor(bool value) => setField<bool>('is_color', value);
}
