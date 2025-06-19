import '../database.dart';

class ProductImagesTable extends SupabaseTable<ProductImagesRow> {
  @override
  String get tableName => 'product_images';

  @override
  ProductImagesRow createRow(Map<String, dynamic> data) =>
      ProductImagesRow(data);
}

class ProductImagesRow extends SupabaseDataRow {
  ProductImagesRow(super.data);

  @override
  SupabaseTable get table => ProductImagesTable();

  String get imageId => getField<String>('image_id')!;
  set imageId(String value) => setField<String>('image_id', value);

  String get productId => getField<String>('product_id')!;
  set productId(String value) => setField<String>('product_id', value);

  String? get imageUrl => getField<String>('image_url');
  set imageUrl(String? value) => setField<String>('image_url', value);

  String? get blurhash => getField<String>('blurhash');
  set blurhash(String? value) => setField<String>('blurhash', value);

  bool get isPhoto => getField<bool>('is_photo')!;
  set isPhoto(bool value) => setField<bool>('is_photo', value);

  bool get isVideo => getField<bool>('is_video')!;
  set isVideo(bool value) => setField<bool>('is_video', value);

  String? get videoUrl => getField<String>('video_url');
  set videoUrl(String? value) => setField<String>('video_url', value);

  String? get variantId => getField<String>('variant_id');
  set variantId(String? value) => setField<String>('variant_id', value);

  bool get isMain => getField<bool>('is_main')!;
  set isMain(bool value) => setField<bool>('is_main', value);

  bool get isVariantSpecific => getField<bool>('is_variant_specific')!;
  set isVariantSpecific(bool value) =>
      setField<bool>('is_variant_specific', value);
}
