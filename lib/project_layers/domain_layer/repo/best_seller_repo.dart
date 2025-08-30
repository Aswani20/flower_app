import 'package:dartz/dartz.dart';
import 'package:flower_app/core/errors/failures.dart';
import '../entities/best_seller_response_entity.dart';

abstract class BestSellerRepo {
  Future<Either<BestSellerResponseEntity , Failures>> getBestSellersProduct();
}
