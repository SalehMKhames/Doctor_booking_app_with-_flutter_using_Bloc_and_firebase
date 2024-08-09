import 'dart:io';

import 'package:doctory/Features/authentication/presentation/auth_Bloc/auth_bloc.dart';
import 'package:doctory/Features/home/pages/Home.dart';
import 'package:doctory/core/Themes/App_Theme.dart';
import 'package:doctory/core/utils/src/doctor_category.dart';
import 'package:doctory/core/utils/widgets/my_snack_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

class ProvidingInfoScreen extends StatefulWidget {
  final String email;

  const ProvidingInfoScreen({super.key, required this.email});

  @override
  State<ProvidingInfoScreen> createState() => _ProvidingInfoScreenState();
}

class _ProvidingInfoScreenState extends State<ProvidingInfoScreen> {
  XFile? _image;
  final TextEditingController nameField = TextEditingController();
  final TextEditingController phoneField = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController medicalStatusField = TextEditingController();
  final TextEditingController bioField = TextEditingController();
  final TextEditingController addressField = TextEditingController();

  DateTime? _selectedTime;
  late int radioVal = 0;
  final int val = 0;
  String? _selectedSpecial;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
        listenWhen: (previous, current) =>
        ((previous.userUploadInfo == UserAuthStatus.loading && current.userUploadInfo == UserAuthStatus.failed) ||
            (previous.userUploadInfo == UserAuthStatus.loading && current.userUploadInfo == UserAuthStatus.success))
        ||
        ((previous.doctorUploadInfo == UserAuthStatus.loading && current.doctorUploadInfo == UserAuthStatus.failed) ||
        (previous.doctorUploadInfo == UserAuthStatus.loading && current.doctorUploadInfo == UserAuthStatus.success)),
        listener: (context, state)
        {
          if (state.userUploadInfo == UserAuthStatus.failed) {
            ScaffoldMessenger.of(context).showSnackBar(MySnackBar.call(
                state.message!,
                AppTheme().themData.colorScheme.errorContainer,
                AppTheme().themData.colorScheme.error));
          }
          if (state.userUploadInfo == UserAuthStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(MySnackBar.call(
                state.message!, Colors.teal, Colors.white70)); //snackBar

            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (_) {
              return HomeScreen(id: state.credentials!.email);
            }));
          }
        },


        child: Scaffold(
          appBar: AppBar(
            title: const Text("Provide your information:"),
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    margin: const EdgeInsets.all(8),
                    child: Text(
                      "Tell us how would you like to use the application:",
                      style: GoogleFonts.notoSans(
                          fontSize: 16, color: Colors.black87),
                    ),
                  ),
                  buildRadio(0, "User"),
                  buildRadio(1, "Doctor"),
                  GestureDetector(
                    child: _image != null
                        ? Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.0)),
                            height: 100,
                            width: 150,
                            child: CircleAvatar(
                              child: Image.file(File(_image!.path)),
                              radius: 40,
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.0)),
                            height: 100,
                            width: 150,
                            child: CircleAvatar(
                              child: Image.asset("assets/empty_profile.jpeg"),
                              radius: 40,
                            ),
                          ),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (ctx) {
                            return AlertDialog(
                              title: Text(
                                "Choose your profile image from:",
                                style: GoogleFonts.dmMono(fontSize: 16),
                              ),
                              actions: [
                                ListTile(
                                    leading: const Icon(Icons.photo_library),
                                    title: const Text('Gallery'),
                                    onTap: () {
                                      _pickImage(ImageSource.gallery);
                                      Navigator.of(context).pop();
                                    }),
                                ListTile(
                                    leading: const Icon(Icons.photo_camera),
                                    title: const Text('Camera'),
                                    onTap: () {
                                      _pickImage(ImageSource.camera);
                                      Navigator.of(context).pop();
                                    }),
                              ],
                            );
                          });
                    },
                  ),
                  const SizedBox(height: 20),
                  if (radioVal == 0)
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          margin: const EdgeInsets.all(20),
                          child: Column(
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
                                    borderSide:
                                        BorderSide(color: Colors.black26),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black26),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
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
                                    borderSide:
                                        BorderSide(color: Colors.black26),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black26),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
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
                                onTap: () => _selectDate(
                                    context), // Open date picker on tap
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),

                              //The field used for typing the medical description
                              TextFormField(
                                controller: medicalStatusField,
                                style: GoogleFonts.notoSans(fontSize: 14),
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 15.0, horizontal: 10.0),
                                  prefixIcon: Icon(
                                    Icons.medical_services_outlined,
                                    color: Colors.black,
                                  ),
                                  label: Text(
                                    "Medical Status",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  hintText:
                                      'Please, enter your diseases and medicines.',
                                  border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black26),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black26),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
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
                                  BlocProvider.of<AuthBloc>(context).add(
                                      UserUploadEvent(
                                          dbName: "Users",
                                          name: nameField.text,
                                          email: widget.email,
                                          birth: dateController.text,
                                          phone: phoneField.text,
                                          medicalStatus:
                                              medicalStatusField.text));
                                },
                                child: const Text("Continue..."),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  else
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          margin: const EdgeInsets.all(20),
                          child: Column(
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
                                    borderSide:
                                        BorderSide(color: Colors.black26),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black26),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
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

                              //The field used for typing the bio
                              TextFormField(
                                controller: bioField,
                                style: GoogleFonts.notoSans(fontSize: 14),
                                keyboardType: TextInputType.text,
                                autofocus: true,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 15.0, horizontal: 10.0),
                                  prefixIcon: Icon(
                                    Icons.account_circle_outlined,
                                    color: Colors.black,
                                  ),
                                  label: Text(
                                    "Bio",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  hintText: 'Bio',
                                  border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black26),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black26),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
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
                                  bioField.text = val!;
                                },
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),

                              //For the address
                              TextFormField(
                                controller: addressField,
                                style: GoogleFonts.notoSans(fontSize: 14),
                                keyboardType: TextInputType.text,
                                autofocus: true,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                                  prefixIcon: Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.black,
                                  ),
                                  label: Text(
                                    "Address",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  hintText: 'Please enter your address',
                                  border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black26),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black26),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
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
                                  addressField.text = val!;
                                },
                              ),

                              //For the doctor to choose the specialization
                              DropdownButton(
                                items: DoctorCategory.values.map((category) {
                                  return DropdownMenuItem<String>(
                                    value: category.name,
                                    child: Text(category.name),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedSpecial = value;
                                  });
                                },
                                value: _selectedSpecial,
                                hint: Text(
                                  "Choose your specialization:",
                                  style: GoogleFonts.notoSans(fontSize: 16),
                                ),
                              ),
                              const SizedBox(
                                height: 30.0,
                              ),

                              //A Button for sending the registered user's data to the FireBase Database
                              ElevatedButton(
                                onPressed: () {
                                  BlocProvider.of<AuthBloc>(context).add(
                                      DoctorUploadEvent(
                                          dbName: "Doctors",
                                          name: nameField.text,
                                          bio: bioField.text,
                                          profileImage: _image!,
                                          category: _selectedSpecial!,
                                          address: addressField.text));
                                },
                                child: const Text("Continue..."),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                ],
              ),
            ),
          ),
        ));
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

  RadioListTile buildRadio(int value, String title) {
    return RadioListTile(
      value: value,
      groupValue: radioVal,
      onChanged: (v) {
        setState(() {
          radioVal = v!;
        });
      },
      title: Text(
        title,
        style: GoogleFonts.notoSans(fontSize: 16, color: Colors.black87),
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? image = await picker.pickImage(source: source);
      if (image != null) {
        setState(() {
          _image = image;
        });
      }
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
