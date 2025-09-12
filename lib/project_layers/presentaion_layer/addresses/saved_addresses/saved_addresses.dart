import 'package:flower_app/core/di/di.dart';
import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/core/route/app_routes.dart';
import 'package:flower_app/project_layers/domain_layer/entities/address_response_entity.dart';
import 'package:flower_app/project_layers/presentaion_layer/addresses/address_state.dart';
import 'package:flower_app/project_layers/presentaion_layer/addresses/saved_addresses/components/address_tile.dart';
import 'package:flower_app/project_layers/presentaion_layer/addresses/saved_addresses/cubit/saved_address_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SavedAddressesScreen extends StatelessWidget {
  const SavedAddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<SavedAddressCubit>()..getAddresses(),
      child: SavedAddressesBody(),
    );
  }
}

class SavedAddressesBody extends StatelessWidget {
  const SavedAddressesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60.h,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Text(context.l10n.address),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<SavedAddressCubit, AddressState>(
        builder: (context, state) {
          if (state is GetAddressLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetAddressFailure) {
            return Center(child: Text(state.error));
          } else if (state is GetAddressSuccess) {
            final addresses = state.addresses.addresses;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.stretch,
                spacing: 15.h,
                children: [
                  Expanded(
                    flex: 2,
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return AddressTile(
                          addressEntity: addresses[index],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 24.h);
                      },
                      itemCount: addresses!.length,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(
                        context,
                      ).pushNamed(AppRoutes.addAddress);
                    },
                    child: Text(
                      context.l10n.add_new_address,
                      style: context.textTheme.bodyMedium
                          ?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
