import '../database.dart';

class StaffVerificationStatsTable
    extends SupabaseTable<StaffVerificationStatsRow> {
  @override
  String get tableName => 'staff_verification_stats';

  @override
  StaffVerificationStatsRow createRow(Map<String, dynamic> data) =>
      StaffVerificationStatsRow(data);
}

class StaffVerificationStatsRow extends SupabaseDataRow {
  StaffVerificationStatsRow(super.data);

  @override
  SupabaseTable get table => StaffVerificationStatsTable();

  int? get verifiedCount => getField<int>('verified_count');
  set verifiedCount(int? value) => setField<int>('verified_count', value);

  int? get unverifiedCount => getField<int>('unverified_count');
  set unverifiedCount(int? value) => setField<int>('unverified_count', value);
}
