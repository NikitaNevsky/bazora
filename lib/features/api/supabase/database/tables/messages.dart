import '../database.dart';

class MessagesTable extends SupabaseTable<MessagesRow> {
  @override
  String get tableName => 'messages';

  @override
  MessagesRow createRow(Map<String, dynamic> data) => MessagesRow(data);
}

class MessagesRow extends SupabaseDataRow {
  MessagesRow(super.data);

  @override
  SupabaseTable get table => MessagesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get chatId => getField<String>('chat_id')!;
  set chatId(String value) => setField<String>('chat_id', value);

  String? get message => getField<String>('message');
  set message(String? value) => setField<String>('message', value);

  bool get isAudio => getField<bool>('is_audio')!;
  set isAudio(bool value) => setField<bool>('is_audio', value);

  bool get isDelete => getField<bool>('is_delete')!;
  set isDelete(bool value) => setField<bool>('is_delete', value);

  String get authorId => getField<String>('author_id')!;
  set authorId(String value) => setField<String>('author_id', value);

  bool get readIt => getField<bool>('read_it')!;
  set readIt(bool value) => setField<bool>('read_it', value);

  String? get productId => getField<String>('product_id');
  set productId(String? value) => setField<String>('product_id', value);

  String? get orderId => getField<String>('order_id');
  set orderId(String? value) => setField<String>('order_id', value);

  bool get isPhoto => getField<bool>('is_photo')!;
  set isPhoto(bool value) => setField<bool>('is_photo', value);

  bool get isDocument => getField<bool>('is_document')!;
  set isDocument(bool value) => setField<bool>('is_document', value);

  String? get mediaUrl => getField<String>('media_url');
  set mediaUrl(String? value) => setField<String>('media_url', value);

  String? get blurhash => getField<String>('blurhash');
  set blurhash(String? value) => setField<String>('blurhash', value);

  int? get duration => getField<int>('duration');
  set duration(int? value) => setField<int>('duration', value);
}
