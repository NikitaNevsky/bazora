import '../database.dart';

class PointsWithImagesTable extends SupabaseTable<PointsWithImagesRow> {
  @override
  String get tableName => 'points_with_images';

  @override
  PointsWithImagesRow createRow(Map<String, dynamic> data) =>
      PointsWithImagesRow(data);
}

class PointsWithImagesRow extends SupabaseDataRow {
  PointsWithImagesRow(super.data);

  @override
  SupabaseTable get table => PointsWithImagesTable();

  int? get pointId => getField<int>('point_id');
  set pointId(int? value) => setField<int>('point_id', value);

  DateTime? get pointCreatedAt => getField<DateTime>('point_created_at');
  set pointCreatedAt(DateTime? value) =>
      setField<DateTime>('point_created_at', value);

  bool? get isArchive => getField<bool>('is_archive');
  set isArchive(bool? value) => setField<bool>('is_archive', value);

  String? get pointName => getField<String>('point_name');
  set pointName(String? value) => setField<String>('point_name', value);

  String? get pointAddress => getField<String>('point_address');
  set pointAddress(String? value) => setField<String>('point_address', value);

  double? get percentageBulkOrder => getField<double>('percentage_bulk_order');
  set percentageBulkOrder(double? value) =>
      setField<double>('percentage_bulk_order', value);

  double? get percentageRetailOrder =>
      getField<double>('percentage_retail_order');
  set percentageRetailOrder(double? value) =>
      setField<double>('percentage_retail_order', value);

  double? get rewardFeedbackBulk => getField<double>('reward_feedback_bulk');
  set rewardFeedbackBulk(double? value) =>
      setField<double>('reward_feedback_bulk', value);

  double? get rewardFeedbackRetail =>
      getField<double>('reward_feedback_retail');
  set rewardFeedbackRetail(double? value) =>
      setField<double>('reward_feedback_retail', value);

  double? get rewardReferralProgram =>
      getField<double>('reward_referral_program');
  set rewardReferralProgram(double? value) =>
      setField<double>('reward_referral_program', value);

  String? get storeId => getField<String>('store_id');
  set storeId(String? value) => setField<String>('store_id', value);

  String? get storeName => getField<String>('store_name');
  set storeName(String? value) => setField<String>('store_name', value);

  int? get currency => getField<int>('currency');
  set currency(int? value) => setField<int>('currency', value);

  String? get cityId => getField<String>('city_id');
  set cityId(String? value) => setField<String>('city_id', value);

  String? get cityName => getField<String>('city_name');
  set cityName(String? value) => setField<String>('city_name', value);

  int? get countryId => getField<int>('country_id');
  set countryId(int? value) => setField<int>('country_id', value);

  String? get countryName => getField<String>('country_name');
  set countryName(String? value) => setField<String>('country_name', value);

  dynamic get images => getField<dynamic>('images');
  set images(dynamic value) => setField<dynamic>('images', value);
}
