import 'package:flower_app/core/errors/failures.dart';
import 'package:flower_app/project_layers/api_layer/api_client/api_client.dart';
import 'package:flower_app/project_layers/data_layer/data_source/cart_remote_data_source.dart';
import 'package:flower_app/project_layers/domain_layer/entities/cart_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../core/di/modules/shared_preferences_module.dart';
import '../../../core/keys/shared_key.dart';


@Injectable(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl extends CartRemoteDataSource{
  final ApiClient _apiClient;
  CartRemoteDataSourceImpl(this._apiClient);


  @override
  Future<CartResponseEntity> addToCart(String productId, {int quantity = 1}) async{
    try{
      final token = SharedPrefHelper().getString(key: SharedPrefKeys.tokenKey,);
      var response = await _apiClient.addToCart({"product" : productId, "quantity" : quantity}, "Bearer $token");
      var statusCode = response.response.statusCode ?? 500;
      var cartData = response.data;
      if (statusCode >= 200 && statusCode < 300) {
        print("cartData: ${cartData.numOfCartItems}");
        return cartData.toEntity();
      }else{
        throw ServerError(errorMessage: cartData.message ?? "Server Error");
      }
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }

  }

  @override
  Future<CartResponseEntity> getCart() async {
    try{
      final token = SharedPrefHelper().getString(key: SharedPrefKeys.tokenKey,);
      var response = await _apiClient.getCart("Bearer $token");
      var statusCode = response.response.statusCode ?? 500;
      var cartData = response.data;
      if (statusCode >= 200 && statusCode < 300) {
        print("cartData: ${cartData.numOfCartItems}");
        return cartData.toEntity();
      }else{
        throw ServerError(errorMessage: cartData.message ?? "Server Error");
      }
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }

  }

  @override
  Future<CartResponseEntity> deleteItemFromCart(String itemId) async{
    try{
      final token = SharedPrefHelper().getString(key: SharedPrefKeys.tokenKey,);
      var response = await _apiClient.deleteItemFromCart(itemId, "Bearer $token");
      var statusCode = response.response.statusCode ?? 500;
      var cartData = response.data;
      if (statusCode >= 200 && statusCode < 300) {
        print("Item Deleted Successfully");
        return cartData.toEntity();

      }else{
        throw ServerError(errorMessage: cartData.message ?? "Server Error");
      }
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }
}