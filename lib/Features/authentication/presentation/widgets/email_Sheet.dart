import 'package:doctory/Features/authentication/presentation/auth_Bloc/auth_bloc.dart';
import 'package:doctory/core/Themes/App_Theme.dart';
import 'package:doctory/core/utils/Strings.dart';
import 'package:doctory/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailSheet extends StatefulWidget {
  const EmailSheet({super.key});

  @override
  State<EmailSheet> createState() => _EmailDialogState();
}

class _EmailDialogState extends State<EmailSheet> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _checkPassword = TextEditingController();

  bool _obscureText = true;
  bool _checkObscureText = true;
  bool _isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: BottomSheet(
          elevation: 0.5,
          enableDrag: true,
          onClosing: () {},
          builder: (_) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                margin: const EdgeInsets.all(25),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _isLogin
                          ? S.of(context).Sign_in
                          : S.of(context).Create_Account,
                      style: TextStyle(
                          fontSize: 22,
                          color: AppTheme().themData.primaryColor),
                      softWrap: true,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 18,
                    ),

                    //this form field for the email
                    TextFormField(
                      controller: _email,
                      style: GoogleFonts.notoSans(fontSize: 14),
                      keyboardType: TextInputType.emailAddress,
                      autofocus: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.person_outline,
                          color: Colors.black,
                        ),
                        label: Text(
                          S.of(context).Email,
                          style: const TextStyle(color: Colors.black),
                        ),
                        hintText: 'User@example.com',
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black26),
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black26),
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context).Please_enter_your_email;
                        } else if (!EmailValid.hasMatch(value)) {
                          return S.of(context).Please_enter_Avalid_email;
                        }

                        return null;
                      },
                      onSaved: (val) {
                        _email.text = val!;
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),

                    //This form field for the password
                    TextFormField(
                      controller: _password,
                      obscureText: _obscureText,
                      autofocus: true,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          icon: Icon(_obscureText
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined),
                        ),
                        prefixIcon: const Icon(
                          Icons.key,
                          color: Colors.black,
                        ),
                        label: Text(
                          S.of(context).Password,
                          style: const TextStyle(color: Colors.black),
                        ),
                        hintText: S.of(context).Enter_Password,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black26),
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black26),
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context).Please_enter_your_Password;
                        } else if (value.length < 8) {
                          return S
                              .of(context)
                              .Password_must_be_at_least_8_characters;
                        } else {
                          return null;
                        }
                      },
                    ),

                    const SizedBox(
                      height: 10.0,
                    ),

                    //This form field is for checking if the password is correct,
                    //and it will appear if the user is in the register mode
                    if (!_isLogin)
                      TextFormField(
                        controller: _checkPassword,
                        obscureText: _checkObscureText,
                        autofocus: true,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _checkObscureText = !_checkObscureText;
                              });
                            },
                            icon: Icon(_checkObscureText
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined),
                          ),
                          prefixIcon: Icon(
                            Icons.key,
                            color: Colors.black,
                          ),
                          label: Text(
                            S.of(context).Confirm_Password,
                            style: TextStyle(color: Colors.black),
                          ),
                          hintText: S.of(context).Re_enter_Password,
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26),
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26),
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return S.of(context).Please_reenter_your_Password;
                          } else if (value.length < 8) {
                            return S
                                .of(context)
                                .Password_must_be_at_least_8_characters;
                          } else if (value != _checkPassword.text) {
                            return S
                                .of(context)
                                .Your_password_not_correct_please_retype_it;
                          } else {
                            return null;
                          }
                        },
                      ),

                    ///This Row for containing the TextButton that will convert the BottomSheet
                    ///to the BottomSheet that contains the Register
                    Row(
                      children: [
                        Text(
                          _isLogin
                              ? S.of(context).First_time_to_use
                              : S.of(context).Already_have_an_account,
                          style: GoogleFonts.notoSans(fontSize: 12),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _isLogin = !_isLogin;
                            });
                          },
                          child: Text(
                              _isLogin
                                  ? S.of(context).SignUp
                                  : S.of(context).Login,
                              style: GoogleFonts.notoSans(fontSize: 12)),
                        )
                      ],
                    ),

                    //This button work for Signing up or Signing in methods based on what logic
                    //we write in [auth_bloc] and in the authentication repo impl
                    ElevatedButton(
                      onPressed: () async {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }
                        _formKey.currentState!.save();

                        if (_isLogin) {
                          BlocProvider.of<AuthBloc>(context).add(LogInEvent(
                              email: _email.text, password: _password.text));
                        } else {
                          BlocProvider.of<AuthBloc>(context).add(SignUpEvent(
                              email: _email.text, password: _password.text));
                        }
                      },
                      child: Text(
                        _isLogin ? S.of(context).Login : S.of(context).SignUp,
                        style: GoogleFonts.notoSans(fontSize: 14),
                      ),
                    ),

                    const SizedBox(
                      height: 5,
                    ),

                    BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
                      if (state.userRegister == UserAuthStatus.loading) {
                        return LinearProgressIndicator(
                          color: AppTheme().themData.primaryColor,
                          minHeight: 5,
                        );
                      } else {
                        return const SizedBox();
                      }
                    }),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
