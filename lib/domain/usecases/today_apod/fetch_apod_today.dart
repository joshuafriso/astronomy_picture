import 'package:astronomy_picture/core/failure.dart';
import 'package:astronomy_picture/domain/entities/apod.dart';
import 'package:astronomy_picture/domain/repositories/today_apod/today_apod_repository.dart';
import 'package:astronomy_picture/domain/usecases/core/usecase.dart';
import 'package:dartz/dartz.dart';

class FetchApoToday extends Usecase<Apod, NoParameter> {
  final TodayApodRepository repository;

  FetchApoToday({required this.repository});

  @override
  Future<Either<Failure, Apod>> call(NoParameter parameter) async {
    return await repository.fecthApoToday();
  }
}
