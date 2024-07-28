import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/v4.dart';
import 'dependency_injection.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() => getIt.init();

@module
abstract class HTTPModule {
  @singleton
  http.Client get client => http.Client();
}

@module
abstract class SharedPrefsModule {
  @singleton
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}

@module
abstract class UuidModule {
  @singleton
  UuidV4 get uuid => const UuidV4();
}
