import '../database.dart';

class CategoriesTable extends SupabaseTable<CategoriesRow> {
  @override
  String get tableName => 'categories';

  @override
  CategoriesRow createRow(Map<String, dynamic> data) => CategoriesRow(data);
}

class CategoriesRow extends SupabaseDataRow {
  CategoriesRow(super.data);

  @override
  SupabaseTable get table => CategoriesTable();

  String get categoryId => getField<String>('category_id')!;
  set categoryId(String value) => setField<String>('category_id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get image => getField<String>('image');
  set image(String? value) => setField<String>('image', value);

  String? get blurhash => getField<String>('blurhash');
  set blurhash(String? value) => setField<String>('blurhash', value);

  bool get isDelete => getField<bool>('is_delete')!;
  set isDelete(bool value) => setField<bool>('is_delete', value);

  bool get isArchive => getField<bool>('is_archive')!;
  set isArchive(bool value) => setField<bool>('is_archive', value);

  List<dynamic> get translatedName => getListField<dynamic>('translated_name');
  set translatedName(List<dynamic>? value) =>
      setListField<dynamic>('translated_name', value);

  bool get mainCategory => getField<bool>('main_category')!;
  set mainCategory(bool value) => setField<bool>('main_category', value);

  bool get hasSubcategories => getField<bool>('has_subcategories')!;
  set hasSubcategories(bool value) =>
      setField<bool>('has_subcategories', value);

  bool get isLastLevel => getField<bool>('is_last_level')!;
  set isLastLevel(bool value) => setField<bool>('is_last_level', value);

  int get level => getField<int>('level')!;
  set level(int value) => setField<int>('level', value);

  String? get parentCategoryId => getField<String>('parent_category_id');
  set parentCategoryId(String? value) =>
      setField<String>('parent_category_id', value);
}
