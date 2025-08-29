import 'package:flower_app/project_layers/domain_layer/entities/verify_reset_code_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verify_reset_code_response.g.dart';

@JsonSerializable()
class VerifyResetCodeResponseDto {
  @JsonKey(name: "status")
  final String? status;

  VerifyResetCodeResponseDto ({
    this.status,
  });

  factory VerifyResetCodeResponseDto.fromJson(Map<String, dynamic> json) {
    return _$VerifyResetCodeResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$VerifyResetCodeResponseDtoToJson(this);
  }

  VerifyResetCodeResponseEntity toEntity(){
    VerifyResetCodeResponseEntity verifyResetCodeResponseEntity = VerifyResetCodeResponseEntity(
      status: status,
    );
    return verifyResetCodeResponseEntity;
  }
}


