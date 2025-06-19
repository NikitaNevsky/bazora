import '../database.dart';

class StoreNotificationsTable extends SupabaseTable<StoreNotificationsRow> {
  @override
  String get tableName => 'store_notifications';

  @override
  StoreNotificationsRow createRow(Map<String, dynamic> data) =>
      StoreNotificationsRow(data);
}

class StoreNotificationsRow extends SupabaseDataRow {
  StoreNotificationsRow(super.data);

  @override
  SupabaseTable get table => StoreNotificationsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get titleRu => getField<String>('title_ru')!;
  set titleRu(String value) => setField<String>('title_ru', value);

  String get textRu => getField<String>('text_ru')!;
  set textRu(String value) => setField<String>('text_ru', value);

  bool get readIt => getField<bool>('read_it')!;
  set readIt(bool value) => setField<bool>('read_it', value);

  String get recipientId => getField<String>('recipient_id')!;
  set recipientId(String value) => setField<String>('recipient_id', value);

  String? get titleHy => getField<String>('title_hy');
  set titleHy(String? value) => setField<String>('title_hy', value);

  String? get textHy => getField<String>('text_hy');
  set textHy(String? value) => setField<String>('text_hy', value);
}
