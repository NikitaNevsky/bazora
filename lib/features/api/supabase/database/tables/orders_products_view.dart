import '../database.dart';

class OrdersProductsViewTable extends SupabaseTable<OrdersProductsViewRow> {
  @override
  String get tableName => 'orders_products_view';

  @override
  OrdersProductsViewRow createRow(Map<String, dynamic> data) =>
      OrdersProductsViewRow(data);
}

class OrdersProductsViewRow extends SupabaseDataRow {
  OrdersProductsViewRow(super.data);

  @override
  SupabaseTable get table => OrdersProductsViewTable();

  String? get orderProductId => getField<String>('order_product_id');
  set orderProductId(String? value) =>
      setField<String>('order_product_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get productVariantId => getField<String>('product_variant_id');
  set productVariantId(String? value) =>
      setField<String>('product_variant_id', value);

  double? get price => getField<double>('price');
  set price(double? value) => setField<double>('price', value);

  double? get purshasePrice => getField<double>('purshase_price');
  set purshasePrice(double? value) => setField<double>('purshase_price', value);

  int? get currencyPrice => getField<int>('currency_price');
  set currencyPrice(int? value) => setField<int>('currency_price', value);

  double? get currencyPurshasePrice =>
      getField<double>('currency_purshase_price');
  set currencyPurshasePrice(double? value) =>
      setField<double>('currency_purshase_price', value);

  int? get quantity => getField<int>('quantity');
  set quantity(int? value) => setField<int>('quantity', value);

  double? get goodAmount => getField<double>('good_amount');
  set goodAmount(double? value) => setField<double>('good_amount', value);

  String? get orderId => getField<String>('order_id');
  set orderId(String? value) => setField<String>('order_id', value);

  bool? get retailFormat => getField<bool>('retail_format');
  set retailFormat(bool? value) => setField<bool>('retail_format', value);

  double? get cashBack => getField<double>('cash_back');
  set cashBack(double? value) => setField<double>('cash_back', value);

  String? get priceStockId => getField<String>('price_stock_id');
  set priceStockId(String? value) => setField<String>('price_stock_id', value);

  String? get productId => getField<String>('product_id');
  set productId(String? value) => setField<String>('product_id', value);

  double? get variantPriceRetail => getField<double>('variant_price_retail');
  set variantPriceRetail(double? value) =>
      setField<double>('variant_price_retail', value);

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

  double? get variantPriceBulk => getField<double>('variant_price_bulk');
  set variantPriceBulk(double? value) =>
      setField<double>('variant_price_bulk', value);

  String? get variantArticle => getField<String>('variant_article');
  set variantArticle(String? value) =>
      setField<String>('variant_article', value);

  dynamic get attributes => getField<dynamic>('attributes');
  set attributes(dynamic value) => setField<dynamic>('attributes', value);

  dynamic get images => getField<dynamic>('images');
  set images(dynamic value) => setField<dynamic>('images', value);

  dynamic get productTranslations => getField<dynamic>('product_translations');
  set productTranslations(dynamic value) =>
      setField<dynamic>('product_translations', value);
}
