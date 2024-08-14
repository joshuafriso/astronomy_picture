import 'dart:convert';
import 'dart:io';

import 'package:astronomy_picture/core/failure.dart';
import 'package:astronomy_picture/data/datasources/today_apod/today_apod_data_source_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../../fixtures/fixtures.dart';
import '../../../mocks/mocks.mocks.dart';
import '../../../test_values.dart';

void main() {
  late MockClient client;
  late TodayApodDataSourceImpl dataSource;

  setUp(() {
    client = MockClient();
    dataSource = TodayApodDataSourceImpl(client: client);
  });

  group("Function fetchApodToday", () {
    test("Need to return an Apod model", () async {
      when(client.get(any)).thenAnswer((_) async => http.Response.bytes(
          utf8.encode(fixture("image_response.json")), 200));

      final result = await dataSource.fetchTodayApod();

      expect(result, tApodModel());
    });

    test(
        "Need to throw an ApiFailure when the API returns a different value than 200",
        () async {
      when(client.get(any)).thenAnswer((_) async => http.Response.bytes(
          utf8.encode(fixture("image_response.json")), 500));

      expect(() => dataSource.fetchTodayApod(), throwsA(isA<ApiFailure>()));
    });

    test("Need to throw an ApiFailure when having an exception", () async {
      when(client.get(any)).thenThrow(const SocketException("message"));

      expect(() => dataSource.fetchTodayApod(), throwsA(isA<ApiFailure>()));
    });
  });
}
