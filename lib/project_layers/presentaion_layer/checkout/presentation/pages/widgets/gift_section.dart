import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/core/utils/app_regex.dart';
import 'package:flower_app/project_layers/presentaion_layer/checkout/presentation/view_model/cubit/checkout/checkout_cubit.dart';
import 'package:flower_app/project_layers/presentaion_layer/checkout/presentation/view_model/cubit/checkout/checkout_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GiftSection extends StatefulWidget {
  const GiftSection({super.key});

  @override
  State<GiftSection> createState() => _GiftSectionState();
}

class _GiftSectionState extends State<GiftSection> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CheckoutCubit>();
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Switch(
                      value: state.isGift,
                      onChanged: (val) => cubit.doIntent(ToggleGift(val)),
                    ),
                    Text(context.l10n.its_a_gift),
                  ],
                ),

                if (state.isGift) ...[
                  const SizedBox(height: 12),
                  TextFormField(
                    onChanged: (val) {
                      cubit.doIntent(UpdateGiftStreet(val));
                    },
                    decoration: InputDecoration(
                      labelText: context.l10n.street,
                      hintText: context.l10n.enter_your_street,
                    ),
                    validator: AppRegex.validateName,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    onChanged: (val) {
                      cubit.doIntent(UpdateGiftCity(val));
                    },
                    decoration: InputDecoration(
                      labelText: context.l10n.city,
                      hintText: context.l10n.enter_your_city,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    maxLength: 11,
                    initialValue: '01',
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.phone,
                    onChanged: (val) {
                      cubit.doIntent(UpdateGiftPhone(val));
                    },
                    decoration: InputDecoration(
                      labelText: context.l10n.phone,
                      hintText: context.l10n.enter_your_phone,
                      counter: const SizedBox.shrink(),
                    ),
                    validator: AppRegex.validatePhoneNumber,
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
