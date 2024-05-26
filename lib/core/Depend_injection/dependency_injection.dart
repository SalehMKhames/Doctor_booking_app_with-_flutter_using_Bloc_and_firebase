import 'package:doctory/Features/authentication/data/Data%20sources/auth_LocalDataSource.dart';
import 'package:doctory/Features/authentication/data/Data%20sources/auth_RemoteDataSource.dart';
import 'package:doctory/Features/authentication/data/repo%20implement/user_credentials_Repo_impl.dart';
import 'package:doctory/Features/authentication/domain/repositiories/user_credentials_repo.dart';
import 'package:doctory/Features/authentication/domain/usecases/resetPassword_usecase.dart';
import 'package:doctory/Features/authentication/domain/usecases/userDelete_usecase.dart';
import 'package:doctory/Features/authentication/domain/usecases/userLogin_usecase.dart';
import 'package:doctory/Features/authentication/domain/usecases/userRegister_usecase.dart';
import 'package:doctory/Features/authentication/presentation/auth_Bloc/auth_bloc.dart';
import 'package:doctory/common/user/data/User_Repo_impl/user_repo_impl.dart';
import 'package:doctory/common/user/domain/repository/user_repo.dart';

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final GetIt sl = GetIt.instance;

void init()
{
  //Features inject
  initFeatures();

  //Externals inject
  initExternals();
}

void initFeatures()
{
  //AuthBloc
  sl.registerFactory(() => AuthBloc(sl(), sl(), sl(), sl(), sl(), sl()));

  //Repository
  sl.registerLazySingleton<UserCredentialsRepo>(() =>
      UserCredentialsImpl(remoteSource: sl(), localSource: sl()));
  sl.registerLazySingleton<UserRepo>(() =>
      UserRepoImpl(
          user: sl(),
          userRemotedatasource: sl(),
          userLocalSource: sl()
      )
  );

  //Use Cases
  sl.registerLazySingleton(() => RegisterUsecase(userRepo: sl()));
  sl.registerLazySingleton(() => LoginUsecase(userRepo: sl()));
  sl.registerLazySingleton(() => ResetPasswordUsecase(userRepo: sl()));
  sl.registerLazySingleton(() => DeleteUsecase(userRepo: sl()));

  //Data Sources
  sl.registerLazySingleton(() => AuthRemoteSource(client: sl()));
  sl.registerLazySingleton(() => AuthLocalSource(sharedPreferences: sl()));
}

void initExternals() async
{
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
}