import '../database.dart';

class ProductWithImagesReviewsPricesTable
    extends SupabaseTable<ProductWithImagesReviewsPricesRow> {
  @override
  String get tableName => 'product_with_images_reviews_prices';

  @override
  ProductWithImagesReviewsPricesRow createRow(Map<String, dynamic> data) =>
      ProductWithImagesReviewsPricesRow(data);
}

class ProductWithImagesReviewsPricesRow extends SupabaseDataRow {
  ProductWithImagesReviewsPricesRow(super.data);

  @override
  SupabaseTable get table => ProductWithImagesReviewsPricesTable();

  String? get productId => getField<String>('product_id');
  set productId(String? value) => setField<String>('product_id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  double? get price => getField<double>('price');
  set price(double? value) => setField<double>('price', value);

  bool? get isDelete => getField<bool>('is_delete');
  set isDelete(bool? value) => setField<bool>('is_delete', value);

  String? get article => getField<String>('article');
  set article(String? value) => setField<String>('article', value);

  bool? get isArchiv => getField<bool>('is_archiv');
  set isArchiv(bool? value) => setField<bool>('is_archiv', value);

  dynamic get images => getField<dynamic>('images');
  set images(dynamic value) => setField<dynamic>('images', value);

  dynamic get categories => getField<dynamic>('categories');
  set categories(dynamic value) => setField<dynamic>('categories', value);

  dynamic get attributes => getField<dynamic>('attributes');
  set attributes(dynamic value) => setField<dynamic>('attributes', value);

  double? get retailPrice => getField<double>('retail_price');
  set retailPrice(double? value) => setField<double>('retail_price', value);

  int? get currencyId => getField<int>('currency_id');
  set currencyId(int? value) => setField<int>('currency_id', value);

  dynamic get reviews => getField<dynamic>('reviews');
  set reviews(dynamic value) => setField<dynamic>('reviews', value);

  double? get averageRating => getField<double>('average_rating');
  set averageRating(double? value) => setField<double>('average_rating', value);

  int? get reviewCount => getField<int>('review_count');
  set reviewCount(int? value) => setField<int>('review_count', value);

  int? get unprocessedReviewCount => getField<int>('unprocessed_review_count');
  set unprocessedReviewCount(int? value) =>
      setField<int>('unprocessed_review_count', value);

  dynamic get translations => getField<dynamic>('translations');
  set translations(dynamic value) => setField<dynamic>('translations', value);

  dynamic get firstPrice => getField<dynamic>('first_price');
  set firstPrice(dynamic value) => setField<dynamic>('first_price', value);
}
