import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethodSection extends StatefulWidget {
  const PaymentMethodSection({super.key});

  @override
  State<PaymentMethodSection> createState() =>
      _PaymentMethodSectionState();
}

enum PaymentMethod { cashOnDelivery, creditCard }

class _PaymentMethodSectionState
    extends State<PaymentMethodSection> {
  PaymentMethod? _selectedMethod;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Method',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey),
            ),
            child: Column(
              children: [
                RadioListTile<PaymentMethod>(
                  title: Text(
                    'Cash on Delivery',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  value: PaymentMethod.cashOnDelivery,
                  groupValue: _selectedMethod,
                  onChanged: (PaymentMethod? value) {
                    setState(() {
                      _selectedMethod = value;
                    });
                  },
                  activeColor: AppColors.pink,
                  controlAffinity:
                      ListTileControlAffinity.trailing,
                ),
                const Divider(
                  color: Colors.grey,
                  indent: 20,
                  endIndent: 20,
                ),
                RadioListTile<PaymentMethod>(
                  title: Text(
                    'Credit Card',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  value: PaymentMethod.creditCard,
                  groupValue: _selectedMethod,
                  onChanged: (PaymentMethod? value) {
                    setState(() {
                      _selectedMethod = value;
                    });
                  },
                  activeColor: AppColors.pink,
                  controlAffinity:
                      ListTileControlAffinity.trailing,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
