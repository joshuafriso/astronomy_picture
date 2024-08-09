import 'package:astronomy_picture/core/failure.dart';
import 'package:astronomy_picture/domain/entities/apod.dart';
import 'package:astronomy_picture/domain/repositories/today_apod/today_apod_repository.dart';
import 'package:astronomy_picture/domain/usecases/core/usecase.dart';
import 'package:astronomy_picture/domain/usecases/today_apod/fetch_apod_today.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../test_values.dart';
import 'fetch_apod_today_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TodayApodRepository>()])
void main() {
  late MockTodayApodRepository repository;
  late FetchApoToday usecase;

  setUp(() {
    repository = MockTodayApodRepository();
    usecase = FetchApoToday(repository: repository);
  });

  test('Need to return a Apod entity on the right side of Either', () async {
    when(repository.fecthApoToday())
        .thenAnswer((_) async => Right<Failure, Apod>(tApod()));

    final result = await usecase(NoParameter());

    expect(result, Right<Failure, Apod>(tApod()));
  });

  test('Need to return a Failure entity on the left side of Either', () async {
    when(repository.fecthApoToday())
        .thenAnswer((_) async => Left<Failure, Apod>(tNoConnection()));

    final result = await usecase(NoParameter());

    expect(result, Left<Failure, Apod>(tNoConnection()));
  });
}
