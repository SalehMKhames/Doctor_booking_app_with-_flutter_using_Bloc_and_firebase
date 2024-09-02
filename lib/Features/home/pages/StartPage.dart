import 'package:doctory/Features/appointment/Presentation/bloc/appointment_bloc.dart';
import 'package:doctory/Features/home/Widgets/avatars/circle_avatar_with_text_label.dart';
import 'package:doctory/Features/home/Widgets/cards/appointemnt_preview_card.dart';
import 'package:doctory/Features/home/Widgets/section_title.dart';
import 'package:doctory/Features/home/pages/categories.dart';
import 'package:doctory/common/Doctor/BLOC/doctor_bloc.dart';
import 'package:doctory/common/Doctor/domain/entity/doctor.dart';
import 'package:doctory/common/user/BLOC/user_bloc.dart';
import 'package:doctory/core/Depend_injection/dependency_injection.dart';
import 'package:doctory/core/utils/src/doctor_category.dart';
import 'package:doctory/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Widgets/list_tiles/doctor_list_tile.dart';

class StartPage extends StatefulWidget {
  final String id;
  const StartPage({super.key, required this.id});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage>
{
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Text(
              S.of(context).title,
              style: textTheme.bodyMedium!.copyWith(
                  fontFamily: 'BriemHand', fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4.0),
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                return Text(
                            state.data!.Name,
                            style: textTheme.bodyLarge!.copyWith(
                              // fontWeight: FontWeight.bold,
                              fontFamily: 'jaro',
                              color: Colors.black87
                            ),
                          );
              },
            ),
            const SizedBox(height: 4.0),
          ],
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            _DoctorCategories(),
            SizedBox(
              height: 24.0,
            ),
            _MySchedule(),
            SizedBox(
              height: 24.0,
            ),
             // _NearbyDoctors(),
          ],
        ),
      ),
    );
  }
}

class _DoctorCategories extends StatelessWidget {
  const _DoctorCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SectionTitle(
            title: S.of(context).Specializations,
            action: S.of(context).See_all,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const Categories();
              }));
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: DoctorCategory.values
                .take(5)
                .map(
                  (Category) => Expanded(
                    child: CircleAvatarWithTextLabel(
                      icon: Category.icon,
                      label: Category.name,
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

class _MySchedule extends StatelessWidget {
  const _MySchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
            title: S.of(context).My_Schedule,
            action: S.of(context).See_all,
            onPressed: () {}
        ),
        const AppointemntPreviewCard(),
      ],
    );
  }
}


// class _NearbyDoctors extends StatelessWidget
// {
//   const _NearbyDoctors({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SectionTitle(
//           title: 'Nearby Doctors',
//           action: 'See all',
//           onPressed: () {},
//         ),
//         const SizedBox(height: 8.0),
//         ListView.separated(
//           physics: const NeverScrollableScrollPhysics(),
//           shrinkWrap: true,
//           separatorBuilder: (context, index) {
//             return const Divider(height: 24.0,);
//           },
//           itemCount: Doctor.sampleDoctors.length,
//           itemBuilder: (context, index) {
//             final doctor = Doctor.sampleDoctors[index];
//             return DoctorListTile(doctor: doctor);
//           },
//         ),
//       ],
//     );
//   }
// }
