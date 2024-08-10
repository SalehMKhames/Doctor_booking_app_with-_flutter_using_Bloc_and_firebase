import 'package:doctory/Features/authentication/presentation/auth_Bloc/auth_bloc.dart';
import 'package:doctory/Features/authentication/presentation/screens/Providing_user_info.dart';
import 'package:doctory/Features/authentication/presentation/widgets/email_Sheet.dart';
import 'package:doctory/Features/authentication/presentation/widgets/Slider_widget.dart';
import 'package:doctory/Features/home/pages/Home.dart';
import 'package:doctory/core/Themes/App_Theme.dart';
import 'package:doctory/core/utils/widgets/my_snack_bar.dart';
import 'package:doctory/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) =>
          (previous.userRegister == UserAuthStatus.loading &&
                  current.userRegister == UserAuthStatus.success ||
              previous.userRegister == UserAuthStatus.loading &&
                  current.userRegister == UserAuthStatus.failed) ||
          (previous.userLogIn == UserAuthStatus.loading &&
                  current.userLogIn == UserAuthStatus.success ||
              previous.userLogIn == UserAuthStatus.loading &&
                  current.userLogIn == UserAuthStatus.failed),

      listener: (context, state) {
        //The Register
        if (state.userRegister == UserAuthStatus.failed) {
          ScaffoldMessenger.of(context).showSnackBar(MySnackBar.call(
              state.message!,
              AppTheme().themData.colorScheme.errorContainer,
              AppTheme().themData.colorScheme.error));
        }
        if (state.userRegister == UserAuthStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(MySnackBar.call(
              state.message!, Colors.teal, Colors.white70)); //snackBar

          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            return ProvidingInfoScreen(email: state.credentials!.email);
          }));
        }
        //The Log in
        if (state.userLogIn == UserAuthStatus.failed) {
          ScaffoldMessenger.of(context).showSnackBar(MySnackBar.call(
              state.message!,
              AppTheme().themData.colorScheme.errorContainer,
              AppTheme().themData.colorScheme.error));
        }
        if (state.userLogIn == UserAuthStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(MySnackBar.call(
              state.message!, Colors.teal, Colors.white70)); //snackBar

          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
            return HomeScreen(id: state.credentials!.localId);
          }));
        }
      },

      //The UI
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          // actions: [
          //   DropdownButton(items: const [
          //     DropdownMenuItem(child: Icon(Icons.flag)),
          //     DropdownMenuItem(child: Icon(Icons.language))
          //   ], onChanged: (index) {})
          // ],
        ),
        body: Stack(children: [
          const SliderWidget(),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
              Colors.black.withOpacity(.9),
              Colors.black.withOpacity(.4),
            ])),
          ),
          Container(
            margin: const EdgeInsets.all(12),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    S.of(context).title,
                    style: GoogleFonts.dmSerifText(
                        fontSize: 42, color: Colors.white70),
                  ),
                  Text(S.of(context).description,
                      style: GoogleFonts.merriweather(
                          fontSize: 16, color: Colors.white70)),
                  // const SizedBox(
                  //   height: 18,
                  // ),

                  //Register Button

                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: const Color(0xff909CDF),
                    ),
                    child: TextButton(
                      child: Text(
                        S.of(context).btnStart,
                        style:
                            const TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (ctx) {
                              return const EmailSheet();
                            });
                      },
                    ),
                  ),
                ]),
          ),
        ]),
      ),
    );
  }
}
