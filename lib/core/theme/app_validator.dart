import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flutter/material.dart';

class AppValidators {
  //Non_empty validator
  static String? nonEmptyField(value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return context.l10n.pleaseEnterValue;
    }
    return null;
  }

  //first-last name validator
  static String? nameValidator(value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return context.l10n.pleaseEnterName;
    }
    final lengthRegex = RegExp(r'^.{3,}$');
    if (!lengthRegex.hasMatch(value)) {
      return context.l10n.nameMustBeMoreThan3Characters;
    }
    return null;
  }

  //Password validator
  static String? passwordValidator(value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return context.l10n.pleaseEnterYourPassword;
    }
    final passwordRegex = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$',
    );
    if (!passwordRegex.hasMatch(value)) {
      return context.l10n.passwordMustContainUpperLowerAndSpecialCharacter;
    }
    return null;
  }

  //Confirm password validator
  static String? confirmPasswordValidator(
    value,
    TextEditingController passwordController,
    BuildContext context,
  ) {
    if (value == null || value.isEmpty) {
      return context.l10n.pleaseEnterYourPassword;
    }
    if (value != passwordController.text) {
      return context.l10n.passwordsDoNotMatch;
    }
    return null;
  }

  //Email validation
  static String? emailValidator(value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return context.l10n.passwordMustContainUpperLowerAndSpecialCharacter;
    }
    final customEmailRegex = RegExp(r'^[\w.-]+@[\w-]+\.[a-zA-Z]{2,}$');
    if (!customEmailRegex.hasMatch(value)) {
      return context.l10n.emailMustBeLikeThisExampleGmailCom;
    }
    return null;
  }

  //Phone validation
  static String? phoneNumberValidator(value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return context.l10n.pleaseEnterYourPhoneNumber;
    }
    final egyptPhoneRegex = RegExp(r'^01[0125][0-9]{8}$');
    if (!egyptPhoneRegex.hasMatch(value)) {
      return context.l10n.enterAValidEgyptianPhoneNumber;
    }

    return null;
  }
}
