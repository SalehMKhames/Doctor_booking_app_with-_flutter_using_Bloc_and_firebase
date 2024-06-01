import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dependency_injection.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initialGetIt',
  preferRelativeImports: true,
  asExtension: false,
)

Future<GetIt> configureInjection() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);


  return $initialGetIt(getIt);
}

@module
abstract class InjectableModule {
  @singleton
  http.Client get client => http.Client();
}