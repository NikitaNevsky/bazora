import '../database.dart';

class ProductVariantsViewTable extends SupabaseTable<ProductVariantsViewRow> {
  @override
  String get tableName => 'product_variants_view';

  @override
  ProductVariantsViewRow createRow(Map<String, dynamic> data) =>
      ProductVariantsViewRow(data);
}

class ProductVariantsViewRow extends SupabaseDataRow {
  ProductVariantsViewRow(super.data);

  @override
  SupabaseTable get table => ProductVariantsViewTable();

  String? get variantId => getField<String>('variant_id');
  set variantId(String? value) => setField<String>('variant_id', value);

  String? get productId => getField<String>('product_id');
  set productId(String? value) => setField<String>('product_id', value);

  double? get priceRetail => getField<double>('price_retail');
  set priceRetail(double? value) => setField<double>('price_retail', value);

  int? get variantStock => getField<int>('variant_stock');
  set variantStock(int? value) => setField<int>('variant_stock', value);

  String? get sku => getField<String>('sku');
  set sku(String? value) => setField<String>('sku', value);

  bool? get variantIsDelete => getField<bool>('variant_is_delete');
  set variantIsDelete(bool? value) =>
      setField<bool>('variant_is_delete', value);

  bool? get variantIsArchive => getField<bool>('variant_is_archive');
  set variantIsArchive(bool? value) =>
      setField<bool>('variant_is_archive', value);

  double? get priceBulk => getField<double>('price_bulk');
  set priceBulk(double? value) => setField<double>('price_bulk', value);

  String? get article => getField<String>('article');
  set article(String? value) => setField<String>('article', value);

  dynamic get attributes => getField<dynamic>('attributes');
  set attributes(dynamic value) => setField<dynamic>('attributes', value);

  dynamic get priceStockData => getField<dynamic>('price_stock_data');
  set priceStockData(dynamic value) =>
      setField<dynamic>('price_stock_data', value);
}
