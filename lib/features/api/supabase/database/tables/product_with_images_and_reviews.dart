import '../database.dart';

class ProductWithImagesAndReviewsTable
    extends SupabaseTable<ProductWithImagesAndReviewsRow> {
  @override
  String get tableName => 'product_with_images_and_reviews';

  @override
  ProductWithImagesAndReviewsRow createRow(Map<String, dynamic> data) =>
      ProductWithImagesAndReviewsRow(data);
}

class ProductWithImagesAndReviewsRow extends SupabaseDataRow {
  ProductWithImagesAndReviewsRow(super.data);

  @override
  SupabaseTable get table => ProductWithImagesAndReviewsTable();

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

  dynamic get translations => getField<dynamic>('translations');
  set translations(dynamic value) => setField<dynamic>('translations', value);
}
