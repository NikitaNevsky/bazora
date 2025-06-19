import '../database.dart';

class BannerProductsTable extends SupabaseTable<BannerProductsRow> {
  @override
  String get tableName => 'banner_products';

  @override
  BannerProductsRow createRow(Map<String, dynamic> data) =>
      BannerProductsRow(data);
}

class BannerProductsRow extends SupabaseDataRow {
  BannerProductsRow(super.data);

  @override
  SupabaseTable get table => BannerProductsTable();

  String get bannerId => getField<String>('banner_id')!;
  set bannerId(String value) => setField<String>('banner_id', value);

  String get productId => getField<String>('product_id')!;
  set productId(String value) => setField<String>('product_id', value);
}
