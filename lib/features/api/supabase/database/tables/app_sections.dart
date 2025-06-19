import '../database.dart';

class AppSectionsTable extends SupabaseTable<AppSectionsRow> {
  @override
  String get tableName => 'app_sections';

  @override
  AppSectionsRow createRow(Map<String, dynamic> data) => AppSectionsRow(data);
}

class AppSectionsRow extends SupabaseDataRow {
  AppSectionsRow(super.data);

  @override
  SupabaseTable get table => AppSectionsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get sectionName => getField<String>('section_name')!;
  set sectionName(String value) => setField<String>('section_name', value);
}
