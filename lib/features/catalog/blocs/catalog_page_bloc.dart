import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:bazora/core/either/either.dart";
import "package:bazora/core/error/failure.dart";
import "package:bazora/core/extension/extension.dart";
import "package:bazora/features/api/repository.dart";

part "catalog_page_event.dart";

part "catalog_page_state.dart";

class CatalogPageBloc extends Bloc<CatalogPageEvent, CatalogPageState> {
  CatalogPageBloc({required this.repository}) : super(const CatalogPageState()) {
    // on<GetActivateQrEvent>(_getActivateQr);
  }

  final Repository repository;
  //
  // Future<void> _getActivateQr(GetActivateQrEvent event, Emitter<HomePageState> emit) async {
  //   final result = await repository.getActivateQr(id: event.id);
  //   await result.fold(
  //         (Failure left) {emit(const HomePageState(status: ApiStatus.error)); },
  //         (ActivateQrResponse right) async {
  //
  //       emit(HomePageState(status: ApiStatus.success, response: right));
  //     },
  //   );
  // }


}
