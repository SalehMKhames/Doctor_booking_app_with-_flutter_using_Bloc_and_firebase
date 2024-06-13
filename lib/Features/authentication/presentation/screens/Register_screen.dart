import 'package:doctory/Features/authentication/presentation/auth_Bloc/auth_bloc.dart';
import 'package:doctory/Features/authentication/presentation/screens/user_info_providing_screen.dart';
import 'package:doctory/Features/authentication/presentation/widgets/Email_Sheet.dart';
import 'package:doctory/Features/authentication/presentation/widgets/Slider_widget.dart';
import 'package:doctory/core/Themes/App_Theme.dart';
import 'package:doctory/core/utils/widgets/my_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatelessWidget
{
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    return BlocListener<AuthBloc, AuthState>
      (
        listenWhen: (previous, current) =>
            previous.userRegister == UserAuthStatus.loading && current.userRegister == UserAuthStatus.success ||
            previous.userRegister == UserAuthStatus.loading && current.userRegister == UserAuthStatus.failed,
        //LISTENER
        listener: (context, state)
        {
          if (state.userRegister == UserAuthStatus.failed) {
            ScaffoldMessenger.of(context).showSnackBar
              (
                MySnackBar.call
                (
                  state.message!,
                  AppTheme().themData.colorScheme.errorContainer,
                  AppTheme().themData.colorScheme.error
                )
            );
          }
          if (state.userRegister == UserAuthStatus.success)
          {
            ScaffoldMessenger.of(context).showSnackBar(
                MySnackBar.call(state.message!,
                    AppTheme().themData.colorScheme.secondaryContainer,
                    Colors.white70
                )
            );//snackBar

            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (_) {
              return const ProvidingInfoScreen();
            }));
          }
        },

        //CHILD
        child: Stack
          (
            children:
            [
              const SliderWidget(),
              Container
              (
                margin: const EdgeInsets.all(12),
                child: Column
                (
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.end,
                   children:
                   [
                     Text("Welcome,", style: GoogleFonts.dmSerifText(fontSize: 42),),
                     Text(
                         "Just in 3 steps, book your appointment with a doctor:\n•Search for his name\n•Choose the time\n•GO",
                         style: GoogleFonts.merriweather(fontSize: 16)
                     ),
                     Container
                     (
                       width: double.infinity,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(40),
                         color: Colors.blueAccent,),
                       child: TextButton
                         (
                         child: const Text("Start use", style: TextStyle(fontSize: 15, color: Colors.white),),
                         onPressed: () {
                           showModalBottomSheet(
                             context: context,
                             isScrollControlled: true,
                             builder: (ctx) {
                               return const EmailSheet();
                             }
                           );
                         },
                       ),
                     ),
                   ]
                ),
              ),
            ]
          ),
    );
  }
}
