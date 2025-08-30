import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../core/errors/failures.dart';
import '../../domain_layer/entities/best_seller_response_entity.dart';
import '../../domain_layer/repos/best_seller_repo.dart';
import '../data_source/best_seller_data_source.dart';

@Injectable(as: BestSellerRepo)
class BestSellerRepoImpl implements BestSellerRepo {
  final BestSellerDataSource bestSellerDataSource;

  BestSellerRepoImpl({required this.bestSellerDataSource});

  @override
  Future<Either<BestSellerResponseEntity, Failures>> getBestSellersProduct() async {
    return await bestSellerDataSource.getBestSellersProduct();
  }
}
