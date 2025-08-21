import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flower_app/project_layers/api_layer/data_source/login_data_source/login_data_source_impl.dart';
import 'package:flower_app/project_layers/api_layer/api_client/api_client.dart';
import 'package:flower_app/project_layers/api_layer/requests/login_request/login_request.dart';
import 'package:flower_app/project_layers/api_layer/responses/login_response/login_response.dart';
import 'package:flower_app/core/errors/failures.dart';

@GenerateMocks([ApiClient])
import 'login_data_source_impl_test.mocks.dart';

void main() {
  late MockApiClient mockApiClient;
  late LoginDataSourceImpl dataSource;

  setUp(() {
    mockApiClient = MockApiClient();
    dataSource = LoginDataSourceImpl(mockApiClient);
  });

  final tRequest = LoginRequest(email: "marwan@gmail.com", password: "123456");
  final tResponse = LoginResponse(token: "token123", message: "Success");

  group("LoginDataSourceImpl", () {
    test("should return LoginResponse when login is successful", () async {
      // arrange
      when(
        mockApiClient.login(request: anyNamed('request')),
      ).thenAnswer((_) async => tResponse);

      // act
      final result = await dataSource.login(request: tRequest);

      // assert
      expect(result.token, tResponse.token);
      expect(result.message, tResponse.message);
      verify(mockApiClient.login(request: anyNamed('request'))).called(1);
    });

    test("should throw ServerError when token is null", () async {
      // arrange
      final invalidResponse = LoginResponse(token: null, message: "Fail");
      when(
        mockApiClient.login(request: anyNamed('request')),
      ).thenAnswer((_) async => invalidResponse);

      // act & assert
      expect(
        () => dataSource.login(request: tRequest),
        throwsA(isA<ServerError>()),
      );
      verify(mockApiClient.login(request: anyNamed('request'))).called(1);
    });

    test(
      "should throw NetworkError when ApiClient throws NetworkError",
      () async {
        // arrange
        when(
          mockApiClient.login(request: anyNamed('request')),
        ).thenThrow(NetworkError(errorMessage: "No internet"));

        // act & assert
        expect(
          () => dataSource.login(request: tRequest),
          throwsA(isA<NetworkError>()),
        );
        verify(mockApiClient.login(request: anyNamed('request'))).called(1);
      },
    );
    test("should throw UserError when server is unresponsive (timeout)", () async {
      // arrange
      when(mockApiClient.login(request: anyNamed('request')))
          .thenThrow(TimeoutException("Server timeout"));

      // act & assert
      expect(
            () => dataSource.login(request: tRequest),
        throwsA(isA<UserError>()),
      );

      verify(mockApiClient.login(request: anyNamed('request'))).called(1);
    });
    test("should throw ServerError when token is empty string", () async {
      // arrange
      final invalidResponse = LoginResponse(token: "", message: "Success");
      when(mockApiClient.login(request: anyNamed('request')))
          .thenAnswer((_) async => invalidResponse);

      // act & assert
      expect(
            () => dataSource.login(request: tRequest),
        throwsA(isA<ServerError>()),
      );

      verify(mockApiClient.login(request: anyNamed('request'))).called(1);
    });
    test("should throw UserError for unexpected response structure", () async {
      // arrange
      when(mockApiClient.login(request: anyNamed('request')))
          .thenAnswer((_) async => throw Exception("Bad response"));

      // act & assert
      expect(
            () => dataSource.login(request: tRequest),
        throwsA(isA<UserError>()),
      );

      verify(mockApiClient.login(request: anyNamed('request'))).called(1);
    });



    test(
      "should throw ServerError when ApiClient throws ServerError",
      () async {
        // arrange
        when(
          mockApiClient.login(request: anyNamed('request')),
        ).thenThrow(ServerError(errorMessage: "Server down"));

        // act & assert
        expect(
          () => dataSource.login(request: tRequest),
          throwsA(isA<ServerError>()),
        );
        verify(mockApiClient.login(request: anyNamed('request'))).called(1);
      },
    );
  });
}
