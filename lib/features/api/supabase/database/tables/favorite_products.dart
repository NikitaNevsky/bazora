import '../database.dart';

class FavoriteProductsTable extends SupabaseTable<FavoriteProductsRow> {
  @override
  String get tableName => 'favorite_products';

  @override
  FavoriteProductsRow createRow(Map<String, dynamic> data) =>
      FavoriteProductsRow(data);
}

class FavoriteProductsRow extends SupabaseDataRow {
  FavoriteProductsRow(super.data);

  @override
  SupabaseTable get table => FavoriteProductsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  bool get isFavorite => getField<bool>('is_favorite')!;
  set isFavorite(bool value) => setField<bool>('is_favorite', value);

  String get productId => getField<String>('product_id')!;
  set productId(String value) => setField<String>('product_id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);
}
