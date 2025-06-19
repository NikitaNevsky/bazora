import '../database.dart';

class ProductCategoriesHierarchyTable
    extends SupabaseTable<ProductCategoriesHierarchyRow> {
  @override
  String get tableName => 'product_categories_hierarchy';

  @override
  ProductCategoriesHierarchyRow createRow(Map<String, dynamic> data) =>
      ProductCategoriesHierarchyRow(data);
}

class ProductCategoriesHierarchyRow extends SupabaseDataRow {
  ProductCategoriesHierarchyRow(super.data);

  @override
  SupabaseTable get table => ProductCategoriesHierarchyTable();

  String? get productId => getField<String>('product_id');
  set productId(String? value) => setField<String>('product_id', value);

  dynamic get categoriesHierarchy => getField<dynamic>('categories_hierarchy');
  set categoriesHierarchy(dynamic value) =>
      setField<dynamic>('categories_hierarchy', value);
}
