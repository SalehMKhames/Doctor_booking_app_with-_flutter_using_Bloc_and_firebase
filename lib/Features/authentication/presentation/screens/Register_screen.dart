import 'package:doctory/Features/authentication/presentation/auth_Bloc/auth_bloc.dart';
import 'package:doctory/Features/home/pages/Home.dart';
import 'package:doctory/Features/home/widgets/register_screen_widgets/Slider_widget.dart';
// import 'package:doctory/Features/home/widgets/register_screen_widgets/register_body.dart';
import 'package:doctory/core/utils/widgets/my_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) =>
          previous.userRegister == UserAuthStatus.loading && current.userRegister == UserAuthStatus.success
        || previous.userRegister == UserAuthStatus.loading && current.userRegister == UserAuthStatus.failed,
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
      child: SingleChildScrollView(
        child: Stack
          (
          children:
          [
            const SizedBox(width: double.infinity, child: SliderScreen()),
            Column(
              children: [
                Padding
                (
                  padding: const EdgeInsets.only(top: 150.0),
                  child: Container
                    (
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: const BorderRadius.only
                          (topLeft: Radius.circular(50), topRight: Radius.circular(50))
                    ),
                    child: Padding
                    (
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      child: Form
                      (
                        key: _SignInkey,
                        child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: const EdgeInsets.only(top: 10.0, bottom: 20),
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 25),
                                  ),
                                ),
                                TextFormField(
                                  controller: Email,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.person_outline,
                                      color: Colors.black,
                                    ),
                                    label: Text(
                                      "Email",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    hintText: 'Enter Email',
                                    hintStyle: TextStyle(
                                      color: Colors.black26,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.black26),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.black26),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                    ),
                                  ),
                                  validator: (value)
                                  {
                                    if (value == null || value.isEmpty)
                                      return "Please enter your Emial";
                                    else if (!EmailValid.hasMatch(value))
                                      return 'Pleas enter valid Email';
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 15,),
                                TextFormField(
                                  controller: _Phone,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.phone,
                                      color: Colors.black,
                                    ),
                                    label: Text(
                                      'Phone',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    hintText: 'Enter Number',
                                    hintStyle: TextStyle(
                                      color: Colors.black26,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.black26),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.black26),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty)
                                      return "Please enter your Number";
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 15,),
                                TextFormField(
                                  controller: _Password,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.key,
                                      color: Colors.black,
                                    ),
                                    suffixIcon: Icon(Icons.visibility_off),
                                    label: Text(
                                      "Password",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    hintText: 'Enter Password',
                                    hintStyle: TextStyle(
                                      color: Colors.black26,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.black26),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.black26),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty)
                                      return "Please enter your Password";
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 15,),
                                TextFormField(
                                  controller: _ConfirmPassword,
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    suffixIcon: Icon(Icons.visibility),
                                    prefixIcon: Icon(
                                      Icons.keyboard,
                                      color: Colors.black,
                                    ),
                                    label: Text(
                                      "Consfirm Password",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    hintText: 'Enter Password Again',
                                    hintStyle: TextStyle(
                                      color: Colors.black26,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.black26),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.black26),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty)
                                      return "Please enter your Password Again";
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 20,),
                                Container
                                (
                                  width: 200,
                                  decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(30)),
                                  child: TextButton
                                  (
                                    onPressed: () async
                                    {
                                      if (_SignInkey.currentState!.validate())
                                      {
                                        try {
                                          BlocProvider.of<AuthBloc>(context).add(SignUpEvent(email: Email.text, password: _Password.text));
                                        }
                                        catch (E) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                              content: Text(E.toString())));
                                        }
                                      }
                                    },
                                    child: Text("Sign Up",
                                        style: TextStyle(
                                            color: Colors.grey[300],
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:
                                  [
                                    Text("Already have an account?", style:
                                    TextStyle(color: Colors.black45, fontSize: 15),
                                    ),
                                  ],
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
