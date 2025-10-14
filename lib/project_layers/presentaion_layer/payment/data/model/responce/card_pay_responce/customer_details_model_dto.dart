import 'package:json_annotation/json_annotation.dart';
part 'customer_details_model_dto.g.dart';

@JsonSerializable()
class CustomerDetailsModelDto {
  final String? email;
  final String? name;
  final String? phone;
  @JsonKey(name: 'tax_exempt')
  final String? taxExempt;

  CustomerDetailsModelDto({this.email, this.name, this.phone, this.taxExempt});

  factory CustomerDetailsModelDto.fromJson(Map<String, dynamic> json) =>
      _$CustomerDetailsModelDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerDetailsModelDtoToJson(this);
}
