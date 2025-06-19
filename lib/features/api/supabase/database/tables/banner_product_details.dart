import '../database.dart';

class BannerProductDetailsTable extends SupabaseTable<BannerProductDetailsRow> {
  @override
  String get tableName => 'banner_product_details';

  @override
  BannerProductDetailsRow createRow(Map<String, dynamic> data) =>
      BannerProductDetailsRow(data);
}

class BannerProductDetailsRow extends SupabaseDataRow {
  BannerProductDetailsRow(super.data);

  @override
  SupabaseTable get table => BannerProductDetailsTable();

  String? get bannerId => getField<String>('banner_id');
  set bannerId(String? value) => setField<String>('banner_id', value);

  String? get productId => getField<String>('product_id');
  set productId(String? value) => setField<String>('product_id', value);

  String? get productName => getField<String>('product_name');
  set productName(String? value) => setField<String>('product_name', value);

  double? get retailPrice => getField<double>('retail_price');
  set retailPrice(double? value) => setField<double>('retail_price', value);

  double? get retailPricePoint => getField<double>('retail_price_point');
  set retailPricePoint(double? value) =>
      setField<double>('retail_price_point', value);

  double? get bulkPricePoint => getField<double>('bulk_price_point');
  set bulkPricePoint(double? value) =>
      setField<double>('bulk_price_point', value);

  int? get currencyId => getField<int>('currency_id');
  set currencyId(int? value) => setField<int>('currency_id', value);

  String? get productImageUrl => getField<String>('product_image_url');
  set productImageUrl(String? value) =>
      setField<String>('product_image_url', value);

  dynamic get attributes => getField<dynamic>('attributes');
  set attributes(dynamic value) => setField<dynamic>('attributes', value);
}
