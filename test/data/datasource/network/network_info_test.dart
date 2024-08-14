import 'package:astronomy_picture/data/datasources/network/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'network_info_test.mocks.dart';

@GenerateNiceMocks([MockSpec<InternetConnectionChecker>()])
void main() {
  late MockInternetConnectionChecker internetConnection;
  late NetworkInfoImpl networkInfo;

  setUp(() {
    internetConnection = MockInternetConnectionChecker();
    networkInfo = NetworkInfoImpl(internetConnection: internetConnection);
  });

  test("Need to return true if has connection", () async {
    when(internetConnection.hasConnection)
        .thenAnswer((realInvocation) async => true);
    final result = await networkInfo.isConnected;

    expect(result, true);
  });

  test("Need to return false if has not connection", () async {
    when(internetConnection.hasConnection)
        .thenAnswer((realInvocation) async => false);
    final result = await networkInfo.isConnected;

    expect(result, false);
  });
}
