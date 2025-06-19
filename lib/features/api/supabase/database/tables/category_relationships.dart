import '../database.dart';

class CategoryRelationshipsTable
    extends SupabaseTable<CategoryRelationshipsRow> {
  @override
  String get tableName => 'category_relationships';

  @override
  CategoryRelationshipsRow createRow(Map<String, dynamic> data) =>
      CategoryRelationshipsRow(data);
}

class CategoryRelationshipsRow extends SupabaseDataRow {
  CategoryRelationshipsRow(super.data);

  @override
  SupabaseTable get table => CategoryRelationshipsTable();

  String get parentCategoryId => getField<String>('parent_category_id')!;
  set parentCategoryId(String value) =>
      setField<String>('parent_category_id', value);

  String get childCategoryId => getField<String>('child_category_id')!;
  set childCategoryId(String value) =>
      setField<String>('child_category_id', value);
}
