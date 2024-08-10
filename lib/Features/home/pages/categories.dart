import 'package:doctory/Features/home/Widgets/avatars/circle_avatar_with_text_label.dart';
import 'package:doctory/core/utils/src/doctor_category.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 20),
        itemCount: DoctorCategory.values.length,
        itemBuilder: (context, i) {
          final Category = DoctorCategory.values[i];
          return CircleAvatarWithTextLabel(
            icon: Category.icon,
            label: Category.name,
          );
        },
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    ));
  }
}
