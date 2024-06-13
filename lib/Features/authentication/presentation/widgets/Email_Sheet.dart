import 'package:doctory/Features/authentication/presentation/auth_Bloc/auth_bloc.dart';
import 'package:doctory/core/Themes/App_Theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailSheet extends StatefulWidget
{
  const EmailSheet({super.key});

  @override
  State<EmailSheet> createState() => _EmailDialogState();
}

class _EmailDialogState extends State<EmailSheet>
{

  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _checkPassword = TextEditingController();

  final RegExp EmailValid = RegExp(
      r"^([a-zA-Z0-9_\-.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$");

  bool _isLogin = true;
  bool _obscureText = true;
  bool _checkObscureText = true;

  @override
  void dispose() {
    _password.dispose();
    _checkPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context)
  {
    return Form
      (
      key: _formKey,
      child: BottomSheet
      (
        elevation: 0.5,
        enableDrag: true,
        onClosing: (){},
        builder: (_)
        {
          return Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container
            (
              margin: const EdgeInsets.all(25),
              child: Column
              (
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                [
                  const Text
                  (
                    "Please, fill the following fields:",
                    style: TextStyle(fontSize: 16),
                    softWrap: true,
                  ),
                  const SizedBox(height: 18,),
                  //this form field for the email
                  TextFormField(
                    controller: _email,
                    style: GoogleFonts.notoSans(fontSize: 14),
                    keyboardType: TextInputType.emailAddress,
                    autofocus: true,
                    decoration: const InputDecoration
                      (
                        prefixIcon: Icon(Icons.person_outline, color: Colors.black,),
                        label: Text("Email", style: TextStyle(color: Colors.black),),
                        hintText: 'User@example.com',

                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black26),
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black26),
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                    ),
                    validator:  (value)
                    {
                      if (value == null || value.isEmpty) {
                      return "Please enter your email";
                      }
                      else if (!EmailValid.hasMatch(value))
                      {return 'Please enter a valid email';}

                      return null;
                    },
                    onSaved: (val){_email.text = val!;},
                  ),

                  const SizedBox(height: 10.0,),
                  //This form field for the password
                  TextFormField(
                    controller: _password,
                    obscureText: _obscureText,
                    autofocus: true,
                    decoration: InputDecoration
                    (
                      suffixIcon: IconButton
                        (
                          onPressed: (){
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          icon: Icon(_obscureText? Icons.visibility_outlined : Icons.visibility_off_outlined),
                        ),
                      prefixIcon:const Icon(Icons.key, color: Colors.black,),
                      label: const Text("Password", style: TextStyle(color: Colors.black),),
                      hintText: 'Enter Password',

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
                      if (value == null || value.isEmpty)
                        {return "Please enter your Password";}
                      else if(value.length < 8)
                        {return "Password must be at least 8 characters";}
                      else
                        {return null;}
                    },
                  ),

                  const SizedBox(height: 10.0,),
                  //This form field is for checking if the password is correct,
                  //and it will appear if the user is in the register mode
                  if(!_isLogin)
                    TextFormField
                    (
                      controller: _checkPassword,
                      obscureText: _checkObscureText,
                      autofocus: true,
                      decoration: InputDecoration
                      (
                        suffixIcon: IconButton
                        (
                          onPressed: (){
                            setState(() { _checkObscureText = !_checkObscureText;});
                          },
                          icon: Icon(_checkObscureText? Icons.visibility_outlined : Icons.visibility_off_outlined),
                        ),
                        prefixIcon:const Icon(Icons.key, color: Colors.black,),
                        label: const Text("Confirm Password", style: TextStyle(color: Colors.black),),
                        hintText: 'Re-enter Password',

                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black26),
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black26),
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                      ),
                      validator: (value)
                      {
                        if (value == null || value.isEmpty)
                        {return "Please reenter your Password";}
                        else if(value.length < 8)
                        {return "Password must be at least 8 characters";}
                        else if(value != _checkPassword.text)
                        {return "Your password not correct, please retype it";}
                        else
                          {return null;}
                      },
                    ),

                  //This Row for containing the TextButton that will convert the BottomSheet
                  //to the BottomSheet that contains the Register
                  Row
                  (
                    children:
                    [
                      Text(_isLogin? "Do not have an account:" : "Already have an account:", style: GoogleFonts.notoSans(fontSize: 12),),
                      TextButton
                      (
                        child: Text(_isLogin? "Register now!": "Sign In", style: GoogleFonts.notoSans(fontSize: 12, color: Colors.indigo),),
                        onPressed: (){setState(() {_isLogin = !_isLogin;});},
                      ),
                    ],
                  ),

                  //This button work for Signing up or Signing in methods based on what logic
                  //we write in [auth_bloc] and in the authentication repo impl
                  ElevatedButton
                  (
                    onPressed:()
                    {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      _formKey.currentState!.save();

                      if(_isLogin)
                      { BlocProvider.of<AuthBloc>(context).add(LogInEvent(email: _email.text, password: _password.text));}
                      else {
                        BlocProvider.of<AuthBloc>(context).add(SignUpEvent(email: _email.text, password: _password.text));
                      }
                    },
                    child: Text(_isLogin? "Log in" : "Sign up", style: GoogleFonts.notoSans(fontSize: 14),),
                  ),
                  const SizedBox(height: 5,),
                  BlocBuilder<AuthBloc, AuthState>
                  (
                    builder: (context, state)
                    {
                      if (state.userRegister == UserAuthStatus.loading) {
                        return LinearProgressIndicator(color: AppTheme().themData.primaryColor,);
                      } else {
                          return const SizedBox();
                      }
                    }
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }

}
