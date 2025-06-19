import '../database.dart';

class BannersWithDetailsTable extends SupabaseTable<BannersWithDetailsRow> {
  @override
  String get tableName => 'banners_with_details';

  @override
  BannersWithDetailsRow createRow(Map<String, dynamic> data) =>
      BannersWithDetailsRow(data);
}

class BannersWithDetailsRow extends SupabaseDataRow {
  BannersWithDetailsRow(super.data);

  @override
  SupabaseTable get table => BannersWithDetailsTable();

  String? get bannerId => getField<String>('banner_id');
  set bannerId(String? value) => setField<String>('banner_id', value);

  DateTime? get bannerCreatedAt => getField<DateTime>('banner_created_at');
  set bannerCreatedAt(DateTime? value) =>
      setField<DateTime>('banner_created_at', value);

  String? get bannerName => getField<String>('banner_name');
  set bannerName(String? value) => setField<String>('banner_name', value);

  String? get bannerImage => getField<String>('banner_image');
  set bannerImage(String? value) => setField<String>('banner_image', value);

  String? get bannerBlurhash => getField<String>('banner_blurhash');
  set bannerBlurhash(String? value) =>
      setField<String>('banner_blurhash', value);

  bool? get bannerIsDelete => getField<bool>('banner_is_delete');
  set bannerIsDelete(bool? value) => setField<bool>('banner_is_delete', value);

  bool? get bannerIsArchiv => getField<bool>('banner_is_archiv');
  set bannerIsArchiv(bool? value) => setField<bool>('banner_is_archiv', value);

  dynamic get locations => getField<dynamic>('locations');
  set locations(dynamic value) => setField<dynamic>('locations', value);

  int? get productCount => getField<int>('product_count');
  set productCount(int? value) => setField<int>('product_count', value);
}
