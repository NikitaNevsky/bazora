import '../database.dart';

class ProductPriceStockTable extends SupabaseTable<ProductPriceStockRow> {
  @override
  String get tableName => 'product_price_stock';

  @override
  ProductPriceStockRow createRow(Map<String, dynamic> data) =>
      ProductPriceStockRow(data);
}

class ProductPriceStockRow extends SupabaseDataRow {
  ProductPriceStockRow(super.data);

  @override
  SupabaseTable get table => ProductPriceStockTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get productId => getField<String>('product_id')!;
  set productId(String value) => setField<String>('product_id', value);

  String get productVariantId => getField<String>('product_variant_id')!;
  set productVariantId(String value) =>
      setField<String>('product_variant_id', value);

  int get pointId => getField<int>('point_id')!;
  set pointId(int value) => setField<int>('point_id', value);

  double get bulkPrice => getField<double>('bulk_price')!;
  set bulkPrice(double value) => setField<double>('bulk_price', value);

  double get retailPrice => getField<double>('retail_price')!;
  set retailPrice(double value) => setField<double>('retail_price', value);

  double get stock => getField<double>('stock')!;
  set stock(double value) => setField<double>('stock', value);

  int get currency => getField<int>('currency')!;
  set currency(int value) => setField<int>('currency', value);

  bool get available => getField<bool>('available')!;
  set available(bool value) => setField<bool>('available', value);

  double get purchasePrice => getField<double>('purchase_price')!;
  set purchasePrice(double value) => setField<double>('purchase_price', value);

  String? get pointName => getField<String>('point_name');
  set pointName(String? value) => setField<String>('point_name', value);

  double get cashbackRetail => getField<double>('cashback_retail')!;
  set cashbackRetail(double value) =>
      setField<double>('cashback_retail', value);

  double get cashbackBulk => getField<double>('cashback_bulk')!;
  set cashbackBulk(double value) => setField<double>('cashback_bulk', value);

  int get minQwForBulk => getField<int>('min_qw_for_bulk')!;
  set minQwForBulk(int value) => setField<int>('min_qw_for_bulk', value);

  double get marketPrice => getField<double>('market_price')!;
  set marketPrice(double value) => setField<double>('market_price', value);
}
