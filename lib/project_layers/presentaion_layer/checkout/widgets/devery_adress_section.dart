import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Address {
  final int id;
  final String title;
  final String address;

  Address({
    required this.id,
    required this.title,
    required this.address,
  });
}

class DeliveryAddressSection extends StatefulWidget {
  const DeliveryAddressSection({super.key});

  @override
  State<DeliveryAddressSection> createState() =>
      _DeliveryAddressSectionState();
}

class _DeliveryAddressSectionState
    extends State<DeliveryAddressSection> {
  int? selectedAddressId;
  List<Address> addresses = [
    Address(
      id: 1,
      title: 'Home',
      address: '2XVP+XC - Sheikh Zayed',
    ),
    Address(
      id: 2,
      title: 'Office',
      address: '5ABC+XY - Downtown Dubai',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Delivery Address',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: addresses.length,
            itemBuilder: (context, index) {
              final address = addresses[index];
              return Padding(
                padding: const EdgeInsets.only(
                  bottom: 10,
                ),
                child: Card(
                  elevation: 5,
                  shadowColor: Colors.black,
                  child: RadioListTile<int>(
                    value: address.id,
                    groupValue: selectedAddressId,
                    onChanged: (value) {
                      setState(() {
                        selectedAddressId = value;
                      });
                    },
                    activeColor: AppColors.pink,
                    controlAffinity:
                        ListTileControlAffinity.leading,
                    title: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,

                              size: 20,
                            ),
                            const SizedBox(width: 3),
                            Text(
                              address.title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight:
                                    FontWeight.w600,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.grey,
                                size: 24,
                              ),
                              onPressed: () {
                                // Handle edit button press
                              },
                            ),
                          ],
                        ),
                        Text(
                          address.address,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          CustomButton(
            onPressed: () {},
            borderRadius: 55,
            size: Size(double.infinity, 20.h),
            borderSide: BorderSide(color: AppColors.grey),
            backgroundColorButton: AppColors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.add,
                  size: 20,
                  color: AppColors.pink,
                ),
                const SizedBox(width: 3),
                Text(
                  ' Add New',
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.pink,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
