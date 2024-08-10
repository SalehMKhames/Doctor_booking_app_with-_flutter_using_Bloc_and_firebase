import "dart:io";

import "package:doctory/Features/authentication/presentation/auth_Bloc/auth_bloc.dart";
import "package:doctory/common/user/BLOC/user_bloc.dart";
import "package:doctory/generated/l10n.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:uuid/v4.dart";

class ProfilePage extends StatefulWidget {
  final String id;

  const ProfilePage({Key? key, required this.id}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
{
  @override
  Widget build(BuildContext context)
  {
    return BlocBuilder<UserBloc, UserState>
    (
      buildWhen: (pre, cur) => pre.getUserState == UserDataStatus.loading && cur.getUserState == UserDataStatus.success,
      builder: (context, state)
      {
        return Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                margin: const EdgeInsets.all(30),
                width: double.infinity,
                child:  Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 30,
                    ),
                    CircleAvatar(
                      radius: 45.0,
                      backgroundImage: FileImage(state.data!.profilePicture as File),
                      backgroundColor: Colors.black87,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      state.data!.Name,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      state.data!.birthDate!,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded
            (
              flex: 5,
              child: Padding
              (
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView
                (
                  child: Column
                  (
                    children: [
                      Card(
                        elevation: 4,
                        child: ListTile(
                          leading: const Icon(
                            Icons.mail,
                            color: Colors.brown,
                          ),
                          title: Text(state.data!.email),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Card(
                        elevation: 4,
                        child: ListTile(
                          leading: const Icon(
                            Icons.phone,
                            color: Colors.brown,
                          ),
                          title: Text(state.data!.phone!),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Card(
                        elevation: 4,
                        child: ListTile(
                          leading: const Icon(
                            Icons.medical_information,
                            color: Colors.brown,
                          ),
                          title: Text(state.data!.medicalStatus!),
                          trailing: const Icon(Icons.edit),
                          onTap: () {
                            // Navigator.of(context).push(
                            //     MaterialPageRoute(builder: (context) => Edit()));
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Card(
                        elevation: 4,
                        child: ListTile(
                          leading: const Icon(
                            Icons.logout,
                            color: Colors.brown,
                          ),
                          title: Text(S.of(context).Sign_Out),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {BlocProvider.of<AuthBloc>(context).add(const SignOutEvent());},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
