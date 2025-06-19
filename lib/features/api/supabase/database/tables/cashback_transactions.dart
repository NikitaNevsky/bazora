import '../database.dart';

class CashbackTransactionsTable extends SupabaseTable<CashbackTransactionsRow> {
  @override
  String get tableName => 'cashback_transactions';

  @override
  CashbackTransactionsRow createRow(Map<String, dynamic> data) =>
      CashbackTransactionsRow(data);
}

class CashbackTransactionsRow extends SupabaseDataRow {
  CashbackTransactionsRow(super.data);

  @override
  SupabaseTable get table => CashbackTransactionsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String? get orderId => getField<String>('order_id');
  set orderId(String? value) => setField<String>('order_id', value);

  String get transactionType => getField<String>('transaction_type')!;
  set transactionType(String value) =>
      setField<String>('transaction_type', value);

  double get amount => getField<double>('amount')!;
  set amount(double value) => setField<double>('amount', value);

  int get currencyId => getField<int>('currency_id')!;
  set currencyId(int value) => setField<int>('currency_id', value);

  String? get comments => getField<String>('comments');
  set comments(String? value) => setField<String>('comments', value);

  String? get refferalCode => getField<String>('refferal_code');
  set refferalCode(String? value) => setField<String>('refferal_code', value);
}
