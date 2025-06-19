import '../database.dart';

class ProductsTable extends SupabaseTable<ProductsRow> {
  @override
  String get tableName => 'products';

  @override
  ProductsRow createRow(Map<String, dynamic> data) => ProductsRow(data);
}

class ProductsRow extends SupabaseDataRow {
  ProductsRow(super.data);

  @override
  SupabaseTable get table => ProductsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  double? get price => getField<double>('price');
  set price(double? value) => setField<double>('price', value);

  bool get isDelete => getField<bool>('is_delete')!;
  set isDelete(bool value) => setField<bool>('is_delete', value);

  bool get isArchiv => getField<bool>('is_archiv')!;
  set isArchiv(bool value) => setField<bool>('is_archiv', value);

  String? get article => getField<String>('article');
  set article(String? value) => setField<String>('article', value);

  String? get descriptionBulk => getField<String>('description_bulk');
  set descriptionBulk(String? value) =>
      setField<String>('description_bulk', value);

  int? get minBulkValue => getField<int>('min_bulk_value');
  set minBulkValue(int? value) => setField<int>('min_bulk_value', value);

  String? get brandId => getField<String>('brand_id');
  set brandId(String? value) => setField<String>('brand_id', value);
}
