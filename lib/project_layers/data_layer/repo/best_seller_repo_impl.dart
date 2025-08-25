import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../core/errors/failures.dart';
import '../../api_layer/responses/best_seller_response.dart';
import '../../domain_layer/repo/best_seller_repo.dart';
import '../data_source/best_seller_data_source.dart';

@Injectable(as: BestSellerRepo)
class BestSellerRepoImpl implements BestSellerRepo {
  final BestSellerDataSource bestSellerDataSource;

  BestSellerRepoImpl({required this.bestSellerDataSource});

  @override
  Future<Either<Failures, BestSellerResponse>> bestSeller() async {
    try {
      final response = await bestSellerDataSource.bestSeller();
      return Right(response);
    } on NetworkError catch (e) {
      return Left(NetworkError(errorMessage: e.errorMessage));
    } on ServerError catch (e) {
      return Left(ServerError(errorMessage: e.errorMessage));
    } catch (e) {
      return Left(UserError(errorMessage: 'Unexpected error: $e'));
    }
  }
}
