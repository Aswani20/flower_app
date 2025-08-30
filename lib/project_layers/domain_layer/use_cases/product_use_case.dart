import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/domain_layer/entities/product_entity.dart';
import 'package:flower_app/project_layers/domain_layer/repos/product_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductUseCase {
  ProductRepo productRepo;
  ProductUseCase(this.productRepo);

  Future<ApiResult<List<ProductEntity>>> call(
    String? categoryId,
  ) async {
    final result = await productRepo.getProducts(
      categoryId,
    );
    return result;
  }
}
