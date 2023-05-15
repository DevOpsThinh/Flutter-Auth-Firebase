import 'package:flutter/material.dart';

import 'package:auth_app/localization/localization_delegate.dart';

extension LocalizationExt on BuildContext {
  String localize(String value) {
    final code = AppLocalization.of(this)?.locale.languageCode;
    final database = AppLocalization._localizedValues;

    if (database.containsKey(code)) {
      return database[code]![value] ?? "-";
    } else {
      return database["en"]![value] ?? "-";
    }
  }
}

/// This class is responsible of returning the internationalized strings according
/// with the locale that has been passed in the constructor.
///
/// The entire app should **never** use hard-coded strings; instead, it
/// should take the values from this class. For instance, this is bad:
///
///     Text("Something")
///
/// But this is good:
///
///     Text(AppLocalization.of(context).something)
///
/// The list of supported locales can be set in [AppLocalizationDelegate].
class AppLocalization {
  final Locale locale;
  const AppLocalization(this.locale);

  static AppLocalization? of(BuildContext context) =>
      Localizations.of<AppLocalization>(context, AppLocalization);

  static final Map<String, Map<String, String>> _localizedValues = {
    "en": {
      "title": "Chatting app",
      "login": "Login",
      "register": "Register",
      "welcome": "Welcome!",
      "invalid_field": "Invalid value",
      "error_login": "Error while logging in",
      "error_register": "Error while registering",
      "email_account": "Email Account",
      "password": "Password",
      "error_firebase": "Couldn't load Firebase",
    },

    "vn": {
      "title": "Chatting app",
      "login": "Đăng nhập",
      "register": "Đăng ký",
      "welcome": "Chào mừng!",
      "invalid_field": "Trường dữ liệu không hợp lệ",
      "error_login": "Xuất hiện lỗi khi đăng nhập",
      "error_register": "Xuất hiện lỗi khi đăng ký",
      "email_account": "Tài khoản Email",
      "password": "Mật khẩu",
      "error_firebase": "Không thể sừ dụng dịch vụ của Firebase",
    },
  };
}