import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/data_layer/data_source/get_all_notification_remote_data_source.dart';
import 'package:flower_app/project_layers/domain_layer/entities/natification_entity.dart';
import 'package:flower_app/project_layers/domain_layer/repos/get_all_notification_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetAllNotificationRepo)
class GetAllNotificationRepoImpl
    implements GetAllNotificationRepo {
  GetAllNotificationRemoteDataSource
  getAllNotificationRemoteDataSource;

  GetAllNotificationRepoImpl(
    this.getAllNotificationRemoteDataSource,
  );
  @override
  Future<ApiResult<List<NotificationEntity>>>
  getAllNotification() async {
    return await getAllNotificationRemoteDataSource
        .getAllNotification();
  }
}
