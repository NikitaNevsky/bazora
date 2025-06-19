import '../database.dart';

class OrdersProductsTable extends SupabaseTable<OrdersProductsRow> {
  @override
  String get tableName => 'orders_products';

  @override
  OrdersProductsRow createRow(Map<String, dynamic> data) =>
      OrdersProductsRow(data);
}

class OrdersProductsRow extends SupabaseDataRow {
  OrdersProductsRow(super.data);

  @override
  SupabaseTable get table => OrdersProductsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get productVariantId => getField<String>('product_variant_id')!;
  set productVariantId(String value) =>
      setField<String>('product_variant_id', value);

  double get price => getField<double>('price')!;
  set price(double value) => setField<double>('price', value);

  double get purshasePrice => getField<double>('purshase_price')!;
  set purshasePrice(double value) => setField<double>('purshase_price', value);

  int get currencyPrice => getField<int>('currency_price')!;
  set currencyPrice(int value) => setField<int>('currency_price', value);

  double get currencyPurshasePrice =>
      getField<double>('currency_purshase_price')!;
  set currencyPurshasePrice(double value) =>
      setField<double>('currency_purshase_price', value);

  int get quantity => getField<int>('quantity')!;
  set quantity(int value) => setField<int>('quantity', value);

  double get goodAmount => getField<double>('good_amount')!;
  set goodAmount(double value) => setField<double>('good_amount', value);

  String get orderId => getField<String>('order_id')!;
  set orderId(String value) => setField<String>('order_id', value);

  bool get retailFormat => getField<bool>('retail_format')!;
  set retailFormat(bool value) => setField<bool>('retail_format', value);

  String get priceStockId => getField<String>('price_stock_id')!;
  set priceStockId(String value) => setField<String>('price_stock_id', value);

  double get cashBack => getField<double>('cash_back')!;
  set cashBack(double value) => setField<double>('cash_back', value);

  double get goodPurshase => getField<double>('good_purshase')!;
  set goodPurshase(double value) => setField<double>('good_purshase', value);
}
