import '../database.dart';

class PointImagesTable extends SupabaseTable<PointImagesRow> {
  @override
  String get tableName => 'point_images';

  @override
  PointImagesRow createRow(Map<String, dynamic> data) => PointImagesRow(data);
}

class PointImagesRow extends SupabaseDataRow {
  PointImagesRow(super.data);

  @override
  SupabaseTable get table => PointImagesTable();

  String get imageId => getField<String>('image_id')!;
  set imageId(String value) => setField<String>('image_id', value);

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

  int? get pointId => getField<int>('point_id');
  set pointId(int? value) => setField<int>('point_id', value);
}
