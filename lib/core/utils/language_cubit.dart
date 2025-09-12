import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../di/modules/shared_preferences_module.dart';
import '../keys/shared_key.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit() : super(const Locale("en")) {
    _loadSavedLang();
  }

  void _loadSavedLang() {
    final savedLang = SharedPrefHelper().getString(
      key: SharedPrefKeys.languageKey,
    );
    if (savedLang != null && savedLang.isNotEmpty) {
      emit(Locale(savedLang));
    }
  }

  void changeLang(String langCode) {
    SharedPrefHelper().setString(
      key: SharedPrefKeys.languageKey,
      stringValue: langCode,
    );
    emit(Locale(langCode));
  }
}
