import '../database.dart';

class ReviewsDetailsTable extends SupabaseTable<ReviewsDetailsRow> {
  @override
  String get tableName => 'reviews_details';

  @override
  ReviewsDetailsRow createRow(Map<String, dynamic> data) =>
      ReviewsDetailsRow(data);
}

class ReviewsDetailsRow extends SupabaseDataRow {
  ReviewsDetailsRow(super.data);

  @override
  SupabaseTable get table => ReviewsDetailsTable();

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

  String? get reviewProductId => getField<String>('review_product_id');
  set reviewProductId(String? value) =>
      setField<String>('review_product_id', value);

  bool? get reviewIsDelete => getField<bool>('review_is_delete');
  set reviewIsDelete(bool? value) => setField<bool>('review_is_delete', value);

  bool? get reviewIsBlocked => getField<bool>('review_is_blocked');
  set reviewIsBlocked(bool? value) =>
      setField<bool>('review_is_blocked', value);

  bool? get passedModeration => getField<bool>('passed_moderation');
  set passedModeration(bool? value) =>
      setField<bool>('passed_moderation', value);

  bool? get published => getField<bool>('published');
  set published(bool? value) => setField<bool>('published', value);

  String? get productId => getField<String>('product_id');
  set productId(String? value) => setField<String>('product_id', value);

  String? get productName => getField<String>('product_name');
  set productName(String? value) => setField<String>('product_name', value);

  String? get productDescription => getField<String>('product_description');
  set productDescription(String? value) =>
      setField<String>('product_description', value);

  double? get productPrice => getField<double>('product_price');
  set productPrice(double? value) => setField<double>('product_price', value);

  dynamic get translations => getField<dynamic>('translations');
  set translations(dynamic value) => setField<dynamic>('translations', value);

  dynamic get images => getField<dynamic>('images');
  set images(dynamic value) => setField<dynamic>('images', value);
}
