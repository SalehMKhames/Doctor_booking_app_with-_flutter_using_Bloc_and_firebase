import 'package:doctory/Features/authentication/presentation/auth_Bloc/auth_bloc.dart';
import 'package:doctory/Features/home/pages/Home.dart';
import 'package:doctory/Features/home/widgets/register_screen_widgets/register_body.dart';
import 'package:doctory/core/utils/widgets/my_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) =>
          previous.userRegister == UserAuthStatus.loading && current.userRegister == UserAuthStatus.success
        || previous.userRegister == UserAuthStatus.loading && current.userRegister == UserAuthStatus.failed,
      listener: (context, state)
        {
          if (state.userRegister == UserAuthStatus.failed) {
            ScaffoldMessenger.of(context).showSnackBar(
                MySnackBar.call(state.message!, Colors.white70, Colors.red));
          }
          if (state.userRegister == UserAuthStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
                MySnackBar.call(state.message!, Colors.green, Colors.white));

            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) {
                  return const HomePage();
                }));
          }

        },
      child: const RegisterBody(),
    );
  }
}
