import 'dart:io';

import 'package:doctory/Features/home/Widgets/avatars/circle_avatar_with_text_label.dart';
import 'package:doctory/common/Doctor/BLOC/doctor_bloc.dart';
import 'package:doctory/common/Doctor/Presentation/screens/doctor_profile.dart';

import 'package:doctory/core/utils/src/doctor_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/v4.dart';


class SpecializeScreen extends StatefulWidget {
  const SpecializeScreen({super.key});

  @override
  State<SpecializeScreen> createState() => _SpecializeScreenState();
}

class _SpecializeScreenState extends State<SpecializeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const SizedBox(height: 20,),
          GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
                crossAxisSpacing: 25,
                mainAxisSpacing: 15),
            children: DoctorCategory.values
                .map(
                  (category) =>
                  Expanded(
                    child: GestureDetector(
                      child: CircleAvatarWithTextLabel(
                          icon: category.icon,
                          label: category.name
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => DoctorsList(special: category.name,)));
                      },
                    ),
                  ),
            )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class DoctorsList extends StatefulWidget {
  final String special;

  const DoctorsList({super.key, required this.special});

  @override
  State<DoctorsList> createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<DoctorBloc, DoctorState>
      (
        buildWhen: (previous, current) =>
            previous.getDoctorsBySpecialState == DoctorStatus.loading && current.getDoctorsBySpecialState == DoctorStatus.success,
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.allDoctors?.length,
            itemBuilder: (context, i) {
              return Column(
                children: [
                  ListTile(
                    title: Text(state.allDoctors![i].name),
                    subtitle: Text(state.allDoctors![i].address),
                    leading: CircleAvatar(
                      child: Image.file(state.allDoctors![i].profileImage as File),
                    ),
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => DoctorProfile(id: state.allDoctors![i].id)));
                    },
                  ),
                  const SizedBox(height: 10)
                ],
              );
            },
          );
        },
      ),
    );
  }
}

