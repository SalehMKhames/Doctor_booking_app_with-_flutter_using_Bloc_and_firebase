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

import '../../common/user/data/data_sources/user_LocalDataSource.dart' as _i12;
import '../../common/user/data/data_sources/user_RemoteDataSource.dart' as _i4;
import '../../common/user/data/User_Repo_impl/user_repo_impl.dart' as _i10;
import '../../common/user/domain/entity/user.dart' as _i11;
import '../../common/user/domain/repository/user_repo.dart' as _i9;
import '../../common/user/domain/usecases/GetUserData.dart' as _i13;
import '../../common/user/domain/usecases/UploadUserdata.dart' as _i14;
import '../../Features/authentication/data/Data%20sources/auth_LocalDataSource.dart'
    as _i8;
import '../../Features/authentication/data/Data%20sources/auth_RemoteDataSource.dart'
    as _i5;
import '../../Features/authentication/data/repo%20implement/user_credentials_Repo_impl.dart'
    as _i7;
import '../../Features/authentication/domain/entities/userCredentials.dart'
    as _i20;
import '../../Features/authentication/domain/repositiories/user_credentials_repo.dart'
    as _i6;
import '../../Features/authentication/domain/usecases/resetPassword_usecase.dart'
    as _i15;
import '../../Features/authentication/domain/usecases/userDelete_usecase.dart'
    as _i16;
import '../../Features/authentication/domain/usecases/userLogin_usecase.dart'
    as _i17;
import '../../Features/authentication/domain/usecases/userRegister_usecase.dart'
    as _i18;
import '../../Features/authentication/presentation/auth_Bloc/auth_bloc.dart'
    as _i19;
import 'dependency_injection.dart' as _i21;

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
  gh.factory<_i4.UserRemotedatasource>(
      () => _i4.UserRemotedatasource(client: gh<_i3.Client>()));
  gh.factory<_i5.AuthRemoteSource>(
      () => _i5.AuthRemoteSource(client: gh<_i3.Client>()));
  gh.lazySingleton<_i6.UserCredentialsRepo>(() => _i7.UserCredentialsImpl(
        remoteSource: gh<_i5.AuthRemoteSource>(),
        localSource: gh<_i8.AuthLocalSource>(),
      ));
  gh.factory<_i9.UserRepo>(() => _i10.UserRepoImpl(
        user: gh<_i11.User>(),
        userRemotedatasource: gh<_i4.UserRemotedatasource>(),
        userLocalSource: gh<_i12.UserLocalSource>(),
      ));
  gh.lazySingleton<_i13.Getuserdata>(
      () => _i13.Getuserdata(userRepo: gh<_i9.UserRepo>()));
  gh.lazySingleton<_i14.Uploaduserdata>(
      () => _i14.Uploaduserdata(userRepo: gh<_i9.UserRepo>()));
  gh.lazySingleton<_i15.ResetPasswordUsecase>(
      () => _i15.ResetPasswordUsecase(userRepo: gh<_i6.UserCredentialsRepo>()));
  gh.lazySingleton<_i16.DeleteUsecase>(
      () => _i16.DeleteUsecase(userRepo: gh<_i6.UserCredentialsRepo>()));
  gh.lazySingleton<_i17.LoginUsecase>(
      () => _i17.LoginUsecase(userRepo: gh<_i6.UserCredentialsRepo>()));
  gh.lazySingleton<_i18.RegisterUsecase>(
      () => _i18.RegisterUsecase(userRepo: gh<_i6.UserCredentialsRepo>()));
  gh.factory<_i19.AuthBloc>(() => _i19.AuthBloc(
        gh<_i11.User>(),
        gh<_i20.UserCredentials>(),
        gh<_i18.RegisterUsecase>(),
        gh<_i17.LoginUsecase>(),
        gh<_i15.ResetPasswordUsecase>(),
        gh<_i16.DeleteUsecase>(),
      ));
  return getIt;
}

class _$InjectableModule extends _i21.InjectableModule {}
