import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../core/errors/failures.dart';
import '../../api_layer/responses/best_seller_response.dart';
import '../../domain_layer/entities/best_seller_response_entity.dart';
import '../../domain_layer/repo/best_seller_repo.dart';
import '../data_source/best_seller_data_source.dart';

@Injectable(as: BestSellerRepo)
class BestSellerRepoImpl implements BestSellerRepo {
  final BestSellerDataSource bestSellerDataSource;

  BestSellerRepoImpl({required this.bestSellerDataSource});

  @override
  Future<Either<BestSellerResponseEntity, Failures>> getBestSellers() async {
    // هذا صحيح - الDataSource سيعيد Either<BestSellerResponseEntity, Failures>
    return await bestSellerDataSource.getBestSellers();
  }
}
