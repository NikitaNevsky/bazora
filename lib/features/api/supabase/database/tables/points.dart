import '../database.dart';

class PointsTable extends SupabaseTable<PointsRow> {
  @override
  String get tableName => 'points';

  @override
  PointsRow createRow(Map<String, dynamic> data) => PointsRow(data);
}

class PointsRow extends SupabaseDataRow {
  PointsRow(super.data);

  @override
  SupabaseTable get table => PointsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String get city => getField<String>('city')!;
  set city(String value) => setField<String>('city', value);

  String get address => getField<String>('address')!;
  set address(String value) => setField<String>('address', value);

  double get percentageBulkOrder => getField<double>('percentage_bulk_order')!;
  set percentageBulkOrder(double value) =>
      setField<double>('percentage_bulk_order', value);

  double get percentageRetailOrder =>
      getField<double>('percentage_retail_order')!;
  set percentageRetailOrder(double value) =>
      setField<double>('percentage_retail_order', value);

  double get rewardFeedbackRetail =>
      getField<double>('reward_feedback_retail')!;
  set rewardFeedbackRetail(double value) =>
      setField<double>('reward_feedback_retail', value);

  double get rewardFeedbackBulk => getField<double>('reward_feedback_bulk')!;
  set rewardFeedbackBulk(double value) =>
      setField<double>('reward_feedback_bulk', value);

  double get rewardReferralProgram =>
      getField<double>('reward_referral_program')!;
  set rewardReferralProgram(double value) =>
      setField<double>('reward_referral_program', value);

  bool get isDelete => getField<bool>('is_delete')!;
  set isDelete(bool value) => setField<bool>('is_delete', value);

  int get currency => getField<int>('currency')!;
  set currency(int value) => setField<int>('currency', value);

  bool get isArchive => getField<bool>('is_archive')!;
  set isArchive(bool value) => setField<bool>('is_archive', value);

  String? get storeId => getField<String>('store_id');
  set storeId(String? value) => setField<String>('store_id', value);

  bool get onlyDropdown => getField<bool>('only_dropdown')!;
  set onlyDropdown(bool value) => setField<bool>('only_dropdown', value);

  int get rate => getField<int>('rate')!;
  set rate(int value) => setField<int>('rate', value);

  String get openHours => getField<String>('open_hours')!;
  set openHours(String value) => setField<String>('open_hours', value);
}
