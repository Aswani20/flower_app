import 'package:dio/dio.dart';
import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/api_layer/api_client/api_client.dart';
import 'package:flower_app/project_layers/api_layer/models/request/add_address_request_dto.dart';
import 'package:flower_app/project_layers/api_layer/models/response/address_response_dto.dart';
import 'package:flower_app/project_layers/data_layer/data_source/address_data_source.dart';
import 'package:flower_app/project_layers/domain_layer/entities/address_response_entity.dart';
import 'package:flower_app/project_layers/domain_layer/entities/request/add_address_request_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddressDataSource)
class AddAddressDataSourceImpl
    implements AddressDataSource {
  ApiClient apiClient;

  AddAddressDataSourceImpl(this.apiClient);

  @override
  Future<ApiResult<AddressResponseEntity>> addAddress(
    AddAddressRequestEntity addAddressRequestEntity,
  ) async {
    try {
      AddressResponseDto addAddressResponseDto =
          await apiClient.addAddresses(
            AddAddressRequestDto.fromEntity(
              addAddressRequestEntity,
            ),
          );
      return ApiSuccessResult(
        addAddressResponseDto.toEntity(),
      );
    } catch (e) {
      if (e is DioException) {
        final responseData = e.response?.data;
        if (responseData != null &&
            responseData is Map<String, dynamic>) {
          final message =
              responseData["message"] ?? "Unknown error";
          return ApiErrorResult<AddressResponseEntity>(
            message.toString(),
          );
        }
        return ApiErrorResult<AddressResponseEntity>(
          e.message ?? e.toString(),
        );
      }
      return ApiErrorResult<AddressResponseEntity>(
        e.toString(),
      );
    }
  }

  @override
  Future<ApiResult<AddressResponseEntity>>
  getAddresses() async {
    try {
      AddressResponseDto addressResponseDto =
          await apiClient.getAllAddresses();

      return ApiSuccessResult(
        addressResponseDto.toEntity(),
      );
    } catch (e) {
      if (e is DioException) {
        final responseData = e.response?.data;
        if (responseData != null &&
            responseData is Map<String, dynamic>) {
          final message =
              responseData["message"] ?? "Unknown error";
          return ApiErrorResult<AddressResponseEntity>(
            message.toString(),
          );
        }
        return ApiErrorResult<AddressResponseEntity>(
          e.message ?? e.toString(),
        );
      }
      return ApiErrorResult<AddressResponseEntity>(
        e.toString(),
      );
    }
  }
}
