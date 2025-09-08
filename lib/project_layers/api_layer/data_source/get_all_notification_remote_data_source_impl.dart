import 'package:dio/dio.dart';
import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/api_layer/api_client/api_client.dart';
import 'package:flower_app/project_layers/api_layer/models/get_all_notification_response_dto.dart';
import 'package:flower_app/project_layers/data_layer/data_source/get_all_notification_remote_data_source.dart';
import 'package:flower_app/project_layers/domain_layer/entities/natification_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetAllNotificationRemoteDataSource)
class GetAllNotificationRemoteDataSourceImpl
    implements GetAllNotificationRemoteDataSource {
  ApiClient apiClient;
  GetAllNotificationRemoteDataSourceImpl(this.apiClient);
  @override
  Future<ApiResult<List<NotificationEntity>>>
  getAllNotification() async {
    // final token = SharedPrefHelper().getString(
    //   key: SharedPrefKeys.tokenKey,
    // );
    try {
      GetAllNotificationResponseDto
      notificationsResponse = await apiClient
          .getNotifications();
      return ApiSuccessResult(
        notificationsResponse.notifications!
            .map((e) => e.toNotificationEntity())
            .toList(),
      );
    } catch (e) {
      if (e is DioException) {
        final responseData = e.response?.data;
        if (responseData != null &&
            responseData is Map<String, dynamic>) {
          final message =
              responseData["message"] ?? "Unknown error";
          return ApiErrorResult<List<NotificationEntity>>(
            message.toString(),
          );
        }
        return ApiErrorResult<List<NotificationEntity>>(
          e.message ?? e.toString(),
        );
      }
      return ApiErrorResult<List<NotificationEntity>>(
        e.toString(),
      );
    }
  }
}
