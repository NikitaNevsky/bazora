import '../database.dart';

class UserOrdersRetailFormatCountTable
    extends SupabaseTable<UserOrdersRetailFormatCountRow> {
  @override
  String get tableName => 'user_orders_retail_format_count';

  @override
  UserOrdersRetailFormatCountRow createRow(Map<String, dynamic> data) =>
      UserOrdersRetailFormatCountRow(data);
}

class UserOrdersRetailFormatCountRow extends SupabaseDataRow {
  UserOrdersRetailFormatCountRow(super.data);

  @override
  SupabaseTable get table => UserOrdersRetailFormatCountTable();

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get retailFormatTrueCount => getField<int>('retail_format_true_count');
  set retailFormatTrueCount(int? value) =>
      setField<int>('retail_format_true_count', value);

  int? get retailFormatFalseCount => getField<int>('retail_format_false_count');
  set retailFormatFalseCount(int? value) =>
      setField<int>('retail_format_false_count', value);
}
