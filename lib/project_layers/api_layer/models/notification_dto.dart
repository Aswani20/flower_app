import 'package:flower_app/project_layers/domain_layer/entities/natification_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification_dto.g.dart';

@JsonSerializable()
class NotificationDto {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "body")
  final String? body;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "__v")
  final int? V;

  NotificationDto({
    this.id,
    this.title,
    this.body,
    this.createdAt,
    this.updatedAt,
    this.V,
  });

  factory NotificationDto.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$NotificationDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$NotificationDtoToJson(this);
  }

  NotificationEntity toNotificationEntity() {
    return NotificationEntity(
      id: id,
      title: title,
      body: body,
    );
  }
}
