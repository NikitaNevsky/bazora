import '../database.dart';

class MessageDetailsTable extends SupabaseTable<MessageDetailsRow> {
  @override
  String get tableName => 'message_details';

  @override
  MessageDetailsRow createRow(Map<String, dynamic> data) =>
      MessageDetailsRow(data);
}

class MessageDetailsRow extends SupabaseDataRow {
  MessageDetailsRow(super.data);

  @override
  SupabaseTable get table => MessageDetailsTable();

  String? get messageId => getField<String>('message_id');
  set messageId(String? value) => setField<String>('message_id', value);

  DateTime? get messageCreatedAt => getField<DateTime>('message_created_at');
  set messageCreatedAt(DateTime? value) =>
      setField<DateTime>('message_created_at', value);

  String? get chatId => getField<String>('chat_id');
  set chatId(String? value) => setField<String>('chat_id', value);

  String? get message => getField<String>('message');
  set message(String? value) => setField<String>('message', value);

  bool? get isAudio => getField<bool>('is_audio');
  set isAudio(bool? value) => setField<bool>('is_audio', value);

  bool? get messageIsDelete => getField<bool>('message_is_delete');
  set messageIsDelete(bool? value) =>
      setField<bool>('message_is_delete', value);

  String? get authorId => getField<String>('author_id');
  set authorId(String? value) => setField<String>('author_id', value);

  String? get authorName => getField<String>('author_name');
  set authorName(String? value) => setField<String>('author_name', value);

  String? get authorSurname => getField<String>('author_surname');
  set authorSurname(String? value) => setField<String>('author_surname', value);

  String? get authorPatronymic => getField<String>('author_patronymic');
  set authorPatronymic(String? value) =>
      setField<String>('author_patronymic', value);

  String? get authorPhotoUrl => getField<String>('author_photo_url');
  set authorPhotoUrl(String? value) =>
      setField<String>('author_photo_url', value);

  String? get authorBlurHash => getField<String>('author_blur_hash');
  set authorBlurHash(String? value) =>
      setField<String>('author_blur_hash', value);

  String? get authorMainRolle => getField<String>('author_main_rolle');
  set authorMainRolle(String? value) =>
      setField<String>('author_main_rolle', value);

  dynamic get photos => getField<dynamic>('photos');
  set photos(dynamic value) => setField<dynamic>('photos', value);

  dynamic get audios => getField<dynamic>('audios');
  set audios(dynamic value) => setField<dynamic>('audios', value);
}
