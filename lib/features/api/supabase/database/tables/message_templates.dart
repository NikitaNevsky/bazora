import '../database.dart';

class MessageTemplatesTable extends SupabaseTable<MessageTemplatesRow> {
  @override
  String get tableName => 'message_templates';

  @override
  MessageTemplatesRow createRow(Map<String, dynamic> data) =>
      MessageTemplatesRow(data);
}

class MessageTemplatesRow extends SupabaseDataRow {
  MessageTemplatesRow(super.data);

  @override
  SupabaseTable get table => MessageTemplatesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String get title => getField<String>('title')!;
  set title(String value) => setField<String>('title', value);

  String get text => getField<String>('text')!;
  set text(String value) => setField<String>('text', value);

  String get language => getField<String>('language')!;
  set language(String value) => setField<String>('language', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
