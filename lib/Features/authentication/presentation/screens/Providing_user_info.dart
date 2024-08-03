import 'package:doctory/Features/authentication/presentation/auth_Bloc/auth_bloc.dart';
import 'package:doctory/Features/home/pages/Home.dart';
import 'package:doctory/core/Themes/App_Theme.dart';
import 'package:doctory/core/utils/widgets/my_snack_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ProvidingInfoScreen extends StatefulWidget
{
  final String email;
  const ProvidingInfoScreen({super.key, required this.email});

  @override
  State<ProvidingInfoScreen> createState() => _ProvidingInfoScreenState();
}

class _ProvidingInfoScreenState extends State<ProvidingInfoScreen>
{
  final TextEditingController nameField = TextEditingController();
  final TextEditingController phoneField = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController medicalStatusField = TextEditingController();
  DateTime? _selectedTime;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>
      (
        listenWhen: (previous, current) =>
        (previous.userUploadInfo == UserAuthStatus.loading && current.userUploadInfo == UserAuthStatus.failed) ||
            (previous.userUploadInfo == UserAuthStatus.loading && current.userUploadInfo == UserAuthStatus.success),

        listener: (context, state)
        {
          if (state.userUploadInfo == UserAuthStatus.failed) {
            ScaffoldMessenger.of(context).showSnackBar(MySnackBar.call(
                state.message!,
                AppTheme().themData.colorScheme.errorContainer,
                AppTheme().themData.colorScheme.error));
          }
          if (state.userUploadInfo == UserAuthStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(MySnackBar.call(state.message!, Colors.teal, Colors.white70)); //snackBar

            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
              return const HomeScreen();
            }));
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: Center(
              child: Container(
                margin: const EdgeInsets.all(20),
                child: Column
                (
                  children: [
                    //The field used for typing the name
                    TextFormField(
                      controller: nameField,
                      style: GoogleFonts.notoSans(fontSize: 14),
                      keyboardType: TextInputType.name,
                      autofocus: true,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.person_outline,
                          color: Colors.black,
                        ),
                        label: Text(
                          "Name",
                          style: TextStyle(color: Colors.black),
                        ),
                        hintText: 'Enter your name',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black26),
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black26),
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your name";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (val) {
                        nameField.text = val!;
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),

                    //The field used for typing the phone
                    TextFormField(
                      controller: phoneField,
                      style: GoogleFonts.notoSans(fontSize: 14),
                      keyboardType: TextInputType.number,
                      autofocus: true,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.phone_outlined,
                          color: Colors.black,
                        ),
                        label: Text(
                          "Phone",
                          style: TextStyle(color: Colors.black),
                        ),
                        hintText: 'Enter your phone number',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black26),
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black26),
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your phone";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (val) {
                        phoneField.text = val!;
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),

                    // A TextField for picking the user birth date
                    TextField(
                      controller: dateController,
                      readOnly: true, // Prevent manual editing
                      decoration: InputDecoration(
                        hintText: 'Select Date',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.calendar_today),
                          onPressed: () => _selectDate(context),
                        ),
                      ),
                      onTap: () =>
                          _selectDate(context), // Open date picker on tap
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),

                    //The field used for typing the medical description
                    TextFormField(
                      controller: medicalStatusField,
                      style: GoogleFonts.notoSans(fontSize: 14),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.medical_services_outlined,
                          color: Colors.black,
                        ),
                        label: Text(
                          "Medical Status",
                          style: TextStyle(color: Colors.black),
                        ),
                        hintText: 'Please, enter your diseases and medicines.',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black26),
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black26),
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please, enter your diseases and the medicines that you are taking.";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (val) {
                        medicalStatusField.text = val!;
                      },
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),

                    //A Button for sending the registered user's data to the FireBase Database
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<AuthBloc>(context).add(UserUploadEvent(
                            name: nameField.text,
                            email: widget.email,
                            birth: dateController.text,
                            phone: phoneField.text,
                            medicalStatus: medicalStatusField.text));
                      },
                      child: const Text("Continue..."),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedTime ?? DateTime.now(),
      firstDate: DateTime(1940),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
        dateController.text = DateFormat('yyyy-MM-dd').format(_selectedTime!);
      });
    }
  }
}
