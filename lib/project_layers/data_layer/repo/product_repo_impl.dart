import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/data_layer/data_source/product_data_source.dart';
import 'package:flower_app/project_layers/domain_layer/entities/product_entity.dart';
import 'package:flower_app/project_layers/domain_layer/repo/product_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductRepo)
class ProductRepoImpl implements ProductRepo {
  ProductDataSource productDataSource;

  ProductRepoImpl(this.productDataSource);

  @override
  Future<ApiResult<List<ProductEntity>>> getProducts(String? occasionId) async {
    return await productDataSource.getProducts(occasionId);
  }
}
