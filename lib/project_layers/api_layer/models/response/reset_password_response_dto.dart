import 'package:flower_app/project_layers/domain_layer/entities/reset_password_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reset_password_response_dto.g.dart';

@JsonSerializable()
class ResetPasswordResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "token")
  final String? token;

  ResetPasswordResponseDto ({
    this.message,
    this.token,
  });

  factory ResetPasswordResponseDto.fromJson(Map<String, dynamic> json) {
    return _$ResetPasswordResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ResetPasswordResponseDtoToJson(this);
  }

  ResetPasswordResponseEntity toEntity(){
    ResetPasswordResponseEntity resetPasswordResponseEntity = ResetPasswordResponseEntity(
      message: message,
      token: token,
    );
    return resetPasswordResponseEntity;
  }
}


