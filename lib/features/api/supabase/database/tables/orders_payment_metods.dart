import '../database.dart';

class OrdersPaymentMetodsTable extends SupabaseTable<OrdersPaymentMetodsRow> {
  @override
  String get tableName => 'orders_payment_metods';

  @override
  OrdersPaymentMetodsRow createRow(Map<String, dynamic> data) =>
      OrdersPaymentMetodsRow(data);
}

class OrdersPaymentMetodsRow extends SupabaseDataRow {
  OrdersPaymentMetodsRow(super.data);

  @override
  SupabaseTable get table => OrdersPaymentMetodsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get orderId => getField<String>('order_id')!;
  set orderId(String value) => setField<String>('order_id', value);

  int get paymentMetod => getField<int>('payment_metod')!;
  set paymentMetod(int value) => setField<int>('payment_metod', value);

  double get amount => getField<double>('amount')!;
  set amount(double value) => setField<double>('amount', value);

  int get currencyId => getField<int>('currency_id')!;
  set currencyId(int value) => setField<int>('currency_id', value);
}
