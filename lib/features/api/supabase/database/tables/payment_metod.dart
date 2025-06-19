import '../database.dart';

class PaymentMetodTable extends SupabaseTable<PaymentMetodRow> {
  @override
  String get tableName => 'payment_metod';

  @override
  PaymentMetodRow createRow(Map<String, dynamic> data) => PaymentMetodRow(data);
}

class PaymentMetodRow extends SupabaseDataRow {
  PaymentMetodRow(super.data);

  @override
  SupabaseTable get table => PaymentMetodTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  double get fee => getField<double>('fee')!;
  set fee(double value) => setField<double>('fee', value);
}
