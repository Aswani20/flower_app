import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/core/route/app_routes.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/project_layers/presentaion_layer/checkout/presentation/view_model/cubit/checkout/checkout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'delivery_address_card.dart';

class DeliveryAddressSection extends StatelessWidget {
  const DeliveryAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CheckoutCubit>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.delivery_address,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 16.h),
          BlocBuilder<CheckoutCubit, CheckoutState>(
            builder: (context, state) {
              if (state.isLoading) {
                return SizedBox(
                  height: 50.h,
                  child: const Center(child: CircularProgressIndicator()),
                );
              }

              if (state.addresses.isEmpty) {
                return Center(child: Column(
                  children: [
                    Text(context.l10n.no_addresses_found , style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.grey)),
                    16.heightBox,
                    AddAddressWidget(),
                    8.heightBox,
                  ],
                ));
              }

              return Column(
                children: [
                  for (final address in state.addresses) ...[
                    DeliveryAddressCard(
                      title: address.street!,
                      subtitle: address.city!,
                      isSelected: state.selectedAddress == address,
                      onEdit: () {},
                      onSelect: () => cubit.selectAddress(address),
                    ),
                    SizedBox(height: 16.h),
                  ],
                  AddAddressWidget(),
                  16.heightBox,
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class AddAddressWidget extends StatelessWidget {
  const AddAddressWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(AppRoutes.savedAddresses);
      },
      child: Container(
        height: 36.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: AppColors.grey.withValues(alpha: 0.5),
          ),
          color: AppColors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.add, color: AppColors.pink),
            SizedBox(width: 8.w),
            Text(
              context.l10n.add_new,
              style: Theme.of(context).textTheme.labelLarge!
                  .copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.pink,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
