import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/domain_layer/entities/address_response_entity.dart';
import 'package:flower_app/project_layers/domain_layer/use_cases/get_address_use_case.dart';
import 'package:flower_app/project_layers/presentaion_layer/addresses/address_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SavedAddressCubit extends Cubit<AddressState> {
  SavedAddressCubit(this.getAddressUseCase)
    : super(AddressInitial());

  // save data
  // handle data
  GetAddressUseCase getAddressUseCase;

  // add address
  Future<void> getAddresses() async {
    emit(GetAddressLoading());
    try {
      // Create updated user entity with current form data
      final result = await getAddressUseCase.invoke();

      switch (result) {
        case ApiSuccessResult<AddressResponseEntity>():
          emit(GetAddressSuccess(result.data));
          print(result.data.address);
          break;

        case ApiErrorResult<AddressResponseEntity>():
          emit(GetAddressFailure(result.errorMessage));
          break;
      }
    } catch (e) {
      emit(
        AddAddressFailure(
          'Failed to add address: ${e.toString()}',
        ),
      );
    }
  }
}
