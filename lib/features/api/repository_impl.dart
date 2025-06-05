import "dart:developer";
import "dart:io";
import "package:dio/dio.dart";
import "package:bazora/constants/constants.dart";
import "package:bazora/core/error/failure.dart";
import "package:bazora/core/error/server_error.dart";
import "package:bazora/features/api/repository.dart";
import "package:bazora/router/app_routes.dart";

class RepositoryImpl implements Repository {
  const RepositoryImpl({required this.dio});

  final Dio dio;


  // @override
  // Future<Either<Failure, LoginUserResponse>> login({required LoginUserRequest request}) async {
  //   try {
  //     final Response response = await dio.post(
  //       Constants.baseUrl + Urls.login,
  //       data: request.toJson(),
  //     );
  //     return Right(LoginUserResponse.fromJson(response.data));
  //   } on DioException catch (error, stacktrace) {
  //     log("Exception occurred -: $error stacktrace: $stacktrace");
  //     return Left(ServerError.withDioError(error: error).failure);
  //   } on Exception catch (error, stacktrace) {
  //     log("Exception occurred --: $error stacktrace: $stacktrace");
  //     return Left(ServerError.withError(message: error.toString()).failure);
  //   }
  // }
  //
  //
  // @override
  // Future<Either<Failure, ActivateQrResponse>> getActivateQr({required String id}) async {
  //   try {
  //     final Response response = await dio.get(
  //       "${Constants.baseUrl}${Urls.eventsActivateQR}$id/",
  //       options: Options(headers: {
  //         "Authorization": "Bearer ${localSource.accessToken}",
  //       }),
  //     );
  //     return Right(ActivateQrResponse.fromJson(response.data));
  //   } on DioException catch (error, stacktrace) {
  //     log("Exception occurred -: $error stacktrace: $stacktrace");
  //     return Left(ServerError.withDioError(error: error).failure);
  //   } on Exception catch (error, stacktrace) {
  //     log("Exception occurred --: $error stacktrace: $stacktrace");
  //     return Left(ServerError.withError(message: error.toString()).failure);
  //   }
  // }
  //
  //
  // @override
  // Future<Either<Failure, ScannedHistoryResponse>> getScannedHistory() async {
  //   try {
  //     final Response response = await dio.get("${Constants.baseUrl}${Urls.eventsScannedHistory}",
  //         options: Options(headers: {
  //           "Authorization": "Bearer ${localSource.accessToken}",
  //         }));
  //     return Right(ScannedHistoryResponse.fromJson(response.data));
  //   } on DioException catch (error, stacktrace) {
  //     log("Exception occurred: $error stacktrace: $stacktrace");
  //     return Left(ServerError.withDioError(error: error).failure);
  //   } on Exception catch (error, stacktrace) {
  //     log("Exception occurred: $error stacktrace: $stacktrace");
  //     return Left(ServerError.withError(message: error.toString()).failure);
  //   }
  // }

}
