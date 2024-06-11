import 'package:doctory/Features/authentication/presentation/auth_Bloc/auth_bloc.dart';
import 'package:doctory/Features/home/pages/Home.dart';
import 'package:doctory/Features/authentication/presentation/widgets/Slider_widget.dart';
import 'package:doctory/core/Themes/App_Theme.dart';
import 'package:doctory/core/utils/widgets/my_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  GlobalKey<FormState> _SignInkey = GlobalKey();
  TextEditingController Email = TextEditingController();
  TextEditingController _Phone = TextEditingController();
  TextEditingController _ConfirmPassword = TextEditingController();
  TextEditingController _Password = TextEditingController();

  final RegExp EmailValid = RegExp(
      r"^([a-zA-Z0-9_\-.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$");


  @override
  Widget build(BuildContext context)
  {
    return BlocListener<AuthBloc, AuthState>
    (
      listenWhen: (previous, current) =>
      previous.userRegister == UserAuthStatus.loading && current.userRegister == UserAuthStatus.success
          || previous.userRegister == UserAuthStatus.loading && current.userRegister == UserAuthStatus.failed,
      //LISTENER
      listener: (context, state)
      {
        if (state.userRegister == UserAuthStatus.failed)
        {
          ScaffoldMessenger.of(context).showSnackBar(
              MySnackBar.call(/*state.message!*/"HEloocljsdofh", Colors.white70, Colors.red));
        }
        if (state.userRegister == UserAuthStatus.success)
        {
          ScaffoldMessenger.of(context).showSnackBar(
              MySnackBar.call("HElo", Colors.green, Colors.white));

          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) {
                return const HomePage();
              }));
        }
      },

      //CHILD
      child: Center(
        child: Column
        (
          children:
          [
            const SliderScreen(),
            Container
            (
              height: MediaQuery.of(context).size.height /4,
              color: Colors.red,
              child: Column
              (
                mainAxisAlignment: MainAxisAlignment.start,
                children:
                [
                  Text("Welcome," , style: GoogleFonts.dmSerifText(textStyle: AppTheme().themData.textTheme.headlineLarge),),
                  Text("In just 3 steps, you can:\n•Name the doctor\n•Select an appointment\n•Go",
                        style: GoogleFonts.merriweather(textStyle: AppTheme().themData.textTheme.headlineSmall),
                      ),
                ],
              ),
            ),
          ],//chldren
        ),
      ),

    );
  }
}
