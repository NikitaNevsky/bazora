import '../database.dart';

class ReviewsTable extends SupabaseTable<ReviewsRow> {
  @override
  String get tableName => 'reviews';

  @override
  ReviewsRow createRow(Map<String, dynamic> data) => ReviewsRow(data);
}

class ReviewsRow extends SupabaseDataRow {
  ReviewsRow(super.data);

  @override
  SupabaseTable get table => ReviewsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get authorId => getField<String>('author_id')!;
  set authorId(String value) => setField<String>('author_id', value);

  String? get text => getField<String>('text');
  set text(String? value) => setField<String>('text', value);

  int get rate => getField<int>('rate')!;
  set rate(int value) => setField<int>('rate', value);

  int? get pointId => getField<int>('point_id');
  set pointId(int? value) => setField<int>('point_id', value);

  String? get productId => getField<String>('product_id');
  set productId(String? value) => setField<String>('product_id', value);

  bool get isDelete => getField<bool>('is_delete')!;
  set isDelete(bool value) => setField<bool>('is_delete', value);

  bool get isBlocked => getField<bool>('is_blocked')!;
  set isBlocked(bool value) => setField<bool>('is_blocked', value);

  bool get passedModeration => getField<bool>('passed_moderation')!;
  set passedModeration(bool value) =>
      setField<bool>('passed_moderation', value);

  bool get published => getField<bool>('published')!;
  set published(bool value) => setField<bool>('published', value);

  String? get answer => getField<String>('answer');
  set answer(String? value) => setField<String>('answer', value);

  bool get processed => getField<bool>('processed')!;
  set processed(bool value) => setField<bool>('processed', value);
}
