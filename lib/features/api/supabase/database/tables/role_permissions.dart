import '../database.dart';

class RolePermissionsTable extends SupabaseTable<RolePermissionsRow> {
  @override
  String get tableName => 'role_permissions';

  @override
  RolePermissionsRow createRow(Map<String, dynamic> data) =>
      RolePermissionsRow(data);
}

class RolePermissionsRow extends SupabaseDataRow {
  RolePermissionsRow(super.data);

  @override
  SupabaseTable get table => RolePermissionsTable();

  int? get roleId => getField<int>('role_id');
  set roleId(int? value) => setField<int>('role_id', value);

  int? get permissionId => getField<int>('permission_id');
  set permissionId(int? value) => setField<int>('permission_id', value);
}
