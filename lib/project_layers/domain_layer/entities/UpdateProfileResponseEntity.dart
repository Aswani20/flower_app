import 'package:flower_app/project_layers/domain_layer/entities/get_logged_user_entity.dart';

class UpdateProfileResponseEntity {
  UpdateProfileResponseEntity({this.message, this.user});

  String? message;
  GetLoggedUserEntity? user;
}
