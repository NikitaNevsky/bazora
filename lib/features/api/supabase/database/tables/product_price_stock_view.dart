import '../database.dart';

class ProductPriceStockViewTable extends SupabaseTable<ProductPriceStockViewRow> {
  @override
  String get tableName => 'product_price_stock_view';

  @override
  ProductPriceStockViewRow createRow(Map<String, dynamic> data) => ProductPriceStockViewRow(data);
}

class ProductPriceStockViewRow extends SupabaseDataRow {
  ProductPriceStockViewRow(super.data);

  @override
  SupabaseTable get table => ProductPriceStockViewTable();

  String? get priceStockId => getField<String>('price_stock_id');
  set priceStockId(String? value) => setField<String>('price_stock_id', value);

  String? get productId => getField<String>('product_id');
  set productId(String? value) => setField<String>('product_id', value);

  String? get productVariantId => getField<String>('product_variant_id');
  set productVariantId(String? value) =>
      setField<String>('product_variant_id', value);

  int? get pointId => getField<int>('point_id');
  set pointId(int? value) => setField<int>('point_id', value);

  double? get bulkPrice => getField<double>('bulk_price');
  set bulkPrice(double? value) => setField<double>('bulk_price', value);

  double? get retailPrice => getField<double>('retail_price');
  set retailPrice(double? value) => setField<double>('retail_price', value);

  double? get stock => getField<double>('stock');
  set stock(double? value) => setField<double>('stock', value);

  int? get currency => getField<int>('currency');
  set currency(int? value) => setField<int>('currency', value);

  bool? get available => getField<bool>('available');
  set available(bool? value) => setField<bool>('available', value);

  double? get purchasePrice => getField<double>('purchase_price');
  set purchasePrice(double? value) => setField<double>('purchase_price', value);

  double? get cashbackRetail => getField<double>('cashback_retail');
  set cashbackRetail(double? value) =>
      setField<double>('cashback_retail', value);

  double? get cashbackBulk => getField<double>('cashback_bulk');
  set cashbackBulk(double? value) => setField<double>('cashback_bulk', value);

  int? get minQwForBulk => getField<int>('min_qw_for_bulk');
  set minQwForBulk(int? value) => setField<int>('min_qw_for_bulk', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get pointName => getField<String>('point_name');
  set pointName(String? value) => setField<String>('point_name', value);

  String? get pointCity => getField<String>('point_city');
  set pointCity(String? value) => setField<String>('point_city', value);

  String? get pointAddress => getField<String>('point_address');
  set pointAddress(String? value) => setField<String>('point_address', value);

  double? get percentageBulkOrder => getField<double>('percentage_bulk_order');
  set percentageBulkOrder(double? value) =>
      setField<double>('percentage_bulk_order', value);

  double? get percentageRetailOrder =>
      getField<double>('percentage_retail_order');
  set percentageRetailOrder(double? value) =>
      setField<double>('percentage_retail_order', value);

  double? get rewardFeedbackRetail =>
      getField<double>('reward_feedback_retail');
  set rewardFeedbackRetail(double? value) =>
      setField<double>('reward_feedback_retail', value);

  double? get rewardFeedbackBulk => getField<double>('reward_feedback_bulk');
  set rewardFeedbackBulk(double? value) =>
      setField<double>('reward_feedback_bulk', value);

  double? get rewardReferralProgram =>
      getField<double>('reward_referral_program');
  set rewardReferralProgram(double? value) =>
      setField<double>('reward_referral_program', value);

  String? get openHours => getField<String>('open_hours');
  set openHours(String? value) => setField<String>('open_hours', value);

  int? get rate => getField<int>('rate');
  set rate(int? value) => setField<int>('rate', value);

  bool? get pointIsArchive => getField<bool>('point_is_archive');
  set pointIsArchive(bool? value) => setField<bool>('point_is_archive', value);

  String? get productName => getField<String>('product_name');
  set productName(String? value) => setField<String>('product_name', value);

  String? get productDescription => getField<String>('product_description');
  set productDescription(String? value) =>
      setField<String>('product_description', value);

  bool? get productIsDelete => getField<bool>('product_is_delete');
  set productIsDelete(bool? value) =>
      setField<bool>('product_is_delete', value);

  bool? get productIsArchive => getField<bool>('product_is_archive');
  set productIsArchive(bool? value) =>
      setField<bool>('product_is_archive', value);

  dynamic get productTranslations => getField<dynamic>('product_translations');
  set productTranslations(dynamic value) =>
      setField<dynamic>('product_translations', value);

  dynamic get productCategories => getField<dynamic>('product_categories');
  set productCategories(dynamic value) =>
      setField<dynamic>('product_categories', value);

  dynamic get productImages => getField<dynamic>('product_images');
  set productImages(dynamic value) =>
      setField<dynamic>('product_images', value);

  double? get marketPrice => getField<double>('market_price');
  set marketPrice(double? value) => setField<double>('market_price', value);
}
