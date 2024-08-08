import 'package:doctory/Features/authentication/presentation/auth_Bloc/auth_bloc.dart';
import 'package:doctory/Features/authentication/presentation/screens/Register_screen.dart';
import 'package:doctory/Features/home/pages/Home.dart';
import 'package:doctory/common/Doctor/BLOC/doctor_bloc.dart';
import 'package:doctory/common/user/BLOC/user_bloc.dart';
//import 'package:doctory/common/user/presentation/User_Bloc/user_bloc.dart';
import 'package:doctory/core/Depend_injection/dependency_injection.dart';
import 'package:doctory/core/Themes/App_Theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';


void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  build(BuildContext context)
  {
    return MultiBlocProvider
      (
      providers:
      [
        BlocProvider<AuthBloc>(create: (_) => getIt<AuthBloc>()),
        BlocProvider<UserBloc>(create: (_) => getIt<UserBloc>(),),
        BlocProvider<DoctorBloc>(create: (_) => getIt<DoctorBloc>(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme().themData,
        home: const RegisterScreen(),
      ),
    );
  }
}
