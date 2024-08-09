import 'package:astronomy_picture/core/failure.dart';
import 'package:astronomy_picture/data/datasources/network/network_info.dart';
import 'package:astronomy_picture/data/datasources/today_apod/today_apod_data_source.dart';
import 'package:astronomy_picture/data/repositories/today_apod/today_apod_repository_impl.dart';
import 'package:astronomy_picture/domain/entities/apod.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../test_values.dart';
import 'today_apod_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TodayApodDataSource>(), MockSpec<NetworkInfo>()])
void main() {
  late MockTodayApodDataSource dataSource;
  late MockNetworkInfo networkInfo;
  late TodayApodRepositoryImpl repository;

  setUp(() {
    dataSource = MockTodayApodDataSource();
    networkInfo = MockNetworkInfo();
    repository = TodayApodRepositoryImpl(
        dataSource: dataSource, networkInfo: networkInfo);
  });

  group("function fetchTodayApod", () {
    test('Need to return a Apod entity on the right side of Either', () async {
      when(networkInfo.isConnected).thenAnswer((_) async => true);
      when(dataSource.fetchTodayApod()).thenAnswer((_) async => tApodModel());

      final result = await repository.fecthApoToday();

      expect(result, Right<Failure, Apod>(tApodModel()));
    });
    test(
        'Need to return a Failure entity on the left side of Either from data source',
        () async {
      when(networkInfo.isConnected).thenAnswer((_) async => true);
      when(dataSource.fetchTodayApod()).thenThrow(ApiFailure());

      final result = await repository.fecthApoToday();

      expect(result, Left<Failure, Apod>(ApiFailure()));
    });
    test(
        "Need to return a Failure entity on the left side of Either NoConnection type",
        () async {
      when(networkInfo.isConnected).thenAnswer((_) async => false);

      final result = await repository.fecthApoToday();

      verifyNever(dataSource.fetchTodayApod());

      expect(result, Left<Failure, Apod>(NoConnection()));
    });
  });
}
