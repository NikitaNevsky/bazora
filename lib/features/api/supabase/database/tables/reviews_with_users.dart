import '../database.dart';

class ReviewsWithUsersTable extends SupabaseTable<ReviewsWithUsersRow> {
  @override
  String get tableName => 'reviews_with_users';

  @override
  ReviewsWithUsersRow createRow(Map<String, dynamic> data) =>
      ReviewsWithUsersRow(data);
}

class ReviewsWithUsersRow extends SupabaseDataRow {
  ReviewsWithUsersRow(super.data);

  @override
  SupabaseTable get table => ReviewsWithUsersTable();

  String? get reviewId => getField<String>('review_id');
  set reviewId(String? value) => setField<String>('review_id', value);

  DateTime? get reviewCreatedAt => getField<DateTime>('review_created_at');
  set reviewCreatedAt(DateTime? value) =>
      setField<DateTime>('review_created_at', value);

  String? get authorId => getField<String>('author_id');
  set authorId(String? value) => setField<String>('author_id', value);

  String? get reviewText => getField<String>('review_text');
  set reviewText(String? value) => setField<String>('review_text', value);

  int? get reviewRate => getField<int>('review_rate');
  set reviewRate(int? value) => setField<int>('review_rate', value);

  int? get pointId => getField<int>('point_id');
  set pointId(int? value) => setField<int>('point_id', value);

  String? get productId => getField<String>('product_id');
  set productId(String? value) => setField<String>('product_id', value);

  bool? get reviewIsDelete => getField<bool>('review_is_delete');
  set reviewIsDelete(bool? value) => setField<bool>('review_is_delete', value);

  bool? get reviewIsBlocked => getField<bool>('review_is_blocked');
  set reviewIsBlocked(bool? value) =>
      setField<bool>('review_is_blocked', value);

  bool? get reviewPassedModeration =>
      getField<bool>('review_passed_moderation');
  set reviewPassedModeration(bool? value) =>
      setField<bool>('review_passed_moderation', value);

  bool? get reviewPublished => getField<bool>('review_published');
  set reviewPublished(bool? value) => setField<bool>('review_published', value);

  String? get reviewAnswer => getField<String>('review_answer');
  set reviewAnswer(String? value) => setField<String>('review_answer', value);

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

  bool? get processed => getField<bool>('processed');
  set processed(bool? value) => setField<bool>('processed', value);
}
