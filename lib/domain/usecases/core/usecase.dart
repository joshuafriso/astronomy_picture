import 'package:astronomy_picture/core/failure.dart';
import 'package:dartz/dartz.dart';

abstract class Usecase<R, P> {
  /// Default useCase
  /// R is the return of function call
  /// P is the parameter of the function call
  Future<Either<Failure, R>> call(P parameter);
}

class NoParameter {}
