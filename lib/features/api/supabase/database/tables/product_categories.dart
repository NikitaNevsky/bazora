import '../database.dart';

class ProductCategoriesTable extends SupabaseTable<ProductCategoriesRow> {
  @override
  String get tableName => 'product_categories';

  @override
  ProductCategoriesRow createRow(Map<String, dynamic> data) =>
      ProductCategoriesRow(data);
}

class ProductCategoriesRow extends SupabaseDataRow {
  ProductCategoriesRow(super.data);

  @override
  SupabaseTable get table => ProductCategoriesTable();

  String get productId => getField<String>('product_id')!;
  set productId(String value) => setField<String>('product_id', value);

  String get categoryId => getField<String>('category_id')!;
  set categoryId(String value) => setField<String>('category_id', value);
}
