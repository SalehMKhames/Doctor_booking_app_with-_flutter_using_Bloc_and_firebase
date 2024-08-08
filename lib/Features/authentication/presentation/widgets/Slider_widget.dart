import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderWidget> {
  List imageList = [
    {"id": 1, "image_path": 'assets/1.jpg'},
    {"id": 2, "image_path": 'assets/3.jpg'},
    {"id": 3, "image_path": 'assets/2.jpg'},
    {"id": 4, "image_path": 'assets/4.jpg'},
    {"id": 5, "image_path": 'assets/5.jpg'},
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column
      (
        children:
        [
          CarouselSlider
          (
            items: imageList.map(
                    (item) => Image.asset(item['image_path'], fit: BoxFit.cover, width: double.infinity,),
            ).toList(),
            carouselController: carouselController,
            options: CarouselOptions(
                scrollPhysics: const BouncingScrollPhysics(),
                autoPlay: true,
                aspectRatio: .5,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {currentIndex = index;});
                },
              ),
            ),
          ]
      ),
    );
  }
}
