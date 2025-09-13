import 'package:dio/dio.dart';
import 'package:flower_app/core/api_result/api_result.dart';

import 'package:flower_app/project_layers/api_layer/models/response/order_response.dart';

import '../../data_layer/data_source/orders_data_source.dart';
import '../api_client/api_client.dart';

class OrdersDataSourceImpl implements OrdersDataSource {
  final ApiClient apiClient;

  OrdersDataSourceImpl({required this.apiClient});

  @override
  Future<ApiResult<OrderResponse>> orders() async {
    try {
      final orderResponse = await apiClient.orders();
      return ApiSuccessResult(orderResponse);
    } catch (e) {
      if (e is DioException) {
        final responseData = e.response?.data;
        if (responseData != null &&
            responseData is Map<String, dynamic>) {
          final message =
              responseData["message"] ?? "Unknown error";
          return ApiErrorResult<OrderResponse>(
            message.toString(),
          );
        }
        return ApiErrorResult<OrderResponse>(
          e.message ?? e.toString(),
        );
      }
      return ApiErrorResult<OrderResponse>(e.toString());
    }
  }
}
