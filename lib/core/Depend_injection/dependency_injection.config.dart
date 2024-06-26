// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

import '../../common/user/data/data_sources/user_LocalDataSource.dart' as _i16;
import '../../common/user/data/data_sources/user_RemoteDataSource.dart' as _i7;
import '../../common/user/data/User_Repo_impl/user_repo_impl.dart' as _i15;
import '../../common/user/domain/entity/user.dart' as _i5;
import '../../common/user/domain/repository/user_repo.dart' as _i14;
import '../../common/user/domain/usecases/GetUserData.dart' as _i17;
import '../../common/user/domain/usecases/UploadUserdata.dart' as _i18;
import '../../Features/authentication/data/Data%20sources/auth_RemoteDataSource.dart'
    as _i6;
import '../../Features/authentication/data/repo%20implement/user_credentials_Repo_impl.dart'
    as _i9;
import '../../Features/authentication/domain/entities/userCredentials.dart'
    as _i4;
import '../../Features/authentication/domain/repositiories/user_credentials_repo.dart'
    as _i8;
import '../../Features/authentication/domain/usecases/resetPassword_usecase.dart'
    as _i10;
import '../../Features/authentication/domain/usecases/userDelete_usecase.dart'
    as _i11;
import '../../Features/authentication/domain/usecases/userLogin_usecase.dart'
    as _i12;
import '../../Features/authentication/domain/usecases/userRegister_usecase.dart'
    as _i13;
import '../../Features/authentication/presentation/auth_Bloc/auth_bloc.dart'
    as _i19;
import 'dependency_injection.dart' as _i20;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initialGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final injectableModule = _$InjectableModule();
  gh.singleton<_i3.Client>(() => injectableModule.client);
  gh.factory<_i4.UserCredentials>(() => _i4.UserCredentials(
        email: gh<String>(),
        password: gh<String>(),
      ));
  gh.factory<_i5.User>(() => _i5.User(
        id: gh<String>(),
        firstName: gh<String>(),
        lastName: gh<String>(),
        birthDate: gh<DateTime>(),
        phone: gh<String>(),
        medicalStatus: gh<String>(),
      ));
  gh.factory<_i6.AuthRemoteSource>(
      () => _i6.AuthRemoteSource(client: gh<_i3.Client>()));
  gh.lazySingleton<_i7.UserRemotedatasource>(
      () => _i7.UserRemotedatasource(client: gh<_i3.Client>()));
  gh.lazySingleton<_i8.UserCredentialsRepo>(
      () => _i9.UserCredentialsImpl(remoteSource: gh<_i6.AuthRemoteSource>()));
  gh.lazySingleton<_i10.ResetPasswordUsecase>(
      () => _i10.ResetPasswordUsecase(userRepo: gh<_i8.UserCredentialsRepo>()));
  gh.lazySingleton<_i11.DeleteUsecase>(
      () => _i11.DeleteUsecase(userRepo: gh<_i8.UserCredentialsRepo>()));
  gh.lazySingleton<_i12.LoginUsecase>(
      () => _i12.LoginUsecase(userRepo: gh<_i8.UserCredentialsRepo>()));
  gh.lazySingleton<_i13.RegisterUsecase>(
      () => _i13.RegisterUsecase(userRepo: gh<_i8.UserCredentialsRepo>()));
  gh.factory<_i14.UserRepo>(() => _i15.UserRepoImpl(
        user: gh<_i5.User>(),
        userRemotedatasource: gh<_i7.UserRemotedatasource>(),
        userLocalSource: gh<_i16.UserLocalSource>(),
      ));
  gh.lazySingleton<_i17.Getuserdata>(
      () => _i17.Getuserdata(userRepo: gh<_i14.UserRepo>()));
  gh.lazySingleton<_i18.Uploaduserdata>(
      () => _i18.Uploaduserdata(userRepo: gh<_i14.UserRepo>()));
  gh.factory<_i19.AuthBloc>(() => _i19.AuthBloc(
        gh<_i5.User>(),
        gh<_i4.UserCredentials>(),
        gh<_i13.RegisterUsecase>(),
        gh<_i12.LoginUsecase>(),
        gh<_i10.ResetPasswordUsecase>(),
        gh<_i11.DeleteUsecase>(),
      ));
  return getIt;
}

class _$InjectableModule extends _i20.InjectableModule {}
