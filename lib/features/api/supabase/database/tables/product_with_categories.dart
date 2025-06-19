import '../database.dart';

class ProductWithCategoriesTable
    extends SupabaseTable<ProductWithCategoriesRow> {
  @override
  String get tableName => 'product_with_categories';

  @override
  ProductWithCategoriesRow createRow(Map<String, dynamic> data) =>
      ProductWithCategoriesRow(data);
}

class ProductWithCategoriesRow extends SupabaseDataRow {
  ProductWithCategoriesRow(super.data);

  @override
  SupabaseTable get table => ProductWithCategoriesTable();

  String? get productId => getField<String>('product_id');
  set productId(String? value) => setField<String>('product_id', value);

  dynamic get categories => getField<dynamic>('categories');
  set categories(dynamic value) => setField<dynamic>('categories', value);
}
