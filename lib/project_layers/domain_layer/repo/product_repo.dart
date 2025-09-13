import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/domain_layer/entities/product_entity.dart';

abstract class ProductRepo {
  Future<ApiResult<List<ProductEntity>>> getProducts(String? occasionId);
}
