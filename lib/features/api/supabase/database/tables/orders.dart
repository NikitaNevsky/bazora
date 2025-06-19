import '../database.dart';

class OrdersTable extends SupabaseTable<OrdersRow> {
  @override
  String get tableName => 'orders';

  @override
  OrdersRow createRow(Map<String, dynamic> data) => OrdersRow(data);
}

class OrdersRow extends SupabaseDataRow {
  OrdersRow(super.data);

  @override
  SupabaseTable get table => OrdersTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  int get pointId => getField<int>('point_id')!;
  set pointId(int value) => setField<int>('point_id', value);

  double get amount => getField<double>('amount')!;
  set amount(double value) => setField<double>('amount', value);

  int get status => getField<int>('status')!;
  set status(int value) => setField<int>('status', value);

  String get number => getField<String>('number')!;
  set number(String value) => setField<String>('number', value);

  double get totalPurchasePrice => getField<double>('total_purchase_price')!;
  set totalPurchasePrice(double value) =>
      setField<double>('total_purchase_price', value);

  double get profit => getField<double>('profit')!;
  set profit(double value) => setField<double>('profit', value);

  int get currency => getField<int>('currency')!;
  set currency(int value) => setField<int>('currency', value);

  double get cashBack => getField<double>('cash_back')!;
  set cashBack(double value) => setField<double>('cash_back', value);

  bool get selfDelivery => getField<bool>('self_delivery')!;
  set selfDelivery(bool value) => setField<bool>('self_delivery', value);

  String? get deliveryAddress => getField<String>('delivery_address');
  set deliveryAddress(String? value) =>
      setField<String>('delivery_address', value);

  bool get orderConfirmed => getField<bool>('order_confirmed')!;
  set orderConfirmed(bool value) => setField<bool>('order_confirmed', value);

  double get discount => getField<double>('discount')!;
  set discount(double value) => setField<double>('discount', value);

  double get cashBackPayment => getField<double>('cash_back_payment')!;
  set cashBackPayment(double value) =>
      setField<double>('cash_back_payment', value);

  double get bankFee => getField<double>('bank_fee')!;
  set bankFee(double value) => setField<double>('bank_fee', value);

  bool get retailFormat => getField<bool>('retail_format')!;
  set retailFormat(bool value) => setField<bool>('retail_format', value);

  DateTime? get dateOfShipment => getField<DateTime>('date_of_shipment');
  set dateOfShipment(DateTime? value) =>
      setField<DateTime>('date_of_shipment', value);
}
