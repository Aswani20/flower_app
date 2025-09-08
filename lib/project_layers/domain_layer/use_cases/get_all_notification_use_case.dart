import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/domain_layer/entities/natification_entity.dart';
import 'package:flower_app/project_layers/domain_layer/repos/get_all_notification_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllNotificationUseCase {
  GetAllNotificationRepo getAllNotificationRepo;

  GetAllNotificationUseCase(this.getAllNotificationRepo);

  Future<ApiResult<List<NotificationEntity>>>
  call() async {
    final result = await getAllNotificationRepo
        .getAllNotification();
    return result;
  }
}
