import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/data_layer/data_source/occasions_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../domain_layer/entities/occasion_response_entity.dart';
import '../../domain_layer/repo/occasion_repo.dart';

@Injectable(as: OccasionRepo)
class OccasionsRepoImpl implements OccasionRepo {
  OccasionsDataSource occasionDataSource;

  OccasionsRepoImpl(this.occasionDataSource);

  @override
  Future<ApiResult<List<OccasionEntity>>> getOccasions() async {
    return await occasionDataSource.getOccasions();
  }
}
