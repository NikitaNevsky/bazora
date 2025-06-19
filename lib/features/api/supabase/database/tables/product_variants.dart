import '../database.dart';

class ProductVariantsTable extends SupabaseTable<ProductVariantsRow> {
  @override
  String get tableName => 'product_variants';

  @override
  ProductVariantsRow createRow(Map<String, dynamic> data) =>
      ProductVariantsRow(data);
}

class ProductVariantsRow extends SupabaseDataRow {
  ProductVariantsRow(super.data);

  @override
  SupabaseTable get table => ProductVariantsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get productId => getField<String>('product_id')!;
  set productId(String value) => setField<String>('product_id', value);

  double? get priceRetail => getField<double>('price_retail');
  set priceRetail(double? value) => setField<double>('price_retail', value);

  int get stock => getField<int>('stock')!;
  set stock(int value) => setField<int>('stock', value);

  String? get sku => getField<String>('sku');
  set sku(String? value) => setField<String>('sku', value);

  bool get isDelete => getField<bool>('is_delete')!;
  set isDelete(bool value) => setField<bool>('is_delete', value);

  bool get isArchive => getField<bool>('is_archive')!;
  set isArchive(bool value) => setField<bool>('is_archive', value);

  double? get priceBulk => getField<double>('price_bulk');
  set priceBulk(double? value) => setField<double>('price_bulk', value);

  String? get article => getField<String>('article');
  set article(String? value) => setField<String>('article', value);
}
