part of 'catalog_page_bloc.dart';

enum ApiStatus { initial, loading, success, error }

class CatalogPageState extends Equatable {
  const CatalogPageState({this.status = ApiStatus.initial});

  final ApiStatus status;


  CatalogPageState copyWith({
    ApiStatus? status,
  }) => CatalogPageState(
    status: status ?? this.status,
  );

  @override
  List<Object?> get props => [ status ];
}
