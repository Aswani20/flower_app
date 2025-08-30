import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../../domain_layer/entities/best_seller_response_entity.dart';

abstract class BestSellerDataSource {
  Future<Either<BestSellerResponseEntity, Failures>> getBestSellers();
}
