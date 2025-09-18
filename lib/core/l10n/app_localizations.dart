import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(
        locale.toString(),
      );

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(
      context,
      AppLocalizations,
    );
  }

  static const LocalizationsDelegate<AppLocalizations>
  delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>>
  localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Flower App'**
  String get appName;

  /// No description provided for @appVersion.
  ///
  /// In en, this message translates to:
  /// **'1.0.0'**
  String get appVersion;

  /// No description provided for @termsAndConditions.
  ///
  /// In en, this message translates to:
  /// **'Terms and Conditions'**
  String get termsAndConditions;

  /// No description provided for @logOut.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get logOut;

  /// No description provided for @myOrders.
  ///
  /// In en, this message translates to:
  /// **'My Orders'**
  String get myOrders;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @change.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get change;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// No description provided for @currentPassword.
  ///
  /// In en, this message translates to:
  /// **'Current Password'**
  String get currentPassword;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// No description provided for @savedAddresses.
  ///
  /// In en, this message translates to:
  /// **'Saved Addresses'**
  String get savedAddresses;

  /// No description provided for @notification.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notification;

  /// No description provided for @aboutUs.
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get aboutUs;

  /// No description provided for @searchForYourFavoriteProducts.
  ///
  /// In en, this message translates to:
  /// **'Search for your favorite products'**
  String get searchForYourFavoriteProducts;

  /// No description provided for @searchInProduct.
  ///
  /// In en, this message translates to:
  /// **'Search in product'**
  String get searchInProduct;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Type in the search bar above to start searching for products'**
  String get searchHint;

  /// No description provided for @searching.
  ///
  /// In en, this message translates to:
  /// **'Searching...'**
  String get searching;

  /// No description provided for @resultFor.
  ///
  /// In en, this message translates to:
  /// **'Result For'**
  String get resultFor;

  /// No description provided for @noResultFound.
  ///
  /// In en, this message translates to:
  /// **'No Result Found For'**
  String get noResultFound;

  /// No description provided for @wasFound.
  ///
  /// In en, this message translates to:
  /// **'Was Found'**
  String get wasFound;

  /// No description provided for @trySearchWithDeffrentKeys.
  ///
  /// In en, this message translates to:
  /// **'try search with deferent word'**
  String get trySearchWithDeffrentKeys;

  /// No description provided for @search_error.
  ///
  /// In en, this message translates to:
  /// **'Search Error'**
  String get search_error;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// No description provided for @firstNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter first name'**
  String get firstNameHint;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// No description provided for @lastNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter last name'**
  String get lastNameHint;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @emailHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get emailHint;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @passwordHint.
  ///
  /// In en, this message translates to:
  /// **'Enter password'**
  String get passwordHint;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @confirmPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirmPasswordHint;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @phoneNumberHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get phoneNumberHint;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @haveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get haveAccount;

  /// No description provided for @notHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'don\'t have an account?'**
  String get notHaveAccount;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @pleaseEnterValue.
  ///
  /// In en, this message translates to:
  /// **'Please enter value'**
  String get pleaseEnterValue;

  /// No description provided for @pleaseEnterName.
  ///
  /// In en, this message translates to:
  /// **'Please enter name'**
  String get pleaseEnterName;

  /// No description provided for @nameMustBeMoreThan3Characters.
  ///
  /// In en, this message translates to:
  /// **'Name must be more than 3 characters'**
  String get nameMustBeMoreThan3Characters;

  /// No description provided for @passwordMustContainUpperLowerAndSpecialCharacter.
  ///
  /// In en, this message translates to:
  /// **'Password must contain upper, lower, and special character'**
  String
  get passwordMustContainUpperLowerAndSpecialCharacter;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

  /// No description provided for @pleaseEnterYourPassword.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get pleaseEnterYourPassword;

  /// No description provided for @pleaseEnterYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get pleaseEnterYourEmail;

  /// No description provided for @emailMustBeLikeThisExampleGmailCom.
  ///
  /// In en, this message translates to:
  /// **'Email must be like this \"example@gmail.com'**
  String get emailMustBeLikeThisExampleGmailCom;

  /// No description provided for @pleaseEnterYourPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter your phone number'**
  String get pleaseEnterYourPhoneNumber;

  /// No description provided for @enterAValidEgyptianPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid Egyptian phone number (e.g., 01xxxxxxxxx)'**
  String get enterAValidEgyptianPhoneNumber;

  /// No description provided for @forget_password.
  ///
  /// In en, this message translates to:
  /// **'Forget password'**
  String get forget_password;

  /// No description provided for @enter_your_email_associated.
  ///
  /// In en, this message translates to:
  /// **'please enter your email associated to\n your account'**
  String get enter_your_email_associated;

  /// No description provided for @continue_btn.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continue_btn;

  /// No description provided for @email_verification.
  ///
  /// In en, this message translates to:
  /// **'Email Verification'**
  String get email_verification;

  /// No description provided for @enter_code_sent_to_email.
  ///
  /// In en, this message translates to:
  /// **'Please enter your code that send to your email address '**
  String get enter_code_sent_to_email;

  /// No description provided for @didnt_receive_code.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive the code?'**
  String get didnt_receive_code;

  /// No description provided for @resend.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get resend;

  /// No description provided for @invalid_code.
  ///
  /// In en, this message translates to:
  /// **'❗Invalid code'**
  String get invalid_code;

  /// No description provided for @reset_password.
  ///
  /// In en, this message translates to:
  /// **'Reset_password'**
  String get reset_password;

  /// No description provided for @reset_password_body.
  ///
  /// In en, this message translates to:
  /// **'Password must not be empty and must contain\n 6 characters with upper case letter and one\n number at least'**
  String get reset_password_body;

  /// No description provided for @new_password.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get new_password;

  /// No description provided for @enter_your_password.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get enter_your_password;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get ok;

  /// No description provided for @network_error.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get network_error;

  /// No description provided for @server_error.
  ///
  /// In en, this message translates to:
  /// **'Server error'**
  String get server_error;

  /// No description provided for @reset_pass_success.
  ///
  /// In en, this message translates to:
  /// **'Password reset successfully'**
  String get reset_pass_success;

  /// No description provided for @otp_resend_to_mail.
  ///
  /// In en, this message translates to:
  /// **'OTP resent to your email successfully\n Please check your email'**
  String get otp_resend_to_mail;

  /// No description provided for @explore.
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get explore;

  /// No description provided for @result.
  ///
  /// In en, this message translates to:
  /// **'Result'**
  String get result;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @survey.
  ///
  /// In en, this message translates to:
  /// **'Survey'**
  String get survey;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @browse_by_subject.
  ///
  /// In en, this message translates to:
  /// **'Browse by subject'**
  String get browse_by_subject;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @cart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cart;

  /// No description provided for @occasion.
  ///
  /// In en, this message translates to:
  /// **'Occasion'**
  String get occasion;

  /// No description provided for @descriptionAppBarBestSeller.
  ///
  /// In en, this message translates to:
  /// **'Bloom with our exquisite best sellers'**
  String get descriptionAppBarBestSeller;

  /// No description provided for @noProductsFound.
  ///
  /// In en, this message translates to:
  /// **'No Products Found'**
  String get noProductsFound;

  /// No description provided for @addToCart.
  ///
  /// In en, this message translates to:
  /// **'Add To Cart'**
  String get addToCart;

  /// No description provided for @egp.
  ///
  /// In en, this message translates to:
  /// **'EGP'**
  String get egp;

  /// No description provided for @all_prices_include_tax.
  ///
  /// In en, this message translates to:
  /// **'All prices include tax'**
  String get all_prices_include_tax;

  /// No description provided for @product_title.
  ///
  /// In en, this message translates to:
  /// **'product title'**
  String get product_title;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @in_stock.
  ///
  /// In en, this message translates to:
  /// **'in stock'**
  String get in_stock;

  /// No description provided for @product_price.
  ///
  /// In en, this message translates to:
  /// **'product price'**
  String get product_price;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @description_body.
  ///
  /// In en, this message translates to:
  /// **'Lorem ipsum dolor sit amet consectetur. Id sit morbi ornare morbi duis rhoncus orci massa.'**
  String get description_body;

  /// No description provided for @bouquet_include.
  ///
  /// In en, this message translates to:
  /// **'Bouquet include'**
  String get bouquet_include;

  /// No description provided for @add_to_cart.
  ///
  /// In en, this message translates to:
  /// **'Add to cart'**
  String get add_to_cart;

  /// No description provided for @pink_roses.
  ///
  /// In en, this message translates to:
  /// **'Pink roses:15'**
  String get pink_roses;

  /// No description provided for @white_wrap.
  ///
  /// In en, this message translates to:
  /// **'White wrap'**
  String get white_wrap;

  /// No description provided for @flowery.
  ///
  /// In en, this message translates to:
  /// **'Flowery'**
  String get flowery;

  /// No description provided for @view_all.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get view_all;

  /// No description provided for @best_seller.
  ///
  /// In en, this message translates to:
  /// **'Best Seller'**
  String get best_seller;

  /// No description provided for @profile_updated_successfully.
  ///
  /// In en, this message translates to:
  /// **'Profile updated successfully'**
  String get profile_updated_successfully;

  /// No description provided for @photo_updated_successfully.
  ///
  /// In en, this message translates to:
  /// **'Photo updated successfully'**
  String get photo_updated_successfully;

  /// No description provided for @rememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get rememberMe;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAccount;

  /// No description provided for @login_as_guest.
  ///
  /// In en, this message translates to:
  /// **'Login as Guest'**
  String get login_as_guest;

  /// No description provided for @areYouSureYouWantToLogOut.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get areYouSureYouWantToLogOut;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @confirmLogout.
  ///
  /// In en, this message translates to:
  /// **'Confirm Logout'**
  String get confirmLogout;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @enter_your_address.
  ///
  /// In en, this message translates to:
  /// **'Enter The address'**
  String get enter_your_address;

  /// No description provided for @enter_the_phone_number.
  ///
  /// In en, this message translates to:
  /// **'Enter the phone number'**
  String get enter_the_phone_number;

  /// No description provided for @enter_the_recipient_name.
  ///
  /// In en, this message translates to:
  /// **'Enter the recipient name'**
  String get enter_the_recipient_name;

  /// No description provided for @receipient_name.
  ///
  /// In en, this message translates to:
  /// **'Recipient Name'**
  String get receipient_name;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @area.
  ///
  /// In en, this message translates to:
  /// **'Area'**
  String get area;

  /// No description provided for @save_address.
  ///
  /// In en, this message translates to:
  /// **'Save Address'**
  String get save_address;

  /// No description provided for @add_new_address.
  ///
  /// In en, this message translates to:
  /// **'Add New Address'**
  String get add_new_address;

  /// No description provided for @please_choose.
  ///
  /// In en, this message translates to:
  /// **'choose'**
  String get please_choose;

  /// No description provided for @address_added_successfully.
  ///
  /// In en, this message translates to:
  /// **'Address added successfully'**
  String get address_added_successfully;

  String get active;

  String get completed;

  /// No description provided for @deliver_to.
  ///
  /// In en, this message translates to:
  /// **'Deliver to'**
  String get deliver_to;

  /// No description provided for @items.
  ///
  /// In en, this message translates to:
  /// **'items'**
  String get items;

  /// No description provided for @sub_total.
  ///
  /// In en, this message translates to:
  /// **'Sub Total'**
  String get sub_total;

  /// No description provided for @delivery_fee.
  ///
  /// In en, this message translates to:
  /// **'Delivery Fee'**
  String get delivery_fee;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @checkout.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkout;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(
      lookupAppLocalizations(locale),
    );
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) =>
      false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
