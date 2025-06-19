import '../database.dart';

class MessageMediaTable extends SupabaseTable<MessageMediaRow> {
  @override
  String get tableName => 'message_media';

  @override
  MessageMediaRow createRow(Map<String, dynamic> data) => MessageMediaRow(data);
}

class MessageMediaRow extends SupabaseDataRow {
  MessageMediaRow(super.data);

  @override
  SupabaseTable get table => MessageMediaTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  bool get isAudio => getField<bool>('is_audio')!;
  set isAudio(bool value) => setField<bool>('is_audio', value);

  bool get isPhoto => getField<bool>('is_photo')!;
  set isPhoto(bool value) => setField<bool>('is_photo', value);

  String? get audioUrl => getField<String>('audio_url');
  set audioUrl(String? value) => setField<String>('audio_url', value);

  String? get photoUrl => getField<String>('photo_url');
  set photoUrl(String? value) => setField<String>('photo_url', value);

  String? get blurhash => getField<String>('blurhash');
  set blurhash(String? value) => setField<String>('blurhash', value);

  String? get messageId => getField<String>('message_id');
  set messageId(String? value) => setField<String>('message_id', value);

  bool get isDelete => getField<bool>('is_delete')!;
  set isDelete(bool value) => setField<bool>('is_delete', value);
}
