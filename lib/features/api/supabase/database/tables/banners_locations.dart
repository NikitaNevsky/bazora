import '../database.dart';

class BannersLocationsTable extends SupabaseTable<BannersLocationsRow> {
  @override
  String get tableName => 'banners_locations';

  @override
  BannersLocationsRow createRow(Map<String, dynamic> data) =>
      BannersLocationsRow(data);
}

class BannersLocationsRow extends SupabaseDataRow {
  BannersLocationsRow(super.data);

  @override
  SupabaseTable get table => BannersLocationsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get bannerId => getField<String>('banner_id')!;
  set bannerId(String value) => setField<String>('banner_id', value);

  String get locationType => getField<String>('location_type')!;
  set locationType(String value) => setField<String>('location_type', value);

  String? get locationId => getField<String>('location_id');
  set locationId(String? value) => setField<String>('location_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get cityId => getField<String>('city_id');
  set cityId(String? value) => setField<String>('city_id', value);
}
