import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/data_layer/data_source/category_remote_data_source.dart';
import 'package:flower_app/project_layers/domain_layer/entities/category_entity.dart';
import 'package:flower_app/project_layers/domain_layer/repo/category_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoryRepo)
class CategoryRepoImpl implements CategoryRepo {
  CategoryRemoteDataSource categoryRemoteDataSource;
  CategoryRepoImpl(this.categoryRemoteDataSource);
  @override
  Future<ApiResult<List<CategoryEntity>>>
  getCategories() async {
    return await categoryRemoteDataSource.getCategories();
  }
}
