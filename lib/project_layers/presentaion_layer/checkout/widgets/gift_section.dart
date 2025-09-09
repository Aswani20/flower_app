import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/core/utils/widgets/app_text_form_feild.dart';
import 'package:flutter/material.dart';

class GiftInfoSection extends StatefulWidget {
  const GiftInfoSection({super.key});

  @override
  State<GiftInfoSection> createState() =>
      _GiftInfoSectionState();
}

class _GiftInfoSectionState
    extends State<GiftInfoSection> {
  bool _isGift = false;
  final TextEditingController _nameController =
      TextEditingController();
  final TextEditingController _phoneController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SwitchListTile(
            title: Text(
              'It is a gift',
              style: const TextStyle(
                fontSize: 18,
                color: AppColors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            value: _isGift,
            onChanged: (bool value) {
              setState(() {
                _isGift = value;
              });
            },
            activeColor: AppColors.pink,
            contentPadding: EdgeInsets.zero,
          ),
          const SizedBox(height: 10),
          Visibility(
            visible: _isGift,
            child: Card(
              child: Column(
                children: [
                  AppTextFormFeild(
                    controller: _nameController,
                    hintText: 'Enter your name',
                  ),
                  const SizedBox(height: 15),
                  AppTextFormFeild(
                    controller: _phoneController,
                    hintText: 'Enter your phone',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}
