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

import '../../common/Doctor/BLOC/doctor_bloc.dart' as _i40;
import '../../common/Doctor/data/Data_Sources/Doctor_LocalDataSource.dart'
    as _i6;
import '../../common/Doctor/data/Data_Sources/Doctor_RemoteDataSource.dart'
    as _i9;
import '../../common/Doctor/data/Doctor_Repo_impl/Doctor_Repo_Impl.dart'
    as _i14;
import '../../common/Doctor/domain/Repository/Doctor_Repo.dart' as _i13;
import '../../common/Doctor/domain/Usecases/getAllDoctors_usecase.dart' as _i15;
import '../../common/Doctor/domain/Usecases/getDoctor_usecase.dart' as _i18;
import '../../common/Doctor/domain/Usecases/getDoctorByName_usecase.dart'
    as _i16;
import '../../common/Doctor/domain/Usecases/getDoctorsBySpecialization_usecase.dart'
    as _i17;
import '../../common/user/BLOC/user_bloc.dart' as _i45;
import '../../common/user/data/data_sources/user_LocalDataSource.dart' as _i7;
import '../../common/user/data/data_sources/user_RemoteDataSource.dart' as _i11;
import '../../common/user/data/User_Repo_impl/user_repo_impl.dart' as _i39;
import '../../common/user/domain/repository/user_repo.dart' as _i38;
import '../../common/user/domain/usecases/DeleteUserData_Usecase.dart' as _i42;
import '../../common/user/domain/usecases/EditUserData.dart' as _i43;
import '../../common/user/domain/usecases/GetUserData.dart' as _i44;
import '../../Features/appointment/Data/data_sources/Appointment_LocalDataSource.dart'
    as _i8;
import '../../Features/appointment/Data/data_sources/Appointment_RemoteDataSource.dart'
    as _i12;
import '../../Features/appointment/Data/repo_impl/AppointmentRepo_impl.dart'
    as _i22;
import '../../Features/appointment/Domain/repository/appointment_repo.dart'
    as _i21;
import '../../Features/appointment/Domain/usecases/AcceptingAppointment_usecase.dart'
    as _i28;
import '../../Features/appointment/Domain/usecases/CreateAppointment_usecase.dart'
    as _i29;
import '../../Features/appointment/Domain/usecases/DeleteAppointment_usecase.dart'
    as _i30;
import '../../Features/appointment/Domain/usecases/EditAppointment_usecase.dart'
    as _i31;
import '../../Features/appointment/Domain/usecases/filterAppointment_usecase.dart'
    as _i32;
import '../../Features/appointment/Domain/usecases/GetAllAppointments_usecase.dart'
    as _i33;
import '../../Features/appointment/Domain/usecases/GetAppointment_usecase.dart'
    as _i34;
import '../../Features/appointment/Presentation/bloc/appointment_bloc.dart'
    as _i37;
import '../../Features/authentication/data/Data%20sources/auth_RemoteDataSource.dart'
    as _i10;
import '../../Features/authentication/data/repo%20implement/user_credentials_Repo_impl.dart'
    as _i20;
import '../../Features/authentication/domain/repositiories/user_credentials_repo.dart'
    as _i19;
import '../../Features/authentication/domain/usecases/DoctorUploadData_usecase.dart'
    as _i35;
import '../../Features/authentication/domain/usecases/resetPassword_usecase.dart'
    as _i23;
import '../../Features/authentication/domain/usecases/UploadUserdata.dart'
    as _i36;
import '../../Features/authentication/domain/usecases/userDelete_usecase.dart'
    as _i24;
import '../../Features/authentication/domain/usecases/userLogin_usecase.dart'
    as _i25;
import '../../Features/authentication/domain/usecases/userRegister_usecase.dart'
    as _i26;
import '../../Features/authentication/domain/usecases/UserSignOut_usecase.dart'
    as _i27;
import '../../Features/authentication/presentation/auth_Bloc/auth_bloc.dart'
    as _i41;
