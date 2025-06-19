import '../database.dart';

class VariantAttributesTable extends SupabaseTable<VariantAttributesRow> {
  @override
  String get tableName => 'variant_attributes';

  @override
  VariantAttributesRow createRow(Map<String, dynamic> data) =>
      VariantAttributesRow(data);
}

class VariantAttributesRow extends SupabaseDataRow {
  VariantAttributesRow(super.data);

  @override
  SupabaseTable get table => VariantAttributesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get variantId => getField<String>('variant_id')!;
  set variantId(String value) => setField<String>('variant_id', value);

  String get attributeId => getField<String>('attribute_id')!;
  set attributeId(String value) => setField<String>('attribute_id', value);

  String get valueId => getField<String>('value_id')!;
  set valueId(String value) => setField<String>('value_id', value);
}
