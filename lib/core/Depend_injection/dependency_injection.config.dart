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
import 'package:shared_preferences/shared_preferences.dart' as _i4;
import 'package:uuid/v4.dart' as _i5;

import '../../common/user/data/data_sources/user_LocalDataSource.dart' as _i6;
import '../../common/user/data/data_sources/user_RemoteDataSource.dart' as _i8;
import '../../common/user/data/User_Repo_impl/user_repo_impl.dart' as _i17;
import '../../common/user/domain/repository/user_repo.dart' as _i16;
import '../../common/user/domain/usecases/EditUserData.dart' as _i18;
import '../../common/user/domain/usecases/GetUserData.dart' as _i19;
import '../../Features/authentication/data/Data%20sources/auth_RemoteDataSource.dart'
    as _i7;
import '../../Features/authentication/data/repo%20implement/user_credentials_Repo_impl.dart'
    as _i10;
import '../../Features/authentication/domain/repositiories/user_credentials_repo.dart'
    as _i9;
import '../../Features/authentication/domain/usecases/resetPassword_usecase.dart'
    as _i11;
import '../../Features/authentication/domain/usecases/UploadUserdata.dart'
    as _i15;
import '../../Features/authentication/domain/usecases/userDelete_usecase.dart'
    as _i12;
import '../../Features/authentication/domain/usecases/userLogin_usecase.dart'
    as _i13;
import '../../Features/authentication/domain/usecases/userRegister_usecase.dart'
    as _i14;
import '../../Features/authentication/presentation/auth_Bloc/auth_bloc.dart'
    as _i20;
import 'dependency_injection.dart' as _i21;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final hTTPModule = _$HTTPModule();
    final sharedPrefsModule = _$SharedPrefsModule();
    final uuidModule = _$UuidModule();
    gh.singleton<_i3.Client>(() => hTTPModule.client);
    gh.singletonAsync<_i4.SharedPreferences>(() => sharedPrefsModule.prefs);
    gh.singleton<_i5.UuidV4>(() => uuidModule.uuid);
    gh.lazySingletonAsync<_i6.UserLocalSource>(() async => _i6.UserLocalSource(
        sharedPreferences: await getAsync<_i4.SharedPreferences>()));
    gh.factory<_i7.AuthRemoteSource>(
        () => _i7.AuthRemoteSource(client: gh<_i3.Client>()));
    gh.lazySingleton<_i8.UserRemotedatasource>(
        () => _i8.UserRemotedatasource(client: gh<_i3.Client>()));
    gh.lazySingleton<_i9.UserCredentialsRepo>(() =>
        _i10.UserCredentialsImpl(remoteSource: gh<_i7.AuthRemoteSource>()));
    gh.lazySingleton<_i11.ResetPasswordUsecase>(() =>
        _i11.ResetPasswordUsecase(userRepo: gh<_i9.UserCredentialsRepo>()));
    gh.lazySingleton<_i12.DeleteUsecase>(
        () => _i12.DeleteUsecase(userRepo: gh<_i9.UserCredentialsRepo>()));
    gh.lazySingleton<_i13.LoginUsecase>(
        () => _i13.LoginUsecase(userRepo: gh<_i9.UserCredentialsRepo>()));
    gh.lazySingleton<_i14.RegisterUsecase>(
        () => _i14.RegisterUsecase(userRepo: gh<_i9.UserCredentialsRepo>()));
    gh.lazySingleton<_i15.Uploaduserdata>(
        () => _i15.Uploaduserdata(userCredRepo: gh<_i9.UserCredentialsRepo>()));
    gh.factoryAsync<_i16.UserRepo>(() async => _i17.UserRepoImpl(
          userRemotedatasource: gh<_i8.UserRemotedatasource>(),
          userLocalSource: await getAsync<_i6.UserLocalSource>(),
        ));
    gh.lazySingletonAsync<_i18.Edituserdata>(() async =>
        _i18.Edituserdata(userRepo: await getAsync<_i16.UserRepo>()));
    gh.lazySingletonAsync<_i19.Getuserdata>(() async =>
        _i19.Getuserdata(userRepo: await getAsync<_i16.UserRepo>()));
    gh.factory<_i20.AuthBloc>(() => _i20.AuthBloc(
          gh<_i14.RegisterUsecase>(),
          gh<_i13.LoginUsecase>(),
          gh<_i11.ResetPasswordUsecase>(),
          gh<_i12.DeleteUsecase>(),
          gh<_i15.Uploaduserdata>(),
        ));
    return this;
  }
}

class _$HTTPModule extends _i21.HTTPModule {}

class _$SharedPrefsModule extends _i21.SharedPrefsModule {}

class _$UuidModule extends _i21.UuidModule {}