import 'dependency_injection.dart' as _i46;

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
    gh.lazySingletonAsync<_i6.DoctorLocaldatasource>(() async =>
        _i6.DoctorLocaldatasource(
            sharedPreferences: await getAsync<_i4.SharedPreferences>()));
    gh.lazySingletonAsync<_i7.UserLocalSource>(() async => _i7.UserLocalSource(
        sharedPreferences: await getAsync<_i4.SharedPreferences>()));
    gh.lazySingletonAsync<_i8.Appointment_Localdatasource>(() async =>
        _i8.Appointment_Localdatasource(
            sharedPreferences: await getAsync<_i4.SharedPreferences>()));
    gh.factory<_i9.DoctorRemotedatasource>(
        () => _i9.DoctorRemotedatasource(client: gh<_i3.Client>()));
    gh.factory<_i10.AuthRemoteSource>(
        () => _i10.AuthRemoteSource(client: gh<_i3.Client>()));
    gh.lazySingleton<_i11.UserRemotedatasource>(
        () => _i11.UserRemotedatasource(client: gh<_i3.Client>()));
    gh.lazySingleton<_i12.Appointment_RemoteDataSource>(
        () => _i12.Appointment_RemoteDataSource(client: gh<_i3.Client>()));
    gh.factoryAsync<_i13.DoctorRepo>(() async => _i14.DoctorRepoImpl(
          remotedatasource: gh<_i9.DoctorRemotedatasource>(),
          localdatasource: await getAsync<_i6.DoctorLocaldatasource>(),
        ));
    gh.lazySingletonAsync<_i15.GetalldoctorsUsecase>(() async =>
        _i15.GetalldoctorsUsecase(
            doctorRepo: await getAsync<_i13.DoctorRepo>()));
    gh.lazySingletonAsync<_i16.GetdoctorbynameUsecase>(() async =>
        _i16.GetdoctorbynameUsecase(
            doctorRepo: await getAsync<_i13.DoctorRepo>()));
    gh.lazySingletonAsync<_i17.Getdoctorsbyspecialization>(() async =>
        _i17.Getdoctorsbyspecialization(
            doctorRepo: await getAsync<_i13.DoctorRepo>()));
    gh.lazySingletonAsync<_i18.Getdoctorusecase>(() async =>
        _i18.Getdoctorusecase(doctorRepo: await getAsync<_i13.DoctorRepo>()));
    gh.lazySingleton<_i19.UserCredentialsRepo>(() =>
        _i20.UserCredentialsImpl(remoteSource: gh<_i10.AuthRemoteSource>()));
    gh.lazySingletonAsync<_i21.AppointmentRepo>(() async =>
        _i22.AppointmentRepoImpl(
          remoteDataSource: gh<_i12.Appointment_RemoteDataSource>(),
          localDataSource: await getAsync<_i8.Appointment_Localdatasource>(),
        ));
    gh.lazySingleton<_i23.ResetPasswordUsecase>(() =>
        _i23.ResetPasswordUsecase(userRepo: gh<_i19.UserCredentialsRepo>()));
    gh.lazySingleton<_i24.DeleteUsecase>(
        () => _i24.DeleteUsecase(userRepo: gh<_i19.UserCredentialsRepo>()));
    gh.lazySingleton<_i25.LoginUsecase>(
        () => _i25.LoginUsecase(userRepo: gh<_i19.UserCredentialsRepo>()));
    gh.lazySingleton<_i26.RegisterUsecase>(
        () => _i26.RegisterUsecase(userRepo: gh<_i19.UserCredentialsRepo>()));
    gh.lazySingleton<_i27.UsersignoutUsecase>(() =>
        _i27.UsersignoutUsecase(userRepo: gh<_i19.UserCredentialsRepo>()));
    gh.lazySingletonAsync<_i28.AcceptingappointmentUsecase>(() async =>
        _i28.AcceptingappointmentUsecase(
            appointmentRepo: await getAsync<_i21.AppointmentRepo>()));
    gh.lazySingletonAsync<_i29.CreateappointmentUsecase>(() async =>
        _i29.CreateappointmentUsecase(
            appointmentRepo: await getAsync<_i21.AppointmentRepo>()));
    gh.lazySingletonAsync<_i30.DeleteappointmentUsecase>(() async =>
        _i30.DeleteappointmentUsecase(
            appointmentRepo: await getAsync<_i21.AppointmentRepo>()));
    gh.lazySingletonAsync<_i31.EditappointmentUsecase>(() async =>
        _i31.EditappointmentUsecase(
            appointmentRepo: await getAsync<_i21.AppointmentRepo>()));
    gh.lazySingletonAsync<_i32.FilterappointmentUsecase>(() async =>
        _i32.FilterappointmentUsecase(
            appointmentRepo: await getAsync<_i21.AppointmentRepo>()));
    gh.lazySingletonAsync<_i33.GetAllappointmentsUsecase>(() async =>
        _i33.GetAllappointmentsUsecase(
            appointmentRepo: await getAsync<_i21.AppointmentRepo>()));
    gh.lazySingletonAsync<_i34.GetappointmentUsecase>(() async =>
        _i34.GetappointmentUsecase(
            appointmentRepo: await getAsync<_i21.AppointmentRepo>()));
    gh.lazySingleton<_i35.DoctoruploaddataUsecase>(() =>
        _i35.DoctoruploaddataUsecase(
            userCredRepo: gh<_i19.UserCredentialsRepo>()));
    gh.lazySingleton<_i36.Uploaduserdata>(() =>
        _i36.Uploaduserdata(userCredRepo: gh<_i19.UserCredentialsRepo>()));
    gh.factoryAsync<_i37.AppointmentBloc>(() async => _i37.AppointmentBloc(
          await getAsync<_i29.CreateappointmentUsecase>(),
          await getAsync<_i31.EditappointmentUsecase>(),
          await getAsync<_i30.DeleteappointmentUsecase>(),
          await getAsync<_i28.AcceptingappointmentUsecase>(),
          await getAsync<_i33.GetAllappointmentsUsecase>(),
          await getAsync<_i34.GetappointmentUsecase>(),
          await getAsync<_i32.FilterappointmentUsecase>(),
        ));
    gh.factoryAsync<_i38.UserRepo>(() async => _i39.UserRepoImpl(
          userRemotedatasource: gh<_i11.UserRemotedatasource>(),
          userLocalSource: await getAsync<_i7.UserLocalSource>(),
        ));
    gh.factoryAsync<_i40.DoctorBloc>(() async => _i40.DoctorBloc(
          await getAsync<_i18.Getdoctorusecase>(),
          await getAsync<_i15.GetalldoctorsUsecase>(),
          await getAsync<_i16.GetdoctorbynameUsecase>(),
          await getAsync<_i17.Getdoctorsbyspecialization>(),
        ));
    gh.factory<_i41.AuthBloc>(() => _i41.AuthBloc(
          gh<_i26.RegisterUsecase>(),
          gh<_i25.LoginUsecase>(),
          gh<_i23.ResetPasswordUsecase>(),
          gh<_i24.DeleteUsecase>(),
          gh<_i36.Uploaduserdata>(),
          gh<_i35.DoctoruploaddataUsecase>(),
          gh<_i27.UsersignoutUsecase>(),
        ));
    gh.lazySingletonAsync<_i42.DeleteuserdataUsecase>(() async =>
        _i42.DeleteuserdataUsecase(userRepo: await getAsync<_i38.UserRepo>()));
    gh.lazySingletonAsync<_i43.EdituserdataUsecase>(() async =>
        _i43.EdituserdataUsecase(userRepo: await getAsync<_i38.UserRepo>()));
    gh.lazySingletonAsync<_i44.GetuserdataUsecase>(() async =>
        _i44.GetuserdataUsecase(userRepo: await getAsync<_i38.UserRepo>()));
    gh.factoryAsync<_i45.UserBloc>(() async => _i45.UserBloc(
          await getAsync<_i44.GetuserdataUsecase>(),
          await getAsync<_i43.EdituserdataUsecase>(),
          await getAsync<_i42.DeleteuserdataUsecase>(),
        ));
    return this;
  }
}

class _$HTTPModule extends _i46.HTTPModule {}

class _$SharedPrefsModule extends _i46.SharedPrefsModule {}

class _$UuidModule extends _i46.UuidModule {}
