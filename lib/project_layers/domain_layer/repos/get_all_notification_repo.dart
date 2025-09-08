import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/domain_layer/entities/natification_entity.dart';

abstract class GetAllNotificationRepo {
  Future<ApiResult<List<NotificationEntity>>>
  getAllNotification();
}
