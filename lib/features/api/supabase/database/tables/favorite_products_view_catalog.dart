import '../database.dart';

class FavoriteProductsViewCatalogTable
    extends SupabaseTable<FavoriteProductsViewCatalogRow> {
  @override
  String get tableName => 'favorite_products_view_catalog';

  @override
  FavoriteProductsViewCatalogRow createRow(Map<String, dynamic> data) =>
      FavoriteProductsViewCatalogRow(data);
}

class FavoriteProductsViewCatalogRow extends SupabaseDataRow {
  FavoriteProductsViewCatalogRow(super.data);

  @override
  SupabaseTable get table => FavoriteProductsViewCatalogTable();

  String? get favoriteId => getField<String>('favorite_id');
  set favoriteId(String? value) => setField<String>('favorite_id', value);

  DateTime? get favoriteCreatedAt => getField<DateTime>('favorite_created_at');
  set favoriteCreatedAt(DateTime? value) =>
      setField<DateTime>('favorite_created_at', value);

  bool? get isFavorite => getField<bool>('is_favorite');
  set isFavorite(bool? value) => setField<bool>('is_favorite', value);

  String? get productId => getField<String>('product_id');
  set productId(String? value) => setField<String>('product_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get variantId => getField<String>('variant_id');
  set variantId(String? value) => setField<String>('variant_id', value);

  double? get priceRetail => getField<double>('price_retail');
  set priceRetail(double? value) => setField<double>('price_retail', value);

  int? get variantStock => getField<int>('variant_stock');
  set variantStock(int? value) => setField<int>('variant_stock', value);

  String? get sku => getField<String>('sku');
  set sku(String? value) => setField<String>('sku', value);

  bool? get variantIsDelete => getField<bool>('variant_is_delete');
  set variantIsDelete(bool? value) =>
      setField<bool>('variant_is_delete', value);

  bool? get variantIsArchive => getField<bool>('variant_is_archive');
  set variantIsArchive(bool? value) =>
      setField<bool>('variant_is_archive', value);

  double? get priceBulk => getField<double>('price_bulk');
  set priceBulk(double? value) => setField<double>('price_bulk', value);

  String? get article => getField<String>('article');
  set article(String? value) => setField<String>('article', value);

  dynamic get attributes => getField<dynamic>('attributes');
  set attributes(dynamic value) => setField<dynamic>('attributes', value);

  dynamic get priceStockData => getField<dynamic>('price_stock_data');
  set priceStockData(dynamic value) =>
      setField<dynamic>('price_stock_data', value);

  dynamic get images => getField<dynamic>('images');
  set images(dynamic value) => setField<dynamic>('images', value);

  dynamic get productTranslations => getField<dynamic>('product_translations');
  set productTranslations(dynamic value) =>
      setField<dynamic>('product_translations', value);

  dynamic get categories => getField<dynamic>('categories');
  set categories(dynamic value) => setField<dynamic>('categories', value);
}
