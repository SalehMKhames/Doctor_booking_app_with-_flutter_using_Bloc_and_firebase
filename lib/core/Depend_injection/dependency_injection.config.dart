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

import '../../common/Doctor/data/Data_Sources/Doctor_LocalDataSource.dart'
    as _i7;
import '../../common/Doctor/data/Data_Sources/Doctor_RemoteDataSource.dart'
    as _i9;
import '../../common/Doctor/data/Doctor_Repo_impl/Doctor_Repo_Impl.dart'
    as _i12;
import '../../common/Doctor/domain/Repository/Doctor_Repo.dart' as _i11;
import '../../common/Doctor/domain/Usecases/getAllDoctors_usecase.dart' as _i13;
import '../../common/Doctor/domain/Usecases/getDoctor_usecase.dart' as _i15;
import '../../common/Doctor/domain/Usecases/getDoctorByName_usecase.dart'
    as _i14;
import '../../common/user/data/data_sources/user_LocalDataSource.dart' as _i6;
import '../../common/user/data/data_sources/user_RemoteDataSource.dart' as _i10;
import '../../common/user/data/User_Repo_impl/user_repo_impl.dart' as _i24;
import '../../common/user/domain/repository/user_repo.dart' as _i23;
import '../../common/user/domain/usecases/DeleteUserData_Usecase.dart' as _i27;
import '../../common/user/domain/usecases/EditUserData.dart' as _i25;
import '../../common/user/domain/usecases/GetUserData.dart' as _i26;
import '../../Features/authentication/data/Data%20sources/auth_RemoteDataSource.dart'
    as _i8;
import '../../Features/authentication/data/repo%20implement/user_credentials_Repo_impl.dart'
    as _i17;
import '../../Features/authentication/domain/repositiories/user_credentials_repo.dart'
    as _i16;
import '../../Features/authentication/domain/usecases/resetPassword_usecase.dart'
    as _i18;
import '../../Features/authentication/domain/usecases/UploadUserdata.dart'
    as _i22;
import '../../Features/authentication/domain/usecases/userDelete_usecase.dart'
    as _i19;
import '../../Features/authentication/domain/usecases/userLogin_usecase.dart'
    as _i20;
import '../../Features/authentication/domain/usecases/userRegister_usecase.dart'
    as _i21;
import '../../Features/authentication/presentation/auth_Bloc/auth_bloc.dart'
    as _i28;
import 'dependency_injection.dart' as _i29;

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
    gh.lazySingletonAsync<_i7.DoctorLocaldatasource>(() async =>
        _i7.DoctorLocaldatasource(
            sharedPreferences: await getAsync<_i4.SharedPreferences>()));
    gh.factory<_i8.AuthRemoteSource>(
        () => _i8.AuthRemoteSource(client: gh<_i3.Client>()));
    gh.factory<_i9.DoctorRemotedatasource>(
        () => _i9.DoctorRemotedatasource(client: gh<_i3.Client>()));
    gh.lazySingleton<_i10.UserRemotedatasource>(
        () => _i10.UserRemotedatasource(client: gh<_i3.Client>()));
    gh.factoryAsync<_i11.DoctorRepo>(() async => _i12.DoctorRepoImpl(
          remotedatasource: gh<_i9.DoctorRemotedatasource>(),
          localdatasource: await getAsync<_i7.DoctorLocaldatasource>(),
        ));
    gh.lazySingletonAsync<_i13.GetalldoctorsUsecase>(() async =>
        _i13.GetalldoctorsUsecase(
            doctorRepo: await getAsync<_i11.DoctorRepo>()));
    gh.lazySingletonAsync<_i14.GetdoctorbynameUsecase>(() async =>
        _i14.GetdoctorbynameUsecase(
            doctorRepo: await getAsync<_i11.DoctorRepo>()));
    gh.lazySingletonAsync<_i15.Getdoctorusecase>(() async =>
        _i15.Getdoctorusecase(doctorRepo: await getAsync<_i11.DoctorRepo>()));
    gh.lazySingleton<_i16.UserCredentialsRepo>(() =>
        _i17.UserCredentialsImpl(remoteSource: gh<_i8.AuthRemoteSource>()));
    gh.lazySingleton<_i18.ResetPasswordUsecase>(() =>
        _i18.ResetPasswordUsecase(userRepo: gh<_i16.UserCredentialsRepo>()));
    gh.lazySingleton<_i19.DeleteUsecase>(
        () => _i19.DeleteUsecase(userRepo: gh<_i16.UserCredentialsRepo>()));
    gh.lazySingleton<_i20.LoginUsecase>(
        () => _i20.LoginUsecase(userRepo: gh<_i16.UserCredentialsRepo>()));
    gh.lazySingleton<_i21.RegisterUsecase>(
        () => _i21.RegisterUsecase(userRepo: gh<_i16.UserCredentialsRepo>()));
    gh.lazySingleton<_i22.Uploaduserdata>(() =>
        _i22.Uploaduserdata(userCredRepo: gh<_i16.UserCredentialsRepo>()));
    gh.factoryAsync<_i23.UserRepo>(() async => _i24.UserRepoImpl(
          userRemotedatasource: gh<_i10.UserRemotedatasource>(),
          userLocalSource: await getAsync<_i6.UserLocalSource>(),
        ));
    gh.lazySingletonAsync<_i25.EdituserdataUsecase>(() async =>
        _i25.EdituserdataUsecase(userRepo: await getAsync<_i23.UserRepo>()));
    gh.lazySingletonAsync<_i26.GetuserdataUsecase>(() async =>
        _i26.GetuserdataUsecase(userRepo: await getAsync<_i23.UserRepo>()));
    gh.lazySingletonAsync<_i27.DeleteuserdataUsecase>(() async =>
        _i27.DeleteuserdataUsecase(userRepo: await getAsync<_i23.UserRepo>()));
    gh.factory<_i28.AuthBloc>(() => _i28.AuthBloc(
          gh<_i21.RegisterUsecase>(),
          gh<_i20.LoginUsecase>(),
          gh<_i18.ResetPasswordUsecase>(),
          gh<_i19.DeleteUsecase>(),
          gh<_i22.Uploaduserdata>(),
        ));
    return this;
  }
}

class _$HTTPModule extends _i29.HTTPModule {}

class _$SharedPrefsModule extends _i29.SharedPrefsModule {}

class _$UuidModule extends _i29.UuidModule {}
