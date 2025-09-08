import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flower_app/project_layers/api_layer/api_client/api_client.dart';
import 'package:flower_app/project_layers/api_layer/models/response/best_seller_mapper.dart';
import 'package:injectable/injectable.dart';
import '../../../core/errors/failures.dart';
import '../../data_layer/data_source/best_seller_data_source.dart';
import '../../domain_layer/entities/best_seller_response_entity.dart';

@Injectable(as: BestSellerDataSource)
class BestSellerDataSourceImpl implements BestSellerDataSource {
  final ApiClient apiClient;

  BestSellerDataSourceImpl({required this.apiClient});

  @override
  Future<Either<BestSellerResponseEntity, Failures>> getBestSellersProduct() async {
    try {
      var response = await apiClient.getBestSellersProduct();
      var statusCode = response.response.statusCode;

      if (statusCode! >= 200 && statusCode < 300) {
        final bestSellerResponse = response.data;
        final entity = BestSellerMapper.toEntity(bestSellerResponse);
        return Left(entity);
      } else {
        return Right(
          ServerError(errorMessage: response.data.message ?? "Server Error"),
        );
      }
    } on DioException catch (e) {
      return Right(
        ServerError(
          errorMessage: e.response?.data?.toString() ?? "Unknown Dio error",
        ),
      );
    } catch (e) {
      return Right(ServerError(errorMessage: "Unexpected error: $e"));
    }
  }
}