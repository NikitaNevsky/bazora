import '../database.dart';

class OrdersDetailedViewTable extends SupabaseTable<OrdersDetailedViewRow> {
  @override
  String get tableName => 'orders_detailed_view';

  @override
  OrdersDetailedViewRow createRow(Map<String, dynamic> data) =>
      OrdersDetailedViewRow(data);
}

class OrdersDetailedViewRow extends SupabaseDataRow {
  OrdersDetailedViewRow(super.data);

  @override
  SupabaseTable get table => OrdersDetailedViewTable();

  String? get orderId => getField<String>('order_id');
  set orderId(String? value) => setField<String>('order_id', value);

  DateTime? get orderCreatedAt => getField<DateTime>('order_created_at');
  set orderCreatedAt(DateTime? value) =>
      setField<DateTime>('order_created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get userName => getField<String>('user_name');
  set userName(String? value) => setField<String>('user_name', value);

  String? get userSurname => getField<String>('user_surname');
  set userSurname(String? value) => setField<String>('user_surname', value);

  String? get userPatronymic => getField<String>('user_patronymic');
  set userPatronymic(String? value) =>
      setField<String>('user_patronymic', value);

  String? get userPhone => getField<String>('user_phone');
  set userPhone(String? value) => setField<String>('user_phone', value);

  String? get userBlurHash => getField<String>('user_blur_hash');
  set userBlurHash(String? value) => setField<String>('user_blur_hash', value);

  String? get userPhotoUrl => getField<String>('user_photo_url');
  set userPhotoUrl(String? value) => setField<String>('user_photo_url', value);

  int? get pointId => getField<int>('point_id');
  set pointId(int? value) => setField<int>('point_id', value);

  bool? get orderConfirmed => getField<bool>('order_confirmed');
  set orderConfirmed(bool? value) => setField<bool>('order_confirmed', value);

  double? get cashBackPayment => getField<double>('cash_back_payment');
  set cashBackPayment(double? value) =>
      setField<double>('cash_back_payment', value);

  String? get deliveryAddress => getField<String>('delivery_address');
  set deliveryAddress(String? value) =>
      setField<String>('delivery_address', value);

  bool? get selfDelivery => getField<bool>('self_delivery');
  set selfDelivery(bool? value) => setField<bool>('self_delivery', value);

  double? get cashBack => getField<double>('cash_back');
  set cashBack(double? value) => setField<double>('cash_back', value);

  double? get amount => getField<double>('amount');
  set amount(double? value) => setField<double>('amount', value);

  bool? get retailFormat => getField<bool>('retail_format');
  set retailFormat(bool? value) => setField<bool>('retail_format', value);

  double? get discount => getField<double>('discount');
  set discount(double? value) => setField<double>('discount', value);

  double? get totalPurchasePrice => getField<double>('total_purchase_price');
  set totalPurchasePrice(double? value) =>
      setField<double>('total_purchase_price', value);

  double? get profit => getField<double>('profit');
  set profit(double? value) => setField<double>('profit', value);

  int? get statusId => getField<int>('status_id');
  set statusId(int? value) => setField<int>('status_id', value);

  String? get statusName => getField<String>('status_name');
  set statusName(String? value) => setField<String>('status_name', value);

  String? get statusNameHy => getField<String>('status_name_hy');
  set statusNameHy(String? value) => setField<String>('status_name_hy', value);

  String? get orderNumber => getField<String>('order_number');
  set orderNumber(String? value) => setField<String>('order_number', value);

  int? get currencyId => getField<int>('currency_id');
  set currencyId(int? value) => setField<int>('currency_id', value);

  String? get currencyName => getField<String>('currency_name');
  set currencyName(String? value) => setField<String>('currency_name', value);

  String? get pointCity => getField<String>('point_city');
  set pointCity(String? value) => setField<String>('point_city', value);

  String? get pointAddress => getField<String>('point_address');
  set pointAddress(String? value) => setField<String>('point_address', value);

  String? get pointName => getField<String>('point_name');
  set pointName(String? value) => setField<String>('point_name', value);

  String? get chatId => getField<String>('chat_id');
  set chatId(String? value) => setField<String>('chat_id', value);

  int? get totalMessages => getField<int>('total_messages');
  set totalMessages(int? value) => setField<int>('total_messages', value);

  int? get readMessages => getField<int>('read_messages');
  set readMessages(int? value) => setField<int>('read_messages', value);

  int? get productCount => getField<int>('product_count');
  set productCount(int? value) => setField<int>('product_count', value);

  String? get firstProductImageUrl =>
      getField<String>('first_product_image_url');
  set firstProductImageUrl(String? value) =>
      setField<String>('first_product_image_url', value);

  String? get firstProductBlurhash =>
      getField<String>('first_product_blurhash');
  set firstProductBlurhash(String? value) =>
      setField<String>('first_product_blurhash', value);

  DateTime? get dateOfShipment => getField<DateTime>('date_of_shipment');
  set dateOfShipment(DateTime? value) =>
      setField<DateTime>('date_of_shipment', value);
}
