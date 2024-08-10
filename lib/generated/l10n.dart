// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome,`
  String get title {
    return Intl.message(
      'Welcome,',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Just in 3 steps, book your appointment with a doctor :\n• Search for his name\n• Choose the time\n• GO`
  String get description {
    return Intl.message(
      'Just in 3 steps, book your appointment with a doctor :\n• Search for his name\n• Choose the time\n• GO',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get btnStart {
    return Intl.message(
      'Start',
      name: 'btnStart',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get Sign_in {
    return Intl.message(
      'Sign in',
      name: 'Sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get Create_Account {
    return Intl.message(
      'Create Account',
      name: 'Create_Account',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get Email {
    return Intl.message(
      'Email',
      name: 'Email',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get Please_enter_your_email {
    return Intl.message(
      'Please enter your email',
      name: 'Please_enter_your_email',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get Please_enter_Avalid_email {
    return Intl.message(
      'Please enter a valid email',
      name: 'Please_enter_Avalid_email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message(
      'Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  /// `Enter Password`
  String get Enter_Password {
    return Intl.message(
      'Enter Password',
      name: 'Enter_Password',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your Password`
  String get Please_enter_your_Password {
    return Intl.message(
      'Please enter your Password',
      name: 'Please_enter_your_Password',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters`
  String get Password_must_be_at_least_8_characters {
    return Intl.message(
      'Password must be at least 8 characters',
      name: 'Password_must_be_at_least_8_characters',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get Confirm_Password {
    return Intl.message(
      'Confirm Password',
      name: 'Confirm_Password',
      desc: '',
      args: [],
    );
  }

  /// `Re-enter Password`
  String get Re_enter_Password {
    return Intl.message(
      'Re-enter Password',
      name: 'Re_enter_Password',
      desc: '',
      args: [],
    );
  }

  /// `Please reenter your Password`
  String get Please_reenter_your_Password {
    return Intl.message(
      'Please reenter your Password',
      name: 'Please_reenter_your_Password',
      desc: '',
      args: [],
    );
  }

  /// `Your password not correct, please retype it`
  String get Your_password_not_correct_please_retype_it {
    return Intl.message(
      'Your password not correct, please retype it',
      name: 'Your_password_not_correct_please_retype_it',
      desc: '',
      args: [],
    );
  }

  /// `First time to use?`
  String get First_time_to_use {
    return Intl.message(
      'First time to use?',
      name: 'First_time_to_use',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get Already_have_an_account {
    return Intl.message(
      'Already have an account?',
      name: 'Already_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get Login {
    return Intl.message(
      'Log in',
      name: 'Login',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get SignUp {
    return Intl.message(
      'Sign Up',
      name: 'SignUp',
      desc: '',
      args: [],
    );
  }

  /// `Appointment`
  String get Appointment {
    return Intl.message(
      'Appointment',
      name: 'Appointment',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get Home {
    return Intl.message(
      'Home',
      name: 'Home',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get Profile {
    return Intl.message(
      'Profile',
      name: 'Profile',
      desc: '',
      args: [],
    );
  }

  /// `Search for doctors...`
  String get Search_for_doctors {
    return Intl.message(
      'Search for doctors...',
      name: 'Search_for_doctors',
      desc: '',
      args: [],
    );
  }

  /// `Specializations`
  String get Specializations {
    return Intl.message(
      'Specializations',
      name: 'Specializations',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get See_all {
    return Intl.message(
      'See All',
      name: 'See_all',
      desc: '',
      args: [],
    );
  }

  /// `My Schedule`
  String get My_Schedule {
    return Intl.message(
      'My Schedule',
      name: 'My_Schedule',
      desc: '',
      args: [],
    );
  }

  /// `Appointment Schedule`
  String get Appointment_Schedule {
    return Intl.message(
      'Appointment Schedule',
      name: 'Appointment_Schedule',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get Cancel {
    return Intl.message(
      'Cancel',
      name: 'Cancel',
      desc: '',
      args: [],
    );
  }

  /// `Reschedule`
  String get Reschedule {
    return Intl.message(
      'Reschedule',
      name: 'Reschedule',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out`
  String get Sign_Out {
    return Intl.message(
      'Sign Out',
      name: 'Sign_Out',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
