import '../database.dart';

class TagsTranslationsTable extends SupabaseTable<TagsTranslationsRow> {
  @override
  String get tableName => 'tags_translations';

  @override
  TagsTranslationsRow createRow(Map<String, dynamic> data) =>
      TagsTranslationsRow(data);
}

class TagsTranslationsRow extends SupabaseDataRow {
  TagsTranslationsRow(super.data);

  @override
  SupabaseTable get table => TagsTranslationsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get languageCode => getField<String>('language_code')!;
  set languageCode(String value) => setField<String>('language_code', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  int get tagId => getField<int>('tag_id')!;
  set tagId(int value) => setField<int>('tag_id', value);
}
