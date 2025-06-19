import '../database.dart';

class ChatsTable extends SupabaseTable<ChatsRow> {
  @override
  String get tableName => 'chats';

  @override
  ChatsRow createRow(Map<String, dynamic> data) => ChatsRow(data);
}

class ChatsRow extends SupabaseDataRow {
  ChatsRow(super.data);

  @override
  SupabaseTable get table => ChatsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get orderId => getField<String>('order_id');
  set orderId(String? value) => setField<String>('order_id', value);

  String? get chatOwnerId => getField<String>('chat_owner_id');
  set chatOwnerId(String? value) => setField<String>('chat_owner_id', value);

  String? get productId => getField<String>('product_id');
  set productId(String? value) => setField<String>('product_id', value);

  String? get productVariantId => getField<String>('product_variant_id');
  set productVariantId(String? value) =>
      setField<String>('product_variant_id', value);

  String? get lastMessage => getField<String>('last_message');
  set lastMessage(String? value) => setField<String>('last_message', value);

  double? get amount => getField<double>('amount');
  set amount(double? value) => setField<double>('amount', value);

  int? get currency => getField<int>('currency');
  set currency(int? value) => setField<int>('currency', value);

  String? get orderNumber => getField<String>('order_number');
  set orderNumber(String? value) => setField<String>('order_number', value);

  String? get goodName => getField<String>('good_name');
  set goodName(String? value) => setField<String>('good_name', value);

  int? get goodQw => getField<int>('good_qw');
  set goodQw(int? value) => setField<int>('good_qw', value);

  String? get imageUrl => getField<String>('image_url');
  set imageUrl(String? value) => setField<String>('image_url', value);

  String? get blurhash => getField<String>('blurhash');
  set blurhash(String? value) => setField<String>('blurhash', value);

  DateTime? get lastMessageAt => getField<DateTime>('last_message_at');
  set lastMessageAt(DateTime? value) =>
      setField<DateTime>('last_message_at', value);

  int? get orderStatus => getField<int>('order_status');
  set orderStatus(int? value) => setField<int>('order_status', value);

  int get unreadMessages => getField<int>('unread_messages')!;
  set unreadMessages(int value) => setField<int>('unread_messages', value);

  dynamic get orderStatusName => getField<dynamic>('order_status_name');
  set orderStatusName(dynamic value) =>
      setField<dynamic>('order_status_name', value);

  bool get supportChat => getField<bool>('support_chat')!;
  set supportChat(bool value) => setField<bool>('support_chat', value);
}
