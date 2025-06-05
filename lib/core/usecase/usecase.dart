import "package:bazora/core/either/either.dart";
import "package:bazora/core/error/failure.dart";

abstract class UseCase<Type, Params> {
  const UseCase();

  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}
