import 'package:astronomy_picture/core/failure.dart';
import 'package:astronomy_picture/domain/entities/apod.dart';
import 'package:dartz/dartz.dart';

abstract class TodayApodRepository {
  /// Return a Apod date on Right side of Either cas is a success, othewise
  /// Return a Failure on Left side of Either
  Future<Either<Failure, Apod>> fecthApoToday();
}
