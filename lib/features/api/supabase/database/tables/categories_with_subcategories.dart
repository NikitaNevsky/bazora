import '../database.dart';

class CategoriesWithSubcategoriesTable
    extends SupabaseTable<CategoriesWithSubcategoriesRow> {
  @override
  String get tableName => 'categories_with_subcategories';

  @override
  CategoriesWithSubcategoriesRow createRow(Map<String, dynamic> data) =>
      CategoriesWithSubcategoriesRow(data);
}

class CategoriesWithSubcategoriesRow extends SupabaseDataRow {
  CategoriesWithSubcategoriesRow(super.data);

  @override
  SupabaseTable get table => CategoriesWithSubcategoriesTable();

  String? get categoryId => getField<String>('category_id');
  set categoryId(String? value) => setField<String>('category_id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get image => getField<String>('image');
  set image(String? value) => setField<String>('image', value);

  String? get blurhash => getField<String>('blurhash');
  set blurhash(String? value) => setField<String>('blurhash', value);

  bool? get isDelete => getField<bool>('is_delete');
  set isDelete(bool? value) => setField<bool>('is_delete', value);

  List<dynamic> get translatedName => getListField<dynamic>('translated_name');
  set translatedName(List<dynamic>? value) =>
      setListField<dynamic>('translated_name', value);

  bool? get isArchive => getField<bool>('is_archive');
  set isArchive(bool? value) => setField<bool>('is_archive', value);

  dynamic get subcategories => getField<dynamic>('subcategories');
  set subcategories(dynamic value) =>
      setField<dynamic>('subcategories', value);

  bool? get mainCategory => getField<bool>('main_category');
  set mainCategory(bool? value) => setField<bool>('main_category', value);

  bool? get hasSubcategories => getField<bool>('has_subcategories');
  set hasSubcategories(bool? value) =>
      setField<bool>('has_subcategories', value);

  bool? get isLastLevel => getField<bool>('is_last_level');
  set isLastLevel(bool? value) => setField<bool>('is_last_level', value);
}
