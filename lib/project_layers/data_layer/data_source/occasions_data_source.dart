import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/domain_layer/entities/occasion_response_entity.dart';

abstract class OccasionsDataSource {
  Future<ApiResult<List<OccasionEntity>>> getOccasions();
}
